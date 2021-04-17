---
title: "How to Add and Remove a Property of an Object in Javascript"
date: 2021-04-17T10:48:17+05:30
description: ""
categories: ["Javascript", "2021", "to-the-point"]
tags: ["javascript","to-the-point","2021"]
cover: https://schadokar.dev/images/basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

Javascript object is a collection of properties and a property is a key-value pair. 

The value can be anything like any data type, object and even a function. When a value is a function then it is known as method.

## Add a property to an object

```js
const obj = {};
// syntax 1
obj.property1 = "first property"
// or syntax 2
obj.property2 = "second property"
```

## Remove or delete a property of an  Object

Use `delete` keyword to remove or delete a property.

```js
const obj = {
    "property1": "first property",
    "property2": "second property",
    "property3": "third property"
};

// delete second property
delete obj.property2;
// delete third property
delete obj["property3"];
```

---

