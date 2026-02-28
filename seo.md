# Why Nobody's Visiting Your Website (And How to Fix It)

> Google doesn't know you exist. This guide covers everything — Search Console, Bing, IndexNow, sitemaps, robots.txt, meta tags, Open Graph, site speed, and mobile optimization.

You launched your website. You told your friends. You posted on social media.

Then... nothing. The analytics show single digits. Maybe double digits on a good day. But mostly silence.

Here's the truth: **Google doesn't know you exist.**

You assumed search engines would just "find" your site. They don't. Not automatically. Not quickly. Not without help.

I made this mistake with my first few projects. Beautiful landing pages. Zero organic traffic. I was invisible.

This guide is everything I learned fixing that. Every tool. Every setting. Every trick that actually moves the needle.

Let's make you visible.

---

## Table of Contents

1. [Part 1: Google Search Console](#part-1-google-search-console)
2. [Part 2: Bing Webmaster Tools](#part-2-bing-webmaster-tools)
3. [Part 3: IndexNow](#part-3-indexnow)
4. [Part 4: Sitemaps](#part-4-sitemaps)
5. [Part 5: Robots.txt](#part-5-robotstxt)
6. [Part 6: Keyword Research](#part-6-keyword-research)
7. [Part 7: Meta Tags](#part-7-meta-tags)
8. [Part 8: Schema / Structured Data](#part-8-schema--structured-data)
9. [Part 9: Open Graph Tags](#part-9-open-graph-tags)
10. [Part 10: Site Speed](#part-10-site-speed)
11. [Part 11: Mobile Optimization](#part-11-mobile-optimization)
12. [Part 12: Ongoing SEO](#part-12-ongoing-seo)
13. [Part 13: E-E-A-T & AI Overviews](#part-13-e-e-a-t--ai-overviews)
14. [The Checklist](#the-checklist-summary)

---

## Part 1: Google Search Console

This is step zero. If you skip everything else, don't skip this.

Google Search Console is Google's direct line to you. It's how you tell Google your site exists. It's how you see what's working and what's broken.

### Why It Matters

**Without Search Console:**

- Google might take weeks or months to find your site
- You won't know if pages are being indexed
- You won't know what keywords you're ranking for
- You won't know if there are crawl errors
- You're flying completely blind

**With Search Console:**

- You submit your sitemap directly to Google
- You see exactly which pages are indexed
- You see what searches bring people to your site
- You catch errors before they hurt you
- You have data to make decisions

### How to Set It Up

#### Step 1: Go to Google Search Console

Visit [search.google.com/search-console](https://search.google.com/search-console) and sign in with your Google account.

#### Step 2: Add Your Property

Click **"Add property"** and choose **"URL prefix"** (easier) or **"Domain"** (more comprehensive).

- **URL prefix:** Enter your full URL (`https://yoursite.com`)
- **Domain:** Enter just the domain (`yoursite.com`)

#### Step 3: Verify Ownership

Google needs to confirm you own this site. Options:

- **HTML file upload:** Download a file, upload to your site root
- **HTML tag:** Add a meta tag to your homepage `<head>`
- **DNS record:** Add a TXT record to your domain settings
- **Google Analytics:** If already installed, verify through that
- **Google Tag Manager:** If already installed, verify through that

For most people, the HTML tag is easiest:

```html
<meta name="google-site-verification" content="your-verification-code">
```

#### Step 4: Submit Your Sitemap

Go to **"Sitemaps"** in the left menu, enter your sitemap URL (usually `yoursite.com/sitemap.xml`), and click **"Submit."**

#### Step 5: Wait and Watch

Initial indexing takes a few days. Check back in a week. Look for errors in the **"Pages"** report. See what's indexed vs. what's not.

### What to Monitor

**Coverage Report (Pages)**
- How many pages are indexed?
- Are any pages excluded? Why?
- Are there crawl errors?

**Performance Report**
- What queries bring traffic?
- What's your average position?
- Which pages get the most clicks?
- What's your click-through rate?

**Core Web Vitals**
- Is your site fast enough?
- Are there layout shift issues?
- Mobile vs. desktop performance

Check this weekly at first. Monthly once things are stable.

---

## Part 2: Bing Webmaster Tools

"But nobody uses Bing."

Wrong.

Bing has roughly **10% of global search market share**. That's hundreds of millions of searches daily. And here's the thing: most of your competitors aren't optimizing for Bing.

Less competition = easier wins.

### Why Bing Matters

- 10% market share globally (higher in US)
- Powers DuckDuckGo search results
- Powers Yahoo search results
- Powers Alexa voice search
- Less competitive than Google
- Often indexes faster than Google

When you optimize for Bing, you're actually reaching multiple platforms.

### How to Set It Up

#### Step 1: Go to Bing Webmaster Tools

Visit [bing.com/webmasters](https://bing.com/webmasters) and sign in with a Microsoft, Google, or Facebook account.

#### Step 2: Import from Google Search Console (Easiest)

Click **"Import,"** sign in to your Google account, select your Search Console property. Bing imports your sitemap and settings automatically.

That's it. One click. You're done.

#### Step 3: Or Add Manually

If you prefer manual setup:

1. Click **"Add your site manually"**
2. Enter your URL
3. Verify ownership (similar options to Google)
4. Submit your sitemap

#### Step 4: Enable IndexNow

While you're in Bing Webmaster Tools:

1. Go to **"Configure My Site"**
2. Find **"IndexNow"**
3. Generate your API key
4. Follow the setup instructions

More on IndexNow in the next section.

### What to Monitor

- **Search Performance** — Clicks, impressions, CTR, position. Compare to Google data. Sometimes different keywords perform better on Bing.
- **SEO Reports** — Bing has built-in SEO auditing. Checks for common issues. Gives specific recommendations.
- **Crawl Information** — Are pages being crawled? Any crawl errors? Crawl frequency.

---

## Part 3: IndexNow

This one's a game-changer that most people don't know about.

Normally, you publish a page and wait. Wait for Google to crawl. Wait for Bing to crawl. Could be days. Could be weeks.

IndexNow flips that. Instead of waiting for search engines to find you, you ping them directly.

> "Hey, I just published something. Come index it."

### How It Works

1. You publish or update a page
2. You send a ping to the IndexNow API
3. Bing, Yandex, and other participating engines get notified
4. They crawl your page almost immediately

### Who Supports IndexNow

**Currently supporting:** Bing, Yandex, Seznam, Naver

**Not supporting:** Google. As of 2026, Google has confirmed it does not support IndexNow and relies on its own Googlebot crawl infrastructure. Google's separate [Indexing API](https://developers.google.com/search/apis/indexing-api/v3/quickstart) only applies to job posting and live-stream pages. For Google, continue using Search Console's URL Inspection tool and your sitemap.

Even without Google, instant indexing on Bing is valuable.

### How to Set It Up

#### Step 1: Generate an API Key

Any string works (use a UUID generator) or get one from Bing Webmaster Tools.

Example: `a1b2c3d4e5f6g7h8i9j0`

#### Step 2: Create the Key File

1. Create a text file named `{your-api-key}.txt`
2. Put your API key inside the file
3. Upload to your site root so it's accessible at:

```
https://yoursite.com/a1b2c3d4e5f6g7h8i9j0.txt
```

#### Step 3: Ping When You Publish

When you publish or update a page, send a GET request:

```
https://api.indexnow.org/indexnow?url=https://yoursite.com/new-page&key=a1b2c3d4e5f6g7h8i9j0
```

Or POST multiple URLs at once:

```json
{
  "host": "yoursite.com",
  "key": "a1b2c3d4e5f6g7h8i9j0",
  "urlList": [
    "https://yoursite.com/page1",
    "https://yoursite.com/page2"
  ]
}
```

#### Step 4: Automate It

Most frameworks and CMS platforms have plugins:

- **WordPress:** IndexNow plugin
- **Next.js:** Add to your build process
- **Vercel:** Use deploy hooks
- **Cloudflare:** Built-in IndexNow support

If you're using a custom setup, add the ping to your deployment script.

### When to Use IndexNow

- Publishing new pages
- Updating existing content significantly
- Launching your site
- Adding new blog posts
- Changing important metadata

> **Don't spam it.** Search engines will ignore excessive pings.

---

## Part 4: Sitemaps

A sitemap is a file that lists all the pages on your site. It tells search engines what exists and how to find it.

### Why Sitemaps Matter

**Without a sitemap:**
- Search engines have to discover pages by following links
- Orphan pages might never be found
- Large sites take longer to fully crawl
- Search engines might miss important pages

**With a sitemap:**
- Search engines know exactly what pages exist
- They can prioritize what to crawl
- New pages get discovered faster
- You can indicate update frequency and priority

### Sitemap Format

Sitemaps are XML files. Basic structure:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://yoursite.com/</loc>
    <lastmod>2024-01-15</lastmod>
    <changefreq>weekly</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://yoursite.com/about</loc>
    <lastmod>2024-01-10</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
</urlset>
```

**Elements:**

| Element | Description |
|---|---|
| `loc` | The page URL (required) |
| `lastmod` | When the page was last updated (optional but recommended) |
| `changefreq` | How often it changes (optional, often ignored by engines) |
| `priority` | Relative importance within your site (optional) |

### How to Create a Sitemap

#### Option 1: Automatic Generation

Most frameworks generate sitemaps automatically:

- **Next.js:** Use `next-sitemap` package
- **WordPress:** Use Yoast SEO or Rank Math plugin
- **Gatsby:** Use `gatsby-plugin-sitemap`
- **Hugo:** Built-in sitemap generation
- **Webflow:** Automatic sitemap

#### Option 2: Online Generators

For static sites: [xml-sitemaps.com](https://xml-sitemaps.com) or Screaming Frog SEO Spider. Generate and upload manually.

#### Option 3: Manual Creation

For very small sites, you can write it by hand. But automated is better.

### Where to Put It

- Standard location: `https://yoursite.com/sitemap.xml`
- Reference it in your `robots.txt`
- Submit it to Google Search Console
- Submit it to Bing Webmaster Tools

### Sitemap Best Practices

- Keep it under 50,000 URLs per sitemap
- Keep file size under 50MB uncompressed
- For larger sites, use sitemap index files
- Update `lastmod` when content actually changes
- Don't include pages you don't want indexed
- Only include canonical URLs

---

## Part 5: Robots.txt

`robots.txt` tells search engines what they can and can't crawl. It's a set of rules at your site root.

### Why Robots.txt Matters

- Prevents crawling of private or duplicate pages
- Saves crawl budget for important pages
- Points search engines to your sitemap
- Can block specific bots

### Basic Structure

Located at: `https://yoursite.com/robots.txt`

```text
User-agent: *
Allow: /
Disallow: /admin/
Disallow: /api/
Sitemap: https://yoursite.com/sitemap.xml
```

**Directives:**

| Directive | Description |
|---|---|
| `User-agent` | Which bot this applies to (`*` means all) |
| `Allow` | Paths that can be crawled |
| `Disallow` | Paths that shouldn't be crawled |
| `Sitemap` | Location of your sitemap |

### Common Patterns

**Allow everything (most common):**

```text
User-agent: *
Allow: /
Sitemap: https://yoursite.com/sitemap.xml
```

**Block specific directories:**

```text
User-agent: *
Allow: /
Disallow: /admin/
Disallow: /private/
Disallow: /api/
Disallow: /tmp/
Sitemap: https://yoursite.com/sitemap.xml
```

**Block specific bots:**

```text
User-agent: BadBot
Disallow: /

User-agent: *
Allow: /
```

### What to Block

- Admin panels
- API endpoints
- Search result pages (on your site)
- Duplicate content
- User-generated private content
- Development or staging paths
- Files you don't want indexed (internal PDFs, etc.)

### What NOT to Block

- CSS and JavaScript files (search engines need these to render pages)
- Images you want in image search
- Your main content pages
- Your sitemap

### Common Mistakes

**Blocking everything accidentally:**

```text
User-agent: *
Disallow: /
```

This blocks your entire site. Don't do this unless you mean it.

**Blocking CSS/JS:**

```text
Disallow: /css/
Disallow: /js/
```

This prevents search engines from rendering your pages properly.

### Testing Your Robots.txt

Google Search Console has a robots.txt tester. Test before deploying changes. Check for typos and syntax errors.

---

## Part 6: Keyword Research

Keywords are the bridge between what people type into search engines and what your pages talk about. Writing great content without keyword research is guessing. Don't guess.

### Why Keyword Research Matters

- You learn exactly what language your audience uses
- You discover the actual demand before investing time writing
- You avoid targeting keywords you can't realistically rank for
- You map intent — someone searching "how to track expenses" wants a guide, not a product page

### Find Your Seed Keywords

Start broad. What does your site or product do? Write down 5–10 terms that describe it.

For a personal finance app: *expense tracker, spending tracker, budget app, money manager*.

### Expand with Free Tools

- **Google Search** — Type a keyword and look at "People Also Ask" and "Related Searches" at the bottom. These are real queries people type.
- **Google Keyword Planner** — [ads.google.com/keywordplanner](https://ads.google.com/keywordplanner) — shows search volume and competition data. Free with a Google Ads account (you don't need to run ads).
- **Google Trends** — [trends.google.com](https://trends.google.com) — useful for seasonal patterns and trending topics in your niche.
- **AnswerThePublic** — [answerthepublic.com](https://answerthepublic.com) — generates question-format keywords automatically.

If budget allows, Ahrefs, Semrush, or Moz give more precise volume and difficulty data.

### Evaluate Each Keyword

Don't just pick keywords because they sound right. Assess them:

| Factor | What to Look For |
|---|---|
| **Search Volume** | Is anyone actually searching this? |
| **Keyword Difficulty** | Can a site like yours realistically rank? |
| **Search Intent** | Informational, navigational, or transactional? |
| **Relevance** | Does it match what your page actually delivers? |

> **Best starting point:** Long-tail keywords (3+ words). Lower competition, higher intent, easier to rank.

### Map Keywords to Pages

- Assign **one primary keyword** per page — competing with yourself splits ranking signals
- Identify 2–3 secondary/related keywords per page
- Create a simple keyword map: spreadsheet with Page URL → Primary Keyword → Secondary Keywords
- Flag gaps — topics your competitors rank for that you don't cover yet

---

## Part 7: Meta Tags

Meta tags live in the `<head>` of your HTML. They tell search engines and social platforms about your page.

### Title Tag

The most important meta tag for SEO.

```html
<title>eqva money - Voice Expense Tracker for Travelers</title>
```

**Best practices:**

- Under 60 characters (longer gets truncated)
- Include primary keyword
- Make it compelling (this shows in search results)
- Each page should have a unique title
- Put important keywords first

| | Example |
|---|---|
| ❌ Bad | `Home \| eqva money` |
| ✅ Good | `eqva money - Voice Expense Tracker for Travelers` |

### Meta Description

Doesn't directly affect ranking, but affects click-through rate.

```html
<meta name="description" content="Track expenses by speaking. Multi-currency. Offline. No ads. Free download for iOS and Android.">
```

**Best practices:**

- Under 160 characters
- Include a call to action
- Summarize the page content
- Make it compelling (this shows in search results)
- Each page should have a unique description
- Include relevant keywords naturally

### Canonical Tag

Tells search engines which version of a page is the "official" one.

```html
<link rel="canonical" href="https://yoursite.com/page">
```

**When to use:**

- If your page is accessible at multiple URLs
- If you have `www` and non-`www` versions
- If you have HTTP and HTTPS versions
- If you have duplicate or very similar pages

### Meta Robots

Controls indexing and following links on a specific page.

```html
<meta name="robots" content="index, follow">
```

**Options:**

| Value | Meaning |
|---|---|
| `index` | Allow indexing (default) |
| `noindex` | Don't index this page |
| `follow` | Follow links on this page (default) |
| `nofollow` | Don't follow links |
| `noarchive` | Don't show cached version |

**Common combinations:**

- `index, follow` — Normal page (default, you don't need to specify)
- `noindex, follow` — Don't index but follow links (for utility pages)
- `noindex, nofollow` — Completely ignore (for private pages)

### Viewport Meta Tag

Essential for mobile responsiveness.

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

If you don't have this, your site will look broken on mobile, and Google will penalize you in mobile rankings.

---

## Part 8: Schema / Structured Data

Schema markup (JSON-LD) tells search engines *exactly* what your content is. It enables rich results — star ratings, FAQs, breadcrumbs, article dates — directly in the search results page (SERP). More visibility without earning a higher rank.

### How It Works

You embed a `<script type="application/ld+json">` block in your page's `<head>`. Search engines read it and use it to generate rich results.

### Common Schema Types

| Page Type | Schema to Use |
|---|---|
| Homepage | `WebSite`, `Organization` |
| Blog post / Article | `Article`, `BreadcrumbList` |
| FAQ section | `FAQPage` |
| Product page | `Product`, `Offer`, `AggregateRating` |
| Local business | `LocalBusiness` |

### WebSite Schema (Homepage)

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "name": "Your Site Name",
  "url": "https://yoursite.com"
}
</script>
```

### Article Schema (Blog Posts)

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Your Article Title",
  "datePublished": "2025-01-15",
  "dateModified": "2025-02-01",
  "author": { "@type": "Person", "name": "Your Name" }
}
</script>
```

### FAQPage Schema

If your page has a Q&A section, FAQPage schema can get your answers listed directly in search results — a significant click-through rate boost.

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is your question?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Your concise answer here."
      }
    }
  ]
}
</script>
```

### Validate Your Schema

Always test before going live:

- [Google Rich Results Test](https://search.google.com/test/rich-results) — checks if your schema is eligible for rich results
- [Schema.org Validator](https://validator.schema.org) — general schema validation

Monitor live status in Google Search Console under **Enhancements**.

---

## Part 9: Open Graph Tags

Open Graph tags control how your pages appear when shared on social media.

### Why Open Graph Matters

**Without Open Graph,** social platforms guess what to show:
- Wrong image or no image
- Truncated or generic title
- Missing description
- Your links look unprofessional

**With Open Graph,** you control the preview:
- Consistent branding across platforms
- Higher click-through rates
- Professional appearance

### Essential Open Graph Tags

```html
<meta property="og:title" content="eqva money - Voice Expense Tracker">
<meta property="og:description" content="Track expenses by speaking. One tap. Done.">
<meta property="og:image" content="https://yoursite.com/og-image.png">
<meta property="og:url" content="https://yoursite.com">
<meta property="og:type" content="website">
<meta property="og:site_name" content="eqva money">
```

### Twitter-Specific Tags

Twitter (X) has its own card system.

```html
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="@yourtwitterhandle">
<meta name="twitter:title" content="eqva money - Voice Expense Tracker">
<meta name="twitter:description" content="Track expenses by speaking. One tap. Done.">
<meta name="twitter:image" content="https://yoursite.com/twitter-card.png">
```

**Card types:**

| Type | Description |
|---|---|
| `summary` | Small square image with text |
| `summary_large_image` | Large rectangular image (recommended) |

### Image Specifications

**Open Graph image:**

| Property | Value |
|---|---|
| Recommended size | 1200 × 630 pixels |
| Minimum size | 600 × 315 pixels |
| Aspect ratio | 1.91:1 |
| Format | PNG or JPG |
| Max file size | 8MB |

**Twitter image:**

| Property | Value |
|---|---|
| Summary card | 144 × 144 pixels minimum |
| Summary large image | 300 × 157 pixels minimum |
| Recommended | 1200 × 628 pixels |
| Max file size | 5MB |

### Testing Open Graph

- **Facebook Sharing Debugger:** [developers.facebook.com/tools/debug/](https://developers.facebook.com/tools/debug/)
- **Twitter Card Validator:** [cards-dev.twitter.com/validator](https://cards-dev.twitter.com/validator)
- **LinkedIn Post Inspector:** [linkedin.com/post-inspector/](https://linkedin.com/post-inspector/)

### Common Mistakes

- **Missing `og:image`:** The most common mistake. Always include an image.
- **Wrong image dimensions:** Images get cropped weirdly. Use the recommended sizes.
- **HTTP instead of HTTPS in URLs:** Some platforms won't load insecure images.
- **Caching issues:** Social platforms cache Open Graph data. Use their debugging tools to force refresh.

---

## Part 10: Site Speed

Google considers page speed a ranking factor. Slow sites rank lower and lose visitors.

### Why Speed Matters

- Google uses speed as a ranking signal
- Users bounce from slow sites
- Mobile users are especially impatient
- Speed affects conversion rates
- Core Web Vitals are now ranking factors

### Core Web Vitals

Google's three key metrics:

**Largest Contentful Paint (LCP)** — How long until the main content is visible

| Rating | Threshold |
|---|---|
| ✅ Good | Under 2.5 seconds |
| ⚠️ Needs improvement | 2.5 – 4 seconds |
| ❌ Poor | Over 4 seconds |

**Interaction to Next Paint (INP)** — Responsiveness across all interactions during a page visit (replaced FID in March 2024)

| Rating | Threshold |
|---|---|
| ✅ Good | Under 200 milliseconds |
| ⚠️ Needs improvement | 200 – 500 milliseconds |
| ❌ Poor | Over 500 milliseconds |

**Cumulative Layout Shift (CLS)** — How much the page jumps around while loading

| Rating | Threshold |
|---|---|
| ✅ Good | Under 0.1 |
| ⚠️ Needs improvement | 0.1 – 0.25 |
| ❌ Poor | Over 0.25 |

### How to Test Speed

- **Google PageSpeed Insights:** [pagespeed.web.dev](https://pagespeed.web.dev)
- **Google Lighthouse:** Built into Chrome DevTools (Right-click → Inspect → Lighthouse tab)
- **WebPageTest:** [webpagetest.org](https://webpagetest.org) — more detailed waterfall analysis

### Common Speed Fixes

**Images:**
- Compress images (use TinyPNG, ImageOptim)
- Use modern formats (WebP, AVIF)
- Lazy load images below the fold
- Specify dimensions to prevent layout shift

**JavaScript:**
- Minimize and compress JS
- Defer non-critical scripts
- Remove unused code
- Code-split large bundles

**CSS:**
- Minimize and compress CSS
- Inline critical CSS
- Remove unused styles
- Avoid render-blocking CSS

**Hosting:**
- Use a CDN
- Enable caching
- Use HTTP/2 or HTTP/3
- Choose fast hosting (Vercel, Netlify, Cloudflare Pages)

**Fonts:**
- Use system fonts when possible
- Preload custom fonts
- Use `font-display: swap`
- Subset fonts to only needed characters

---

## Part 11: Mobile Optimization

More than half of web traffic is mobile. Google uses mobile-first indexing. If your site doesn't work on mobile, you're invisible.

### Mobile-First Indexing

Google primarily uses the **mobile version** of your site for ranking. This means:

- Mobile content must match desktop content
- Mobile site must be fast
- Mobile site must be usable
- Missing mobile content = missing from index

### How to Check Mobile Friendliness

- **Google's Mobile-Friendly Test:** [search.google.com/test/mobile-friendly](https://search.google.com/test/mobile-friendly)
- **Google Search Console:** Mobile Usability report shows mobile-specific errors
- **Manual testing:** Actually use your site on a phone; test on multiple devices and browsers; test all key flows

### Common Mobile Issues

**Text too small:**
- Base font size should be at least 16px
- Line height should be at least 1.5
- Don't require zooming to read

**Tap targets too small:**
- Buttons should be at least 48×48 pixels
- Adequate spacing between tap targets
- Test with your actual finger, not a mouse

**Content wider than screen:**
- Use responsive design
- Don't use fixed widths
- Test horizontal scrolling

**Viewport not set:**

Always include the viewport meta tag:

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

**Interstitials blocking content:**
- Google penalizes intrusive interstitials
- Popups that block content hurt mobile ranking
- Use banners instead of full-screen popups

---

## Part 12: Ongoing SEO

SEO isn't a one-time setup. It's ongoing work.

### Weekly Tasks

- Check Google Search Console for errors
- Review performance data
- Monitor Core Web Vitals
- Check for broken links

### Monthly Tasks

- Review keyword rankings
- Analyze top-performing content
- Check competitor rankings
- Update outdated content
- Review and refresh meta descriptions

### Quarterly Tasks

- Full site audit
- Review and update sitemap
- Check all structured data
- Review backlink profile
- Update content strategy

### Content Updates

Fresh content helps SEO:

- Update old posts with new information
- Add new pages for new keywords
- Write about trending topics in your niche
- Keep dates and statistics current
- Add internal links to new content

### Building Authority

- Get mentioned on other sites
- Guest post on relevant blogs
- Create shareable content
- Build relationships in your niche
- Earn natural backlinks through quality

---

## Part 13: E-E-A-T & AI Overviews

Two of the most important shifts in modern SEO — Google's quality evaluation framework and the rise of AI-generated search answers.

### E-E-A-T

Google evaluates content quality using **Experience, Expertise, Authoritativeness, and Trustworthiness**. It's especially critical for content covering health, finance, law, or major purchase decisions — but it matters for every site.

E-E-A-T isn't a direct ranking algorithm you can toggle. It's a framework Google's quality raters use to assess sites, and it influences how algorithms treat your content over time.

**How to build E-E-A-T signals:**

- Add an **About page** with real credentials, your background, and contact information
- Include **author bios** on all articles — name, relevant experience, links to their other work
- Cite **credible external sources** — link to primary research, official documentation, authoritative publications
- Add `author` and `datePublished` fields to your Article schema (see Part 8)
- Display a **privacy policy** and make contact information easy to find
- Show **genuine reviews or testimonials** where relevant to your content

### Google AI Overviews (Generative Engine Optimisation / GEO)

Google's AI Overviews now answer questions directly at the top of search results. Being cited in these boxes is valuable organic visibility — your page might drive impressions and authority even if the user doesn't click through.

You can't guarantee inclusion, but you can optimise for it:

- Write content that **directly answers specific questions** — one clear answer per section, not buried in paragraphs
- Use **question-format headings**: "How does X work?" "What is the best Y for Z?"
- Add `FAQPage` schema to question-based content (Part 8)
- Keep sentences **concise and factual** — AI systems extract and quote precise, standalone statements
- Build **topical authority** by covering a subject comprehensively across multiple linked pages, not just one long post
- Monitor which pages appear in AI Overviews via Google Search Console → **Search Appearance** filter

> The overlap between E-E-A-T and GEO is intentional: both reward content written by people with genuine expertise, structured clearly, and backed by credible sources.

---

## The Checklist (Summary)

Here's everything in one place. Go through this systematically.

### Google Search Console

- [ ] Account created
- [ ] Property added
- [ ] Ownership verified
- [ ] Sitemap submitted
- [ ] No critical errors

### Bing Webmaster Tools

- [ ] Account created
- [ ] Site added (or imported from Google)
- [ ] Sitemap submitted
- [ ] IndexNow enabled

### IndexNow

- [ ] API key generated
- [ ] Key file uploaded to site root
- [ ] Ping integrated into publish workflow
- [ ] Tested and working

### Sitemap

- [ ] Sitemap generated
- [ ] Includes all important pages
- [ ] Accessible at `/sitemap.xml`
- [ ] Submitted to Google
- [ ] Submitted to Bing
- [ ] Referenced in `robots.txt`

### Robots.txt

- [ ] File exists at `/robots.txt`
- [ ] Not blocking important content
- [ ] Not blocking CSS/JS
- [ ] Points to sitemap
- [ ] Tested in Search Console

### Keyword Research

- [ ] Seed keywords identified for each core page
- [ ] Keywords researched with volume and difficulty data
- [ ] Search intent confirmed for each keyword
- [ ] Keyword map created (page → primary keyword → secondaries)
- [ ] Keyword gaps identified vs. competitors

### Meta Tags

- [ ] Unique title tag on every page
- [ ] Unique meta description on every page
- [ ] Viewport meta tag present
- [ ] Canonical tags where needed

### Schema / Structured Data

- [ ] `WebSite` schema on homepage
- [ ] `Article` schema on all blog posts (with `author` and `datePublished`)
- [ ] `FAQPage` schema on any FAQ sections
- [ ] All schema validated with Rich Results Test
- [ ] Rich result status monitored in Search Console

### Open Graph

- [ ] `og:title` set
- [ ] `og:description` set
- [ ] `og:image` set (1200×630)
- [ ] `og:url` set
- [ ] Twitter card tags set
- [ ] Tested in Facebook debugger
- [ ] Tested in Twitter validator

### Site Speed

- [ ] PageSpeed score above 90 (desktop)
- [ ] PageSpeed score above 70 (mobile)
- [ ] LCP under 2.5 seconds
- [ ] CLS under 0.1
- [ ] Images optimized
- [ ] JavaScript minimized

### Mobile

- [ ] Mobile-friendly test passed
- [ ] Text readable without zooming
- [ ] Tap targets large enough
- [ ] No horizontal scrolling
- [ ] Viewport meta tag present

### E-E-A-T & AI Overviews

- [ ] About page with real credentials and contact info published
- [ ] Author bios on all articles
- [ ] Article schema includes `author` and `datePublished`
- [ ] Key pages use question-format headings
- [ ] `FAQPage` schema added to question-based content
- [ ] AI Overview appearances monitored in Search Console
