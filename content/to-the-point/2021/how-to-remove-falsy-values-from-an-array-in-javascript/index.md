---
title: "How to Remove Falsy Values From an Array in Javascript"
date: 2021-04-21T15:55:10+05:30
description: ""
categories: ["Javascript", "2021", "to-the-point"]
tags: ["javascript", "2021", "to-the-point"]
cover: https://schadokar.dev/images/basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

## Falsy Values in the Javascript

In Javascript, in the context of Boolean all the values are either `true` or `false`.

For Example

| Boolean | Values                                                 |
| ------- | ------------------------------------------------------ |
| True    | 1,2,3, "any string", {} , true, 1.0, 'false', Infinity |
| False   | 0, -0, false, 0n, "", '',``, null, undefined, NaN      |

> 'false' is a string.

## Demo

Use `filter` to remove all the falsy values from an array.

```js
const arr = ["hi", '', false, 123, {}, [], "false", 0];
// falsy values are '' false 0
const newArr = arr.filter(Boolean); // ["hi", 123, {}, [], "false"]
```

`filter` returns a new array instead of updating the original array.

---

