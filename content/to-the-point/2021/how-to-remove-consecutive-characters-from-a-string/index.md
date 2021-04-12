---
title: "How to Remove Consecutive Characters From a String"
date: 2021-02-20T00:42:58+05:30
description: "Basic Data structures and algorithms."
categories: ["to-the-point", "2021"]
tags: ["data structures", "javascript"]
cover: https://schadokar.dev/images/basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

## Problem Statement

Remove n consecutive characters from a string and return the final string.

For example:

```js
Input String: abccdeeef

Output String: abdf
```

## Solution

```js
const str = "abccdeeef";
//-----------012345678
let finalStr = "";

let isConsecutive = false;

for (let i = 0; i < str.length - 1; i++) {
  // check if characters are consecutive
  if (str[i] === str[i + 1]) {
    isConsecutive = true;
  } else {
    // check if the last character was consecutive
    if (!isConsecutive) {
      // add the character to new string
      finalStr += str[i];
    }
    // reset the flag
    isConsecutive = false;
  }
}

// check for last character
if (!isConsecutive) {
  finalStr += str[str.length - 1];
}

console.log(finalStr);
```

Output

```js
abdf;
```

## Final words

This is one of very common interview question can be asked in the interview. The solution is easy but in interviews due to time frame, interviewee can get confused.
Always go for easy solution and then work on complexity.

---
