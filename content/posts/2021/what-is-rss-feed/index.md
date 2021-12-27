---
title: "What is RSS feed, RSS reader and Should I use it"
date: 2021-04-24T11:11:31+05:30
description: ""
categories: ["2021"]
tags: ["rss-feed", "2021"]
cover: https://schadokar.dev/images/basic.png #image show on top
readingTime: true # show reading time after article date
toc: true
comments: true
published: true
badge: New Article
---

## What is RSS feed, RSS reader and Do I need it?

In simple words, you can consider this as a subscription of a website. Unlike newsletters and other subscriptions where format varies from one platform to another, RSS feed is coded in XML. 

All the websites who want to support RSS feed has to convert their content in XML format. Now as a reader, you don't have to go to all your favorite websites. You can subscribe to websites' RSS feed and read all the content in a RSS reader. 

RSS feed in xml format looks like this.

```xml
<rss xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/" version="2.0">
<channel>
	<title>Posts on Shubham Chadokar</title>
	<link>/posts/</link>
	<description>Recent content in Posts on Shubham Chadokar</description>
	<generator>Hugo -- gohugo.io</generator>
	<language>en</language>
	<copyright>&copy; <a href="https://schadokar.dev">Shubham Chadokar</a> 2021</copyright>
	<lastBuildDate>Tue, 20 Apr 2021 13:54:31 +0530</lastBuildDate>
	<atom:link href="/posts/index.xml" rel="self" type="application/rss+xml"/>
	<item>
        <title>Create a Cryptocurrency Exchange Rate in Html Part 1</title>
        <link>/posts/create-a-cryptocurrency-exchange-rate-in-html-part-1/</link>
        <pubDate>Tue, 20 Apr 2021 13:54:31 +0530</pubDate>
        <guid>/posts/create-a-cryptocurrency-exchange-rate-in-html-part-1/</guid>
        <description>This is a series of 3 tutorials in which we will build a cryptocurrency exchange rate dashboard in HTML using materialize css and coinbase free api. Part 1: Simple Cryptocurrency Exchange Rate Dashboard Part 2: Add pagination in cryptocurrency exchange rate Part 3: Change base currency BTC to other currencies like USD, EUR INR. Project Setup Create a cryptocurrency-exchange-rate directory. 1|- cryptocurrency-exchange-rate 2 |- icons 3 |- exchange-rates.js 4 |- index.</description>
    </item>
</channel>
</rss>
```

> **RSS** (**[RDF](https://en.wikipedia.org/wiki/Resource_Description_Framework) Site Summary** or **Really Simple Syndication**)[[2\]](https://en.wikipedia.org/wiki/RSS#cite_note-powers-2003-1-2) is a [web feed](https://en.wikipedia.org/wiki/Web_feed)[[3\]](https://en.wikipedia.org/wiki/RSS#cite_note-Netsc99-3) that allows users and applications to access updates to websites in a standardized, computer-readable format. These feeds can, for example, allow a user to keep track of many different websites in a single [news aggregator](https://en.wikipedia.org/wiki/News_aggregator). - [Wikipedia](https://en.wikipedia.org/wiki/RSS)

## What is RSS Reader?

The RSS readers are applications which converts the XML formatted RSS feed to the user readable format. These are also known as [News Aggregator](https://en.wikipedia.org/wiki/News_aggregator).

These readers many features like filtering, notification, save to notes, mobile support and etc.

There are many RSS readers available.

- [Feedly](https://feedly.com/)
- [Feedreader](https://feedreader.com/)
- [Feeder](https://feeder.co/)

## Should you add RSS feed in your website?

It is completely your choice. Adding RSS feed to your website doesn't take a ton of coding. Many frameworks ships with default RSS feed like Hugo.

Adding it in your website only gives your reader one more option to subscribe to your content.

Use all the available options to keep your readers life easy.

## Should I use RSS reader?

RSS readers are great way to keep yourself updated with your favorite websites content. You can maintain a to-do list to read later or categorize the content etc.

In the end it is your choice. 

Hope this small post gave you little insights on RSS.

---

