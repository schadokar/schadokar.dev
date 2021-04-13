---
title: "How to Convert an Array to a String in Javascript"
date: 2021-04-13T18:21:35+05:30
description: ""
categories: ["Javascript","to-the-point","2021"]
tags: ["javascript","to-the-point"]
cover: https://schadokar.dev/images/basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

This post will answer the below questions

- How to convert an array to a string?
- How to convert an array to a string with a character in between the elements?

Use `join` method to convert the array to a string with a separator. 

### Syntax

```js
array.join(separator(optional))
```
> `,`(comma) is the default separator. Separator is a string not a character. `-` or `namaste` both are valid separator.

```js
const dateArray = ["Sun", 11, "Apr", 2021, "12:59:48", "GMT"];
const dateString = dateArray.join();
const dateStringHyphen = dateArray.join("-");
console.log(dateString);
console.log(dateStringHyphen);
```

#### Output

```js
Sun,11,Apr,2021,12:59:48,GMT
Sun-11-Apr-2021-12:59:48-GMT
```

---

