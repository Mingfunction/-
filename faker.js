const { faker } = require("@faker-js/faker");
const fs = require("fs");
// faker.setLocale("");
// faker.locale = "zh_CN";

// let arr = [];

// new Array(100).map(() => ({
//   name: faker.name.firstName("male"),
//   id: faker.phone.phoneNumber("###-###-###"),
// }));

// function loop(dep, num) {
//   if (dep < 4) {

//   }
// }

let cityList = [
  { id: 1, parentId: 0, name: "江苏省" },
  { id: 2, parentId: 0, name: "广东省" },
  { id: 3, parentId: 0, name: "湖南省" },
  { id: 4, parentId: 1, name: "苏州市" },
  { id: 5, parentId: 1, name: "无锡市" },
  { id: 6, parentId: 1, name: "南通市" },
  { id: 7, parentId: 2, name: "广州市" },
  { id: 8, parentId: 2, name: "深圳市" },
  { id: 9, parentId: 3, name: "长沙市" },
  { id: 10, parentId: 4, name: "工业园区" },
  { id: 11, parentId: 4, name: "吴中区" },
  { id: 12, parentId: 4, name: "姑苏区" },
];

function listToTree() {
  let array = [];
  cityList.forEach((item) => {
    // 遍历对象数组
    item.children = cityList.filter((info) => info.parentId === item.id); // 找到每个对象的子节点
    if (item.parentId === 0) {
      array.push(item); // 将一层节点放入新数组中
    }
  });
  return array; //循环结束，返回结果
}

console.dir(listToTree());

fs.writeFile("message.json", JSON.stringify(listToTree()), (err) => {
  if (err) throw err;
  console.log("The file has been saved!");
});
