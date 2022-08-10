// app/extend/application.js
"use strict";

const path = require("path");
const Canvas = require("canvas");
const echarts = require("echarts");
const fs = require("fs");

function generateImage(options, savePath, size) {
  return new Promise((resolve, reject) => {
    const canvas = new Canvas(
      parseInt(size.width, 10),
      parseInt(size.height, 10)
    );
    // const font = new Canvas.Font(
    //   "华文仿宋",
    //   path.join(__dirname, "华文仿宋.ttf")
    // );
    const ctx = canvas.getContext("2d");
    ctx.addFont(font);
    ctx.font = "12px 华文仿宋";

    echarts.setCanvasCreator(function () {
      return canvas;
    });
    const chart = echarts.init(canvas);
    options.animation = false;
    // options.textStyle = {
    //   fontFamily: "华文仿宋",
    //   fontSize: 12,
    // };
    chart.setOption(options);
    try {
      fs.writeFileSync(savePath, chart.getDom().toBuffer());
      console.log("Create Img:" + savePath);
    } catch (err) {
      console.error("Error: Write File failed" + err.message);
    }
    resolve();
  });
}
generateImage(
  {
    xAxis: {
      type: "category",
      data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
    },
    yAxis: {
      type: "value",
    },
    series: [
      {
        data: [150, 230, 224, 218, 135, 147, 260],
        type: "line",
      },
    ],
  },
  "./"
);
