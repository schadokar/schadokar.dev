---
title: "Remove an Element From an Array Using Filter in Nodejs"
date: 2020-09-04T09:29:51+05:30
description: "In nodejs, there are many options to remove an element from an array, one of them is using the filter."
categories: ["to-the-point", "2020", "Nodejs"]
tags: ["array"]
cover: https://schadokar.dev/images/node-basic.png #image show on top
readingTime: true # show reading time after article date
published: true
---

In nodejs, there are many options to remove an element from an array, one of them is using the filter.

filter method on array returns a new array based on the filtering condition.

For ex. return the even values in the array

```js
const arr1 = [1, 2, 3, 4, 5, 6];

const arr2 = arr1.filter((n) => n % 2 === 0);

console.log(arr2);
```

**Output**

```
[2, 4, 6]
```

## Remove an element from the array

Remove 5 from the array.

```js
const arr1 = [1, 2, 3, 4, 5, 6];

const arr2 = arr1.filter((n) => n != 5);

console.log(arr1);
console.log(arr2);
```

**Output**

```js
arr1: [1, 2, 3, 4, 5, 6];
arr2: [1, 2, 3, 4, 6];
```

There are many other ways available in the nodejs to remove an element from the array, this method makes the code look clean and still get the job done.

---
