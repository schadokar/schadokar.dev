---
title: "How to use Swapper in Golang?"
date: 2020-03-03T08:17:07+05:30
description: "Learn how to Swapper function, to swap the array elements."
categories: ["Tutorial", "to-the-point", "Golang"]
tags: ["golang","to-the-point"]
cover: /images/golang-basic.png
published: true
---

[Swapper](https://golang.org/pkg/reflect/#Swapper) is a function defined in the [reflect](https://golang.org/pkg/reflect/) package. This function takes a slice and returns a swap function. This swap function takes 2 indexes as arguments and swaps the values at index position in the slice. 

### Function Definition

```go
func Swapper(slice interface{}) func(i, j int)
```

Let's try

```go
package main

import (
	"fmt"
	"reflect"
)

func main() {
	s := []int{1, 2, 3}
	fmt.Printf("Before swap: %v\n", s)

	swapF := reflect.Swapper(s)

	swapF(0, 1)

	fmt.Printf("After 1 swap: %v\n", s)

	swapF(0, 2)

	fmt.Printf("After 2 swap: %v\n", s)
}
```
[Try it](https://play.golang.org/p/pljUgJ0mEnJ)

Output
```
Before swap: [1 2 3]
After 1 swap: [2 1 3]
After 2 swap: [3 1 2]
```

**Swapper panics if the provided interface is not a slice.**

```
panic: reflect: call of Swapper on <Type> Value
```

### Reverse a slice using Swapper

Swap first element with last element, second element with second last and so on.  

```go
package main

import (
	"fmt"
	"reflect"
)

func main() {
	s := []int{1, 2, 3, 4, 5, 6, 7}

	fmt.Printf("Before swap: %v\n", s)

	swapF := reflect.Swapper(s)

	for i := 0; i < len(s)/2; i++ {
		swapF(i, len(s)-1-i)
	}

	fmt.Printf("After swap: %v\n", s)
}

```
[Try it](https://play.golang.org/p/yFtphVvgvBN)

Output

```
Before swap: [1 2 3 4 5 6 7]
After swap: [7 6 5 4 3 2 1]
```

### Use Swapper in Bubble sort

```go
package main

import (
	"fmt"
	"reflect"
)

func main() {
	s := []int{1, 2, 6, 3, 8, 0, 7, 9, 5, 4}

	fmt.Printf("Before swapper: %v\n", s)

	swapF := reflect.Swapper(s)

	for i := 0; i < len(s)-1; i++ {
		for j := i + 1; j < len(s); j++ {
			if s[i] > s[j] {
				swapF(i, j)
			}
		}
	}

	fmt.Printf("After swapper: %v\n", s)
}
```
Output

```
Before swapper: [1 2 6 3 8 0 7 9 5 4]
After swapper: [0 1 2 3 4 5 6 7 8 9]
```

---