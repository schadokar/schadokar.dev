---
title: "How to Get the Length of an Object in Javascript"
date: 2021-04-19T20:06:56+05:30
description: ""
categories: ["Javascript", "to-the-point", "2021"]
tags: ["javascript", "to-the-point","2021"]
cover: https://schadokar.dev/images/basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

The Javascript Object is a collection of key value pair.

```js
const obj = {
    key1: value1,
    key2: value2,
    length: 10
};

Object.keys(obj).length // 3 ["key1", "key2", "length"]
obj.length // 10
```

The `Object.keys(obj)` returns the array of the keys of the object.

`.length` is the function available of array.

> If you will try to use `.length` property then object will find `length` property or key in the object.

### Get object length function

Create a object length function.

```js
const obj = {
    key1: value1,
    key2: value2,
    length: 10
};

const len(obj) {
    return Object.keys(obj).length;
};

len(obj); // 3
```

---

