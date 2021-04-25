---
title: "How to Sort an Array of Int Float and String in Golang"
date: 2021-04-25T16:48:05+05:30
description: ""
categories: ["Golang", "to-the-point", "2021"]
tags: ["golang", "to-the-point", "2021"]
cover: https://schadokar.dev/images/basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true

---

The golang provides a `sort` package to sort slices of primitives types and user-defined.

## Sort Ints

```go
intArr := []int{23, 12, 11, 90}
// Sort in Increasing Order
sort.Ints(intArr) // [11, 12, 23, 90]
// Sort in Decreasing Order
sort.Sort(sort.Reverse(sort.IntSlice(intArr))) // [90, 23, 12, 11]
```

## Sort Float

```go
floatArr := []float64{23.1, 12.1, 111.1, 91.0}
// Sort in Increasing Order
sort.Float64s(floatArr) // [12.1 23.1 91 111.1]
// Sort in Decreasing Order
sort.Sort(sort.Reverse(sort.Float64Slice(floatArr))) // [111.1 91 23.1 12.1]
```

Not-a-number (NaN) values are ordered before other values.

```go
floatArr := []float64{23.1, 12.1, math.NaN(), 111.1, 91.0}
// Sort in Increasing Order
sort.Float64s(floatArr) // [NaN 12.1 23.1 91 111.1]
// Sort in Decreasing Order
sort.Sort(sort.Reverse(sort.Float64Slice(floatArr))) // [111.1 91 23.1 12.1 NaN]
```

## Sort String

```go
strArr := []string{"Banana", "Apple", "Orange"}
// Sort in Increasing Order
sort.Strings(strArr) // [Apple Banana Orange]
// Sort in Decreasing Order
sort.Sort(sort.Reverse(sort.StringSlice(strArr))) // [Orange Banana Apple]
```

---

