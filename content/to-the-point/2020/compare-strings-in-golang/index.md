---
title: "Compare Strings in Golang"
date: 2020-03-27T11:55:03+05:30
description: "Learn different ways to compare strings in golang."
categories: ["Tutorial", "to-the-point", "Golang"]
tags: ["golang","strings","to-the-point"]
cover: https://schadokar.dev/images/golang-basic.png
published: true
---

A string value is a sequence of bytes.

## Using the Comparison operators

```
==    equal
!=    not equal
<     less
<=    less or equal
>     greater
>=    greater or equal
```

To check if strings are equal or not, you can use `==` or `!=`.

```go
package main

import (
	"fmt"
)

func main() {

	str1 := "golang"
	str2 := "gopher"

	fmt.Println(str1 == str2)
	fmt.Println(str1 != str2)

}
```
Output
```
false
true
```

**To check the [Lexicographic Order](https://chortle.ccsu.edu/java5/Notes/chap92/ch92_2.html) of 2 strings, you can use `<`, `<=`, `>`, `>=`.**

> **Lexicographic Order:** This is dictionary order, except that all the uppercase letters preceed all the lowercase letters.  
> Example: Uppercase `A` comes first then the lowercase `a`.

```go
package main

import (
	"fmt"
)

func main() {

	str1 := "apple"
	str2 := "banana"
	str3 := "Apple"

	fmt.Printf("%s < %s = %v\n", str1, str2, str1 < str2)
	fmt.Printf("%s <= %s = %v\n", str1, str2, str1 <= str2)
	fmt.Printf("%s > %s = %v\n", str1, str2, str1 > str2)
	fmt.Printf("%s >= %s = %v\n", str1, str2, str1 >= str2)
	fmt.Printf("%s < %s = %v\n", str1, str3, str1 < str3)
	fmt.Printf("%s > %s = %v\n", str1, str3, str1 > str3)
}
```
Output
```
apple < banana = true
apple <= banana = true
apple > banana = false
apple >= banana = false
apple < Apple = false
apple > Apple = true
```

> Note: In Lexicographic Order, Apple comes before apple. 🍏 != 🍎

---

## Using the Compare function

Compare returns an integer comparing two strings lexicographically. 
The result will be 
```
 0 if a == b
-1 if a < b
+1 if a > b
```
Example:
```go
package main

import (
	"fmt"
	"strings"
)

func main() {
	fmt.Println(strings.Compare("a", "b"))
	fmt.Println(strings.Compare("a", "a"))
	fmt.Println(strings.Compare("b", "a"))
}
```
Output
```
-1
0
1
```
---