// 官网: https://prettier.io/docs/en/options.html

module.exports = {
    useTabs: false, // 关闭tab缩进，使用Space缩进
    tabWidth: 4, // 每次缩进2个字符
    semi: true, // 结尾加分号
    singleQuote: true, // 使用单引号
    jsxSingleQuote: true, // jsx中使用单引号
    trailingComma: 'es5', // 结尾逗号使用es5规则
    bracketSpacing: true, // 括号和参数之间有空格
    jsxBracketSameLine: false, // 标签属性较多时，标签箭头>另起一行
    arrowParens: 'always', // 箭头函数参数永远加括号
    quoteProps: 'as-needed', // 属性加引号需要加时再加
    printWidth: 80, // 每行字符个数
    proseWrap: 'always', //换行方式  always换行   never绝不换行  preserve保持不动:默认值
};
