```js
// webpack dev
// merge，合并两个或多个webpack配置文件
const { merge } = require("webpack-merge");
// 导入公共配置文件
const ReactRefreshWebpackPlugin = require("@pmmmwh/react-refresh-webpack-plugin");
const FriendlyErrorsWebpackPlugin = require("friendly-errors-webpack-plugin");
const webpackConfigBase = require("./webpack.config.base");
const { proxy } = require("../dev-proxy.js");
const portfinder = require("portfinder");
const { resolve, getNetworkIp } = require("./utils/utils");
const { consoleStyle } = require("./utils/styleLog");

module.exports = async function () {
  try {
    // 端口被占用时候 portfinder.getPortPromise 返回一个新的端口(往上叠加)
    let port = await portfinder.getPortPromise({
      port: 3000,
      stopPort: 6999,
    });

    // dev环境下相关配置
    console.log(process.env.NODE_ENV);
    const devConfig = {
      // 指定环境
      mode: "development",
      // 输出source-map的方式，增加调试。eval是默认推荐的选择，build fast and rebuild fast！
      devtool: "inline-source-map",
      // 缓存 只在 dev 环境下使用 生产环境 可能会导致打包久的内容
      cache: { type: "filesystem" },
      // 本地服务器配置

      devServer: {
        // 启动GZIP压缩
        compress: true,
        // ip
        host: "0.0.0.0",
        // 设置端口号
        port: port,
        // 代理请求设置
        proxy: proxy,
        // open: true,
        hot: true,
        client: {
          overlay: {
            errors: true,
            warnings: false,
          },
        },
        onListening: function (devServer) {
          if (!devServer) {
            throw new Error("webpack-dev-server is not defined");
          }
        },
        // 监听数组中的文件也刷
        watchFiles: [resolve("./public/index.html")],
      },
      watchOptions: {
        aggregateTimeout: 200,
        poll: 1000,
      },
      // 禁止webpack输出报错 用 FriendlyErrorsWebpackPlugin
      stats: "none",
      plugins: [
        new ReactRefreshWebpackPlugin({ overlay: false }),
        new FriendlyErrorsWebpackPlugin({
          compilationSuccessInfo: {
            messages: [
              `You application is running here ${
                consoleStyle.underline + consoleStyle.blue
              }http://localhost:${port}${consoleStyle.over}`,
              `You application is running here ${
                consoleStyle.underline + consoleStyle.blue
              }http://${getNetworkIp()}:${port}${consoleStyle.over}`,
            ],
            notes: [
              "Some additionnal notes to be displayed unpon successful compilation",
            ],
          },
          onErrors: function (severity, errors) {},
          clearConsole: true,
          additionalFormatters: [],
          additionalTransformers: [],
        }),
      ].filter(Boolean),
    };
    return merge(webpackConfigBase, devConfig);
  } catch (e) {
    throw new Error(e);
  }
};
```

```js
// prod
// merge，合并两个或多个webpack配置文件
const { merge } = require("webpack-merge");
// 导入公共配置文件
const webpackConfigBase = require("./webpack.config.base");
console.log(process.env.NODE_ENV);
const prodConfig = {
  // 指定环境
  mode: "production",
  // 输出source-map的方式，增加调试。eval是默认推荐的选择，build fast and rebuild fast！
  devtool: "eval",
};

module.exports = merge(webpackConfigBase, prodConfig);
```

```js
// base
const path = require("path");
const { resolve } = require("./utils/utils.js");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = {
  // target: "web",
  // 入口文件
  entry: {
    main: resolve("./src/index.tsx"),
  },
  // 输出
  output: {
    // 文件名称
    filename: "js/[name].[contenthash].js",
    // 输出目录
    path: resolve("./dist"),
    // 每次编译输出的时候，清空dist目录 - 这里就不需要clean-webpack-plugin了
    clean: true,
    // 所有URL访问的前缀路径
    publicPath: "/",
  },
  resolve: {
    // 定义了扩展名之后，在import文件时就可以不用写后缀名了，会按循序依次查找
    extensions: [".js", ".jsx", ".ts", ".tsx", ".json", ".css", ".scss"],
    // 设置链接
    alias: {
      // 注意resolve方法开始的查找的路径是/
      "@": resolve("./src"),
    },
  },
  module: {
    rules: [
      {
        test: /\.(t|j)sx?$/,
        use: "babel-loader",
        exclude: /node_modules/,
      },
      {
        test: /\.css/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
          },
          {
            loader: "css-loader",
            options: {
              // @import 语句 会被后面的 postcss-loader 处理
              importLoaders: 1,
            },
          },
          "postcss-loader",
        ],
      },
      {
        test: /\.(sa|sc)ss$/,
        use: [
          {
            // css拆分为独立的css文件。
            loader: MiniCssExtractPlugin.loader,
          },
          {
            loader: "css-loader",
            options: { modules: { localIdentName: "[local]-[hash:5]" } },
          },
          "postcss-loader",
          {
            // 处理scss内路径的
            loader: "resolve-url-loader",
            options: {
              // keepQuery: true,
            },
          },
          {
            loader: "sass-loader",
            options: {
              sourceMap: true,
            },
          },
        ],
      },
      {
        test: /\.less$/,
        use: [
          {
            // css拆分为独立的css文件。
            loader: MiniCssExtractPlugin.loader,
          },
          {
            loader: "css-loader",
            options: {
              modules: { localIdentName: "[local]-[hash:5]" },
              sourceMap: true,
            },
          },
          "postcss-loader",
          {
            // 处理scss内路径的
            loader: "resolve-url-loader",
            options: {
              // keepQuery: true,
            },
          },
          {
            loader: "less-loader",
            options: {
              sourceMap: true,
            },
          },
        ],
      },
      {
        // 匹配图片文件
        test: /\.(png|jpg|jpeg|gif)$/i,
        // 设置资源处理的类型为asset
        type: "asset",
        parser: {
          // 转为inline dataUrl的条件
          dataUrlCondition: {
            // 默认限制为8kb，现在调整限制为10kb，大文件直接作为asset/resource类型文件输出
            maxSize: 10 * 1024,
          },
        },
        generator: {
          filename: "assets/img/[name].[hash:8].[ext]",
        },
      },
      {
        test: /\.svg$/,
        use: [
          { loader: "svg-sprite-loader", options: {} },
          // 加载时删除svg默认fill填充色
          // {loader: 'svgo-loader', options: {plugins:[{removeAttrs:{attrs: 'fill'}}]}}
        ],
      },
      {
        // 匹配json文件
        test: /\.json$/,
        // 将json文件视为文件类型
        type: "asset/resource",
        // 路径中包含animations的
        include: /animations/,
        generator: {AAAaaaAAAAaaaaaaaAAA
          // 这里专门针对json文件的处理
          filename: "static/[name].[hash][ext][query]",
        },
      },
    ],
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: "css/[name].css",
    }),
    new HtmlWebpackPlugin({
      // HTML模板文件 webpack5 会自己压缩html代码
      template: resolve("./public/index.html"),
      title: "galaxy",
      // 收藏夹图标
      // favicon: resolve("./public/logo.ico"),
    }),
  ],
};
```
aaaa a a啊啊啊aaa a a aaaaaaaaaaaaaaaaaaaaaaaaaaaaAA22222222222222