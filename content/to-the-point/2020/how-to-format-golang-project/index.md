---
title: "How to Format Golang Project"
date: 2020-12-23T22:45:35+05:30
description: "Golang comes with an inbuilt package which format the complete project or a file."
categories: ["Golang", "2020", "to-the-point"]
tags: ["golang"]
cover: https://schadokar.dev/images/golang-basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

Golang is a strictly typed language. It tells you hw to write clean code and it takes care of formatting.  
Unlike many languages where formatting style is opinionated, in Golang it is defined by design.

## Formatting

Golang CLI command `fmt` is used to format the file or files.

### Format 1 file

Open the terminal in the golang project.  
Run the below command.

```go
go fmt main.go
```

### Format all the files in the folder

Use `./{folder name}` notation to give a particular folder.

```go
go fmt ./domain
```

To format the root folder or where terminal is opened.

```go
go fmt .

OR

go fmt ./

OR

go fmt
```

> If you don't pass any argument then it formats the current directory.

### Format all the folders recursively

Use `./...` special syntax to format the complete project.

```go
go fmt ./...
```

## Final Words

If you're using git then create a `makefile` or a `bash` file to format it before committing the code.

---
