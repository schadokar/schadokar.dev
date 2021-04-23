---
title: "How to Add RSS feed to Hugo Website"
date: 2021-04-23T14:01:13+05:30
description: ""
categories: ["Hugo", "2021", "to-the-point"]
tags: ["hugo", "2021", "to-the-point"]
cover: https://schadokar.dev/images/basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
---

## What is RSS feed?

How do you keep yourself updated with your favorite websites or bloggers? By visiting their websites or subscribing to the newsletter. 

Using rss feed you can get all the updates of different websites at 1 place, provided that website should have rss feed enabled in it. 

If it is enabled then you can copy the RSS feed link and paste it any RSS reader application.

RSS feed supports xml format.

> **RSS** (**[RDF](https://en.wikipedia.org/wiki/Resource_Description_Framework) Site Summary** or **Really Simple Syndication**)[[2\]](https://en.wikipedia.org/wiki/RSS#cite_note-powers-2003-1-2) is a [web feed](https://en.wikipedia.org/wiki/Web_feed)[[3\]](https://en.wikipedia.org/wiki/RSS#cite_note-Netsc99-3) that allows users and applications to access updates to websites in a standardized, computer-readable format. These feeds can, for example, allow a user to keep track of many different websites in a single [news aggregator](https://en.wikipedia.org/wiki/News_aggregator). - [Wikipedia]()

## Add RSS feed to Hugo Website

By default, hugo provides its own RSS 2.0 template. 

Hugo RSS [documentation](https://gohugo.io/templates/rss/) might be little confusing.

In short, the hugo RSS feed is available at `index.xml`. You don't need to set it up or configure anything.

This blog is powered by Hugo and RSS feed is available on different levels of the website.

For Example: `https://schadokar.dev` is the root level. The root level of RSS feed is `https://schadokar.dev/index.xml`.

The root level will notify for any update in the website.

RSS feed of only `posts` is `https://schadokar.dev/posts/index.xml`.

In the same way for other pages.

You can also create your own RSS template. 

---

