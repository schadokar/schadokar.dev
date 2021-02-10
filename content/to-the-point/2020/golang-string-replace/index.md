---
title: "Golang String Replace"
date: 2020-12-19T21:15:35+05:30
description: "How to replace a substring in the string?"
categories: ["Golang", "2020", "to-the-point"]
tags: ["golang"]
cover: https://schadokar.dev/images/golang-basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

Golang package `strings` provides `Replace` and `ReplaceAll` functions to replace the substring in the string.

## Replace

**Syntax**

```go
func Replace(s, old, new string, n int) string
```

`n` is the number of first occurrence of the substring.  
Replace `n` first occurrence of the substring.

If `n < 0`, then it will replace all the occurrence.

```go
package main

import (
	"fmt"
	"strings"
)

func main() {
    str := "Th0is is an en0c0oded 0000 message"

	newStr := strings.Replace(str, "0", "", 3)

	fmt.Printf("Original String: %s\nAfter Replace: %s\n", str, newStr)

	// n = -1
	newStr =  strings.Replace(str, "0", "", -1)
	fmt.Printf("After Replace with -1: %s", newStr)
}
```

**Output**

```go
Original String: Th0is is an en0c0oded 0000 message
After Replace: This is an encoded 0000 message
After Replace with -1: This is an encoded  message
```

## ReplaceAll

**Syntax**

```go
func ReplaceAll(s, old, new string) string
```

```go
str := "Th0is is an en0c0oded 0000 message"

newStr := strings.ReplaceAll(str, "0", "")

fmt.Printf("Original String: %s\nAfter Replace: %s\n", str, newStr)
```

**Output**

```go
Original String: Th0is is an en0c0oded 0000 message
After Replace: This is an encoded  message
```

## Final Words

It was always suggested to use `ReplaceAll` instead of `Replace` with `-1`. To support your `-1` you might need to add a comment.  
Keep the code self explanatory.

---
