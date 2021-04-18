---
title: "How to Check if Object Is Empty in Javascript"
date: 2021-04-18T19:52:16+05:30
description: ""
categories: ["Javascript", "to-the-point","2021"]
tags: ["javascript", "to-the-point","2021"]
cover: https://schadokar.dev/images/basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

There are many ways to check if an Object is empty or not. But in this post we will document only which is recommended and has fast execution compared to others.

## for loop

Iteration is best way to check if Object is empty or not and it will work on all the browsers.

```js
const obj = {};

for(let key in obj) {
    if(obj.hasOwnProperty(key)) {
        return false;
    };
};
return true;
```

## Using Object.keys

```js
obj // check if obj is not null or undefined
&& Object.keys(obj).length === 0 // check if object has no keys
&& obj.constructor === Object // check if constructor of object is of Object type
```

> In Javascript, new keyword creates a new Object. For Example. new String() is also an Object but its constructor type is string.

```js
const str = new String(); // typeof str = Object
str.constructor(); // string
```

Snippet

```js
const obj = {};
// check if object is empty
if(obj && Object.keys(obj).length === 0 && obj.constructor === Object) {
    return true;
};
return false;
```

## References

Checkout these resources for more options

- [Stackoverflow answer 1](https://stackoverflow.com/a/32108184/9790416)
- [Stackoverflow answer 2 - Performance](https://stackoverflow.com/a/59787784/9790416)
- [Samantha Ming Tidbits](https://www.samanthaming.com/tidbits/94-how-to-check-if-object-is-empty/)

---

