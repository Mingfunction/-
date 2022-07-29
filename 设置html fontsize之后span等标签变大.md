原因可能是设置其他标签 vertical-align: baseline; 加上 span 默认就有 vertical-align: baseline 之类有关的东西， 导致该 span 和 该元素对齐导致高度变化
本质上还是和 font-size 多个 vertical-align: baseline 导致高度被撑篙

解决办法
推荐设置 span dispaly：block 这样 只有 inline（inline-block）的元素才会和其他 inline 对齐
或者找到和 span 对齐的元素设置 vertical-align:top 这种对齐


