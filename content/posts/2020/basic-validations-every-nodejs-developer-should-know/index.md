---
title: "Basic validations every nodejs developer should know"
date: 2020-09-06T11:51:52+05:30
description: "Validations are the key things to prevent the application's unexpected behaviour. This is a list of basic validations every nodejs developer should know about."
categories: ["Nodejs", "Article", "2020"]
tags: ["good-practice", "tips"]
cover: https://schadokar.dev/images/node-basic.png #image show on top
readingTime: true # show reading time after article date
published: true
---

Validations are the key things to prevent the application's unexpected behaviour. This is a list of basic validations every nodejs developer should know about.  
I will keep updating this article with new validation and best approaches.

- [typeof operator](#typeof-operator)
  - [Syntax](#syntax)
- [Number check](#number-check)
  - [Check NaN (not a number)](#check-nan-not-a-number)
  - [Check if the number is finite](#check-if-the-number-is-finite)
- [String Check](#string-check)
- [Boolean Check](#boolean-check)
- [Undefined Check](#undefined-check)
- [Null Check](#null-check)
  - [Null check using the Object](#null-check-using-the-object)
- [Function check](#function-check)
- [Object Check](#object-check)
  - [Check using the instanceof](#check-using-the-instanceof)
- [Array Check](#array-check)
- [Buffer Check](#buffer-check)
- [Conclusion](#conclusion)

# typeof operator

Javascript provides a `typeof` operator. This operator returns the type of the variable.

## Syntax

```js
typeof operand;
typeof operand;
```

Return Values of the `typeof`

| Type      | Return      |
| --------- | ----------- |
| Number    | "number"    |
| String    | "string"    |
| Boolean   | "boolean"   |
| Undefined | "undefined" |
| Null      | "object"    |
| Function  | "function"  |
| Object    | "object"    |

> There are a couple of other like BigInt(returns "bigint") which introduced in ECMAScript 2020 and Symbol(returns "symbol") which introduced in the ECMAScript 2015. [Learn more](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof)

# Number check

For all the numbers(integer, floating) and Infinity, it returns `number`.

```js
const num1 = 12;

// check if it is a number
if (typeof num1 === "number") {
  console.log("It is a number");
} else {
  console.log("It is not a number");
}

// check for Infinity
const num2 = Infinity;

// check if it is a number
if (typeof num2 === "number") {
  console.log("It is a number");
} else {
  console.log("It is not a number");
}

// check for string
const num3 = "2";

// check if it is a number
if (typeof num3 === "number") {
  console.log("It is a number");
} else {
  console.log("It is not a number");
}
```

**Output**

```js
It is a number
It is a number
It is not a number
```

## Check NaN (not a number)

NaN is a property and its type is `number`. NaN is never equal to any number including NaN itself.

```
NaN != NaN
```

To check NaN, always use `isNaN` method.

```js
const str = "js";

// check if it is not a number
if (isNaN(str)) {
  console.log("It is not a number");
} else {
  console.log("It is a number");
}
```

**Output**

```js
It is not a number
```

## Check if the number is finite

`isFinite` method returns a boolean value if a number is finite or not.

```js
const num1 = 12;

// check if finite
if (isFinite(num1)) {
  console.log("Number is finite");
} else {
  console.log("Number is not finite");
}

const num2 = Infinity;

// check if finite
if (isFinite(num2)) {
  console.log("Number is finite");
} else {
  console.log("Number is not finite");
}
```

**Output**

```js
Number is finite
Number is not finite
```

# String Check

```js
// check for string
const str = "2";

// check if it is a string
if (typeof str === "string") {
  console.log("It is a string");
} else {
  console.log("It is not a string");
}
```

**Output**

```js
It is a string
```

# Boolean Check

```js
// check for boolean
const bool = true;

// check if it is a boolean
if (typeof bool === "boolean") {
  console.log("It is a boolean");
} else {
  console.log("It is not a boolean");
}

// check for boolean
const str = "str";

// check if it is a boolean
if (typeof str === "boolean") {
  console.log("It is a boolean");
} else {
  console.log("It is not a boolean");
}
```

**Output**

```js
It is a boolean
It is not a boolean
```

# Undefined Check

```js
// check for undefined
const variable = undefined;

// check if it is undefined
if (typeof variable === "undefined") {
  console.log("It is undefined");
} else {
  console.log("It is not undefined");
}
```

**Output**

```js
It is undefined
```

# Null Check

`typeof` null returns `Object`.

> [Check out](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof#null) why it returns Object.

```js
// check for null
const variable = null;

// check if it is a null
if (variable === null) {
  console.log("It is a null");
} else {
  console.log("It is not a null");
}
```

**Output**

```js
It is a null
```

## Null check using the Object

```js
function isNull(variable) {
  return Object.prototype.toString.call(variable) === "[object Null]";
}
```

# Function check

```js
// check for function
const variable = function (x, y) {
  return x + y;
};

// check if it is a function
if (typeof variable === "function") {
  console.log("It is a function");
} else {
  console.log("It is not a function");
}
```

**Output**

```js
It is a function
```

# Object Check

There are multiple ways to check if the variable is an object or not.

```js
// check for Object
const variable = {
  id: 12,
};

// check if it is an Object
if (typeof variable === "object") {
  console.log("It is an Object");
} else {
  console.log("It is not an Object");
}
```

**Output**

```js
It is an Object
```

> **Note**: null is also an object

Check the object and not null.

```js
// check for Object and not null
const variable = {
  id: 12,
};

// check if it is an Object
if (typeof variable === "object" && variable !== null) {
  console.log("It is an Object and not null");
} else {
  console.log("It is not an Object");
}
```

**Output**

```js
It is an Object and not null
```

## Check using the instanceof

The `instanceof` operator returns boolean, it checks if the variable has a `prototype` property of a constructor exists in the prototype chain of an object.

The `instanceof` operator also takes care of the `null` object. It returns false to null.

```js
// check for Object
const variable = {
  id: 12,
};

// check if it is an Object
if (variable instanceof Object) {
  console.log("It is an Object");
} else {
  console.log("It is not an Object");
}

// check for Object
const variable2 = null;

// check if it is an Object
if (variable2 instanceof Object) {
  console.log("It is an Object");
} else {
  console.log("It is not an Object");
}
```

**Output**

```js
It is an Object
It is not an Object
```

# Array Check

An array is also an Object. Using `typeof` requires multiple validations to validate it.

> Empty array is a true value.

In javascript **Array** class is a global object that is used in the construction in the arrays.  
**Array** class has many methods and one of them is `isArray`.

`isArray` returns true if the variable is an array else false.

```js
// check for Array
const arr = ["hello", "world"];

// check if it is an Array
if (Array.isArray(arr)) {
  console.log("It is an Array");
} else {
  console.log("It is not an Array");
}

// check for Array
const arr2 = 12;

// check if it is an Array
if (Array.isArray(arr2)) {
  console.log("It is an Array");
} else {
  console.log("It is not an Array");
}
```

**Output**

```js
It is an Array
It is not an Array
```

Other alternatives to check the array.

```js
// conditions
1. arr.constructor === Array

2. arr instanceof Array

3. Object.prototype.toString.call(arr) === '[object Array]'
```

# Buffer Check

In the nodejs, `Buffer` class is in the global scope.  
`Buffer` class has an `isBuffer` method to check if the variable is buffer or not.

> `Buffer` objects are used to represent a fixed-length sequence of bytes. The `Buffer` class is a subclass of JavaScript's `Uint8Array` class and extends it with methods that cover additional use cases. Node.js APIs accept plain `Uint8Arrays` wherever Buffers are supported as well.

```js
// check for Buffer
const buf = Buffer.from("Hello World");

// check if it is a Buffer
if (Buffer.isBuffer(buf)) {
  console.log("It is a Buffer");
} else {
  console.log("It is not a Buffer");
}
```

**Output**

```js
It is a Buffer
```

> ⚠️ Buffer class is not available in the Javascript. Don't try it in client-side application it will throw an error.

# Conclusion

I'll keep updating it with frequent validation a javascript or nodejs developer has to do every day.  
Thanks for reading and please let me what else can be added in this.

---
