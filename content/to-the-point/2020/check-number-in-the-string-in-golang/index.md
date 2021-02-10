---
title: "Check if a character is a number in Golang"
date: 2020-12-19T15:04:55+05:30
description: "Check if a character is a Number in the string"
categories: ["Golang", "2020", "to-the-point"]
tags: ["golang"]
cover: https://schadokar.dev/images/golang-basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

[Unicode](https://unicode-table.com/en/) is a computing standard for the consistent encoding symbols.

All the characters and symbols assigned a code.

For ex.

```go
A U+0041
अ U+0905
```

All the Unicode is divided into various categories. Browse all the [categories](https://www.compart.com/en/unicode/category).

- [Ll](https://www.compart.com/en/unicode/category/Ll) Lowercase Letters (a, b, µ, ɸ)
- [Nl](https://www.compart.com/en/unicode/category/Nl) Letter Number (Ⅰ, ᛯ)
- [Lo](https://www.compart.com/en/unicode/category/Lo) Other Letter (अ, ƻ)

Golang package `unicode` provides a wide range of validation methods on different set of Unicode.

## IsNumber

`IsNumber` function validates the set of Unicode number characters, category N(Nd, Nl, No).

**Syntax**

```go
func IsNumber(r rune) bool
```

```go
package main

import (
	"fmt"
	"unicode"
)

func main() {
	str := "1b१Ⅰ¼"
	for _, char := range str {
		if unicode.IsNumber(char) {
			fmt.Println(string(char), char, "is number rune")
		} else {
			fmt.Println(string(char), char, "is not a number rune")
		}
	}
}
```

**Output**

```go
1 49 is number rune
b 98 is not a number rune
१ 2407 is number rune
Ⅰ 8544 is number rune
¼ 188 is number rune
```

[Try it](https://play.golang.org/p/AtA1yCbAvcj)

## IsDigit

`IsDigit` function validates only the `Nd` Unicode category. It is a subset of `IsNumber`.

**Syntax**

```go
func IsDigit(r rune) bool
```

```go
package main

import (
	"fmt"
	"unicode"
)

func main() {
	str := "1b१Ⅰ¼"

	for _, char := range str {
		if unicode.IsDigit(char) {
			fmt.Println(string(char), char, "is digit rune")
		} else {
			fmt.Println(string(char), char, "is not a digit rune")
		}
	}
}
```

**Output**

```go
1 49 is digit rune
b 98 is not a digit rune
१ 2407 is digit rune
Ⅰ 8544 is not a digit rune
¼ 188 is not a digit rune
```

## Final Words

You can always use a validation on ASCII values. ASCII value of `0` is `30` and `9` is `39`.  
If `>=` 30 and `<=` 39.

---
