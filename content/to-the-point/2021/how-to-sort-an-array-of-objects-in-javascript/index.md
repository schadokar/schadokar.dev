---
title: "How to Sort an Array of Objects in Javascript"
date: 2021-04-12T16:20:56+05:30
description: ""
categories: ["Javascript", "to-the-point","2021"]
tags: ["to-the-point", "javascript"]
cover: https://schadokar.dev/images/basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

Using the `sort` method, we can sort the array of objects by the property of the object.

The `sort` method will change the `persons` array instead of creating a copy of it. `sort` works by reference not by value.

```js
const persons = [
    {name: "John", age: 35},
    {name: "Steve", age: 24},
    {name: "Ben", age: 49}
]
```

### Syntax

```js
array.sort(function (arg1, arg2) {
	// arg1 is smaller than arg2 
	// example: (2-4) = negative (less than 0)
	if(arg1 < arg2) {
		return -1; // in ascending order
        // return 1; // in descening order
	} 
	// arg1 is larger than arg2
	// example: (6-2) = positive (greater than 0)
	else if (arg1 > arg2) {
		return 1; // in ascending order
         // return -1; // in descening order
	} 
	// arg1 is equal to arg2
	return 0;
} )
```

### Sort the object by name

```js
persons.sort((p1, p2) => {
    // to ignore the case sensitivity
    const arg1 = p1.name.toLowerCase();
    const arg2 = p2.name.toLowerCase();
	if(arg1 < arg2) {
		return -1;
	} else if (arg1 > arg2) {
		return 1;
	}
	return 0;
});
console.log(persons);
```

#### Output

```json
[
    {"name":"Ben","age":49},
    {"name":"John","age":35},
    {"name":"Steve","age":24}
]
```

> We have used arrow `=>` function expression include in ES2015 instead of function. Both are correct.

### Sort the object by age

```js
persons.sort((arg1, arg2) => {
	return arg1.age - arg2.age; // for ascending order
	// return arg2.age - arg1.age; // for decending order
})
// Or use the short format
persons.sort((arg1, arg2) => arg1.age - arg2.age;)

console.log(persons);
```

#### Output

```json
[
    {"name":"Steve","age":24},
    {"name":"John","age":35},
    {"name":"Ben","age":49}
]
```

---

