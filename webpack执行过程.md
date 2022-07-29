1.webpack.config.js,shell options 参数解析
2.new webpack(options)
3.run() 编译的入口方法
4.compile() 出发 make 事件
5.addEntry() 找到 js 文件，进行下一步模块绑定
6.\_addModuleChain() 解析 js 入口文件，创建模块
7.buildModule() 编译模块，loader 处理与 acorn 处理 AST 语法树
8.seal() 每一个 chunk 对应一个入口文件
9.createChunkAssets() 生成资源文件
10.MainTemplate.render() **webpack**require()引入
11.ModuleTemplate.render() 生成模版
12.module.source() 将生成好的 js 保存在 compilation.assets 中
13.Compiler.emitAssets()通过 emitAssets 将最终的 js 输出到 output 的 path 中

```js
const webpack = (options, callback) => {

    //验证webpack.config.js合法性
    const webpackOptionsValidationErrors = validateSchema(
		webpackOptionsSchema,
		options
	);

	/*
	    [
          { entry: './index1.js', output: { filename: 'bundle1.js' } },
          { entry: './index2.js', output: { filename: 'bundle2.js' } }
        ]
	*/
	if (Array.isArray(options)) {
	    compiler = new MultiCompiler(options.map(options => webpack(options)));
	} else if(typeof options === "object"){
	    ...
	    //创建一个comiler对象
	    compiler = new Compiler(options.context);

	    //往comiler中注册插件
	    new NodeEnvironmentPlugin().apply(compiler);

	    //执行config中配置的插件
	    if (options.plugins && Array.isArray(options.plugins)) {
			for (const plugin of options.plugins) {
				if (typeof plugin === "function") {
					plugin.call(compiler, compiler);
				} else {
					plugin.apply(compiler);
				}
			}
		}

		//执行插件environment生命周期钩子方法
		compiler.hooks.environment.call();
		compiler.hooks.afterEnvironment.call();
		//执行webpack内置插件
		compiler.options = new
		WebpackOptionsApply().process(options, compiler);
	}else {
		throw new Error("Invalid argument: options");
	}

	if (callback) {
	    ...
	    //调用compiler.run开始编译
	    compiler.run(callback);
	}
	//将compiler对象返回
	return compiler
}
```

```js
// 编译
class Compiler extends Tapable{
    constructor(context){
        ...
    }
    watch(){...}
    run(callback){
        ...
        const onCompiled = (err, compilation){
            ...
        }
        //执行生命周期钩子
        this.hooks.beforeRun.callAsync(this, err => {
              ...
            this.hooks.run.callAsync(this, err =>{
                this.readRecords(err =>{
                    ...
                    //开始编译
                    this.compile(onCompiled);
                })
            }
        }
    }
    compile(callback) {
        //拿到参数
        const params = this.newCompilationParams();
        //执行编译前钩子
        this.hooks.beforeCompile.callAsync(params, err => {
            ...

            //创建compilation对象
            const compilation = this.newCompilation(params);

            //开始构建模块对象
            this.hooks.make.callAsync(compilation, err =>{

            })
        }
    }
    createCompilation() {
        //创建comilation对象
		return new Compilation(this);
	}
    newCompilation(params) {
        //调用创建compilation对象方法
        const compilation = this.createCompilation();
    }
}

module.exports = Compiler;


```
