### reactrouterv6 权鉴

```tsx
import React, { useContext, useEffect, useMemo, useState } from "react";
import {
  BrowserRouter,
  HashRouter,
  useRoutes,
  useLocation,
  useNavigate,
} from "react-router-dom";
import SuspenseCom from "./SuspenseCom";
import { MinRouterListType, MinRouterPropsType } from "./type";

const RouterContext = React.createContext<Partial<MinRouterPropsType>>({});

const MinRouter = (props: MinRouterPropsType) => {
  const { isHash = false } = props;
  const Router = isHash ? HashRouter : BrowserRouter;
  console.log("test  MinRouter");
  return (
    <RouterContext.Provider value={{ ...props }}>
      <Router>
        <Routers />
      </Router>
    </RouterContext.Provider>
  );
};

const Routers = () => {
  const { routes } = useContext(RouterContext);
  // 这里会有一次合并路由会导致执行两次
  const routesList = useMemo(() => loopRouter(routes, []), []);
  const element = useRoutes(routesList);
  return element;
};

function loopRouter(routes, paths) {
  return routes.map((routeItem) => {
    let { async, children } = routeItem;
    let newPaths = [...paths, routeItem.path];
    routeItem.element = (
      <AnthCom {...routeItem} paths={newPaths}>
        {routeItem.element}
      </AnthCom>
    );
    console.log(11212);
    if (async) {
      routeItem.element = <SuspenseCom>{routeItem.element}</SuspenseCom>;
    }
    if (children) {
      children = loopRouter(children, newPaths);
    }
    return routeItem;
  });
}

function AnthCom(props: Omit<MinRouterListType & { paths: [] }, "children">) {
  const { middleware, noSignIn } = useContext(RouterContext);
  const location = useLocation();
  const navigate = useNavigate();
  const [toPage, setTo] = useState("");
  useEffect(() => {
    let routerPaths = "";
    let pathname = location.pathname;
    props.paths.forEach((item) => item != "/" && (routerPaths += item));
    if (routerPaths === pathname) {
      // console.log(routerPaths, pathname);
      const { to } = compose(middleware)({ ...props, to: "" });
      if (to && !noSignIn.find((item) => item === props.path)) {
        setTo(to);
      }
    }
  });

  function compose(funcs) {
    if (funcs.length === 0) {
      return (arg) => arg;
    }

    if (funcs.length === 1) {
      return funcs[0];
    }

    return funcs.reduce((a, b) => {
      return (args, to) => a(b(args, to));
    });
  }

  if (toPage && !noSignIn.find((item) => item === props.path)) {
    return <Navigate to={toPage} />;
  }
  return <>{props.children}</>;
}

export default MinRouter;
```

这其中有一个 bug 是由 useMemo hooks 钩子 和 Navigate 组件 一起导致的
在外部通过传递进来的 middleware 鉴定是否登录 但是在一次 loopRouter 最终返回的是 Navigate 组件导致之后登录需要按两次才会登录

需要修改成

```tsx
import React, { useContext, useEffect, useMemo } from "react";
import {
  BrowserRouter,
  HashRouter,
  useRoutes,
  useLocation,
  useNavigate,
} from "react-router-dom";
import SuspenseCom from "./SuspenseCom";
import { MinRouterListType, MinRouterPropsType } from "./type";

const RouterContext = React.createContext<Partial<MinRouterPropsType>>({});

const MinRouter = (props: MinRouterPropsType) => {
  const { isHash = false } = props;
  const Router = isHash ? HashRouter : BrowserRouter;
  console.log("test  MinRouter");
  return (
    <RouterContext.Provider value={{ ...props }}>
      <Router>
        <Routers />
      </Router>
    </RouterContext.Provider>
  );
};

const Routers = () => {
  const { routes } = useContext(RouterContext);
  // 这里会有一次合并路由会导致执行两次
  const routesList = useMemo(() => loopRouter(routes, []), []);
  const element = useRoutes(routesList);
  return element;
};

function loopRouter(routes, paths) {
  return routes.map((routeItem) => {
    let { async, children } = routeItem;
    let newPaths = [...paths, routeItem.path];
    routeItem.element = (
      <AnthCom {...routeItem} paths={newPaths}>
        {routeItem.element}
      </AnthCom>
    );
    console.log(11212);
    if (async) {
      routeItem.element = <SuspenseCom>{routeItem.element}</SuspenseCom>;
    }
    if (children) {
      children = loopRouter(children, newPaths);
    }
    return routeItem;
  });
}

function AnthCom(props: Omit<MinRouterListType & { paths: [] }, "children">) {
  const { middleware, noSignIn } = useContext(RouterContext);
  const location = useLocation();
  const navigate = useNavigate();

  useEffect(() => {
    let routerPaths = "";
    let pathname = location.pathname;
    props.paths.forEach((item) => item != "/" && (routerPaths += item));
    if (routerPaths === pathname) {
      // console.log(routerPaths, pathname);
      const { to } = compose(middleware)({ ...props, to: "" });
      if (to && !noSignIn.find((item) => item === props.path)) {
        navigate(to);
      }
    }
  });

  function compose(funcs) {
    if (funcs.length === 0) {
      return (arg) => arg;
    }

    if (funcs.length === 1) {
      return funcs[0];
    }

    return funcs.reduce((a, b) => {
      return (args, to) => a(b(args, to));
    });
  }

  // if (toPage && !noSignIn.find((item) => item === props.path)) {
  //   return <Navigate to={toPage} />;
  // }
  return <>{props.children}</>;
}

export default MinRouter;
```

无论是怎么循环 loopRouter 都会返回正确的组件 而在 useEffect 中判断是否跳转到登录或者其他页面
