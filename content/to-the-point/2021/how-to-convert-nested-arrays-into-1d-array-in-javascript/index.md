---
title: "How to Convert Nested Arrays Into 1d Array in Javascript"
date: 2021-04-22T16:23:30+05:30
description: ""
categories: ["Javascript", "2021", "to-the-point"]
tags: ["javscript", "to-the-point", "2021"]
cover: https://schadokar.dev/images/basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

In **ES2019**, `Array.prototype.flat` method was introduced which converts the multi-dimensional array to one-dimensional array upto a defined nested depth.

For Example:

```js
const nestedArr = ["e1", ["e2", "e3", ["e4", "e5", ["e6", "e7"]]]];
// default depth is 1 means it will flated only 1 nested array
nestedArr.flat(); // ["e1", "e2", "e3", ["e4", "e5", ["e6", "e7"]]]

// depth = 2
nestedArr.flat(2); // ["e1", "e2", "e3", "e4", "e5", ["e6", "e7"]]

// for all the way down to the last nested array use Infinity
nestedArr.flat(Infinity); // ["e1", "e2", "e3", "e4", "e5", "e6", "e7"]
```

> The `flat` method is not supported on old version of many browsers.
>
> Checkout supported versions [here](https://caniuse.com/array-flat).

---

