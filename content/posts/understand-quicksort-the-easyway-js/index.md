---
title: "Understand Quicksort the Easyway in JS"
date: 2020-01-25T23:25:31+05:30
description: ""
draft: true
---

Quicksort is one of the efficient sorting algorithm and the average complexity is `O(n log n)`.

## How quicksort works? :thinking:

Quicksort works on the **_divide and conquer algorithm_**.

Select any element in the array and this element is known as **`pivot`**.  
Basically, quicksort is all about finding the correct position(index) of this `pivot` in the array.  
Elements less than pivot must be in the left side of the pivot and elements greater than the pivot must be in the right side of the pivot.

### Example explains better :wink:

We have an array

```js
[3, 6, 2, 5, 4, 1, 7];
```

Any element can be selected as pivot.  
For this example, the first element of the array is the `pivot` :anchor:

The `pivot` is `3`

```js
pivot: 3, [3, 6, 2, 5, 4, 1, 7];
```

Elements less than pivot: 2, 1  
Elements greater than pivot: 6, 5, 4, 7

The correct position of the pivot (3) in the array is at index 2.

```js
[2, 1, 3, 6, 5, 4, 7];
```

Once, the pivot is in the correct position, divide the array. The elements on the left and the right side of the pivot will be the sub-array.

```js
[2, 1, 3, 6, 5, 4, 7];
       ^ last pivot at the correct position
[2, 1]   [6, 5, 4, 7];
```

Sub-array 1: `[2, 1]`  
Sub-array 2: `[6, 5, 4, 7]`

#### Sub-array 1

Select the first element `2` as `pivot`.

```js
pivot: 2, [2, 1];
```

Elements less than pivot: 1  
Elements greater than pivot: No elements

The correct position of the pivot (2) in the sub-array is at index 1.

```js
[1, 2];
```

Now, again divide the array. Elements on the left side and the right side will be sub-array.

There is no need to create a sub-array, if there is only 1 element in the sub-array. It means pivot is already at the correct position in the array.

#### Sub-array 2

Select the first element `6` as `pivot`.

```js
pivot: 6, [6, 5, 4, 7];
```

Elements less than pivot: 5, 4  
Elements greater than pivot: 7

The correct position of the pivot (6) in the sub-array is at index 2.

```js
[5, 4, 6, 7];
```

Now, again divide the array. Elements on the left side and the right side of the pivot will be sub-array.

Sub-array 21: [5, 4]  
Sub-array 22: [7]

We have to keep dividing the array by the time all the pivot will be on its correct index.

After finding the correct position of pivot in `sub-array 21`

```js
[4, 5];
```

The final array with all its pivot at the correct position.

```js
[1, 2, 3, 4, 5, 6, 7];
```

Now, we understood the quicksort's process, let's implement it in `javascript`.

---

## JS implementation

The process has following steps:

1. Select the pivot.
2. The elements less than the pivot and the elements greater than them pivot, move them to the left side and the right side of the pivot respectively.

### Step 1

Select the first element of the array as **`pivot`**.

> :exclamation: Pivot can be any element of the array. The Step 2 may vary with respect to how the pivot is selected.

### Step 2

To move the elements in the left and in the right side of the pivot.

**_i_**: Start from the `leftmost` element and its index is `i`.  
**_j_**: Start from the `rightmost` element or the last element of the array and its index is `j`.

Whenever, element at index `i` is greater than the `pivot` and element at index `j` is smaller than the `pivot`, swap the elements at index `i` and `j`.

If, index `i` cross index `j` then stop there and swap the element at `j` index with the `pivot`.

The index `j` is the sorted position of the `pivot` in the array.

> The complete code is available on [gist](https://gist.github.com/schadokar/bd991d73d4579da7540227a9ada7f066).

{{< gist schadokar bd991d73d4579da7540227a9ada7f066 >}}

:bulb: Roll up your sleeves

- **Line 33:** Check the length of the array. If the length of the array is 1 or less than one, return the array as it is. It means array is already in sorted order.
- **Line 38:** Select the first element as the pivot.
- **Line 41:** Initialize index `i` to `1` as it is the `leftmost` element of the array.
- **Line 44:** Initialize index `j` to `arr.length-1`, the last index of the array as it is the `rightmost` element of the array.
- **Line 47:** Iterate till index `i` do not cross index `j`.
- **Line 49:**
