# SEO Implementation Plan

> A structured, multi-phase roadmap to go from zero organic traffic to a fully optimized, search-engine-visible website. Based on the guide: *Why Nobody's Visiting Your Website (And How to Fix It)*.

---

## Overview

| Phase | Name | Focus | Timeline |
|---|---|---|---|
| **Phase 1** | Foundation & Discovery | Search Console + Bing Setup | Day 1 |
| **Phase 2** | Crawlability | Sitemap + Robots.txt | Day 1–2 |
| **Phase 3** | Keyword Research | Target Keywords + Intent Mapping | Day 2 |
| **Phase 4** | On-Page Signals | Meta Tags + Schema + Open Graph | Day 2–4 |
| **Phase 5** | Performance | Site Speed + Mobile Optimization | Week 1–2 |
| **Phase 6** | Instant Indexing | IndexNow Integration | Week 2 |
| **Phase 7** | Ongoing SEO | Content, E-E-A-T, Authority, Monitoring | Recurring |

---

## Phase 1: Foundation & Discovery

> **Goal:** Let search engines know you exist and establish monitoring dashboards.

### 1.1 Google Search Console

- [ ] Visit [search.google.com/search-console](https://search.google.com/search-console) and sign in
- [ ] Add your property (URL prefix: `https://yoursite.com`)
- [ ] Verify ownership by adding the HTML meta tag to your `<head>`:
  ```html
  <meta name="google-site-verification" content="your-verification-code">
  ```
- [ ] Submit your sitemap at `yoursite.com/sitemap.xml`
- [ ] Confirm no critical crawl errors in the **Pages** report

**What to monitor after setup:**

| Report | What to Look For |
|---|---|
| Coverage (Pages) | Indexed count, excluded pages, crawl errors |
| Performance | Top queries, average position, CTR |
| Core Web Vitals | LCP, CLS, INP pass/fail status |

> ✅ Check weekly for the first month, then monthly once stable.

---

### 1.2 Bing Webmaster Tools

- [ ] Visit [bing.com/webmasters](https://bing.com/webmasters) and sign in
- [ ] **Fastest path:** Click **"Import"** → sign in to Google → import from Search Console
- [ ] Confirm sitemap is imported and site is verified
- [ ] Navigate to **Configure My Site → IndexNow** and generate your API key (save it for Phase 5)

**Why it matters:** Bing powers DuckDuckGo, Yahoo, and Alexa voice search — roughly 10% of global searches with less competition.

---

## Phase 2: Crawlability

> **Goal:** Ensure search engines can efficiently discover and crawl all important pages.

### 2.1 Sitemap

- [ ] Generate a sitemap using your framework's built-in tool or plugin:
  - **Next.js** → `next-sitemap` package
  - **WordPress** → Yoast SEO or Rank Math
  - **Hugo** → Built-in generation
  - **Gatsby** → `gatsby-plugin-sitemap`
  - **Static sites** → [xml-sitemaps.com](https://xml-sitemaps.com)
- [ ] Confirm sitemap is accessible at `https://yoursite.com/sitemap.xml`
- [ ] Validate sitemap format (basic structure):
  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <url>
      <loc>https://yoursite.com/</loc>
      <lastmod>2024-01-15</lastmod>
      <priority>1.0</priority>
    </url>
  </urlset>
  ```
- [ ] Submit to Google Search Console
- [ ] Submit to Bing Webmaster Tools

**Sitemap rules:**

| Rule | Limit |
|---|---|
| Max URLs per file | 50,000 |
| Max file size | 50MB uncompressed |
| Large sites | Use sitemap index files |

---

### 2.2 Robots.txt

- [ ] Create `robots.txt` at your site root (`https://yoursite.com/robots.txt`)
- [ ] Start with the safe default:
  ```text
  User-agent: *
  Allow: /
  Sitemap: https://yoursite.com/sitemap.xml
  ```
- [ ] Block pages that shouldn't be indexed:
  ```text
  User-agent: *
  Allow: /
  Disallow: /admin/
  Disallow: /api/
  Disallow: /private/
  Sitemap: https://yoursite.com/sitemap.xml
  ```
- [ ] **Do NOT block** `/css/`, `/js/`, or images — search engines need them to render
- [ ] Test your `robots.txt` using Google Search Console's robots.txt tester

> ⚠️ **Critical mistake to avoid:** `Disallow: /` blocks your entire site.

---

## Phase 3: Keyword Research

> **Goal:** Know exactly what your audience is searching for *before* writing a single title tag or page. Keywords inform everything in Phase 4.

### 3.1 Find Your Target Keywords

- [ ] Start with **seed keywords** — broad terms that describe your site/product
- [ ] Expand using free tools:
  - **Google Search** → "People Also Ask" and "Related Searches" at the bottom
  - **Google Keyword Planner** → [ads.google.com/keywordplanner](https://ads.google.com/keywordplanner)
  - **Google Trends** → [trends.google.com](https://trends.google.com) for seasonal patterns
  - **AnswerThePublic** → [answerthepublic.com](https://answerthepublic.com) for question-based keywords
- [ ] If budget allows, use premium tools: Ahrefs, Semrush, or Moz for volume and difficulty data

### 3.2 Evaluate Keywords

For each candidate keyword, assess:

| Factor | What to Look For |
|---|---|
| **Search Volume** | Is anyone actually searching this? |
| **Keyword Difficulty** | Can a site like yours realistically rank? |
| **Search Intent** | Informational, navigational, or transactional? |
| **Relevance** | Does it match what your page actually delivers? |

> ✅ **Best starting point:** Target low-competition, long-tail keywords (3+ words). Easier to rank, higher conversion intent.

### 3.3 Map Keywords to Pages

- [ ] Assign **one primary keyword** per page — don't compete with yourself
- [ ] Identify 2–3 secondary/related keywords per page
- [ ] Create a simple keyword map (spreadsheet: Page URL → Primary Keyword → Secondary Keywords)
- [ ] Flag keyword gaps — topics your competitors rank for that you don't cover yet
- [ ] Prioritize pages by business impact (home, product, high-traffic blog posts first)

---

## Phase 4: On-Page SEO Signals

> **Goal:** Give every page the right metadata so search engines and social platforms understand and represent your content correctly.

### 4.1 Meta Tags

Apply to **every page** on your site:

- [ ] **Title tag** — Unique, under 60 characters, keyword-first

  ```html
  <!-- ❌ Bad -->
  <title>Home | eqva money</title>

  <!-- ✅ Good -->
  <title>eqva money - Voice Expense Tracker for Travelers</title>
  ```

- [ ] **Meta description** — Under 160 characters, contains a call to action

  ```html
  <meta name="description" content="Track expenses by speaking. Multi-currency. Offline. No ads. Free download for iOS and Android.">
  ```

- [ ] **Viewport meta tag** — Required for mobile ranking

  ```html
  <meta name="viewport" content="width=device-width, initial-scale=1">
  ```

- [ ] **Canonical tag** — Prevents duplicate content issues

  ```html
  <link rel="canonical" href="https://yoursite.com/page">
  ```

- [ ] **Meta robots** — Only needed for pages you want to exclude

  ```html
  <!-- Exclude from index but follow links -->
  <meta name="robots" content="noindex, follow">
  ```

**Per-page checklist:**

| Tag | Unique Per Page? | Required? |
|---|---|---|
| `<title>` | ✅ Yes | ✅ Yes |
| `meta description` | ✅ Yes | Strongly recommended |
| `canonical` | ✅ Yes | Where duplicates exist |
| `viewport` | No (global) | ✅ Yes |

---

### 4.2 Schema / Structured Data

Schema markup (JSON-LD) tells search engines *exactly* what your content is — enabling rich results like star ratings, FAQs, breadcrumbs, and article dates directly in the SERP.

- [ ] Add the base `WebSite` schema to your homepage:
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
- [ ] Add `Article` schema to blog posts:
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
- [ ] Add `FAQPage` schema to any FAQ sections (high click-through lift)
- [ ] Add `BreadcrumbList` schema for multi-level sites
- [ ] Validate all schema using [Google's Rich Results Test](https://search.google.com/test/rich-results)
- [ ] Monitor rich result status in Google Search Console → **Enhancements** section

**Common schema types by page:**

| Page Type | Schema to Use |
|---|---|
| Homepage | `WebSite`, `Organization` |
| Blog post / Article | `Article`, `BreadcrumbList` |
| FAQ section | `FAQPage` |
| Product page | `Product`, `Offer`, `AggregateRating` |
| Local business | `LocalBusiness` |

---

### 4.3 Open Graph Tags

Controls how your pages look when shared on social media (Facebook, LinkedIn, Slack, etc.).

- [ ] Add essential Open Graph tags to every page:

  ```html
  <meta property="og:title" content="Your Page Title">
  <meta property="og:description" content="Compelling description.">
  <meta property="og:image" content="https://yoursite.com/og-image.png">
  <meta property="og:url" content="https://yoursite.com/page">
  <meta property="og:type" content="website">
  <meta property="og:site_name" content="Your Site Name">
  ```

- [ ] Add Twitter card tags:

  ```html
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:site" content="@yourtwitterhandle">
  <meta name="twitter:title" content="Your Page Title">
  <meta name="twitter:description" content="Compelling description.">
  <meta name="twitter:image" content="https://yoursite.com/twitter-card.png">
  ```

- [ ] Create your OG image at the correct dimensions:

  | Platform | Recommended Size | Max File Size |
  |---|---|---|
  | Open Graph (Facebook/LinkedIn) | 1200 × 630 px | 8MB |
  | Twitter large card | 1200 × 628 px | 5MB |

- [ ] Test with:
  - [Facebook Sharing Debugger](https://developers.facebook.com/tools/debug/)
  - [Twitter Card Validator](https://cards-dev.twitter.com/validator)
  - [LinkedIn Post Inspector](https://linkedin.com/post-inspector/)

---

## Phase 5: Performance Optimization

> **Goal:** Pass Google's Core Web Vitals and serve a fast, mobile-friendly experience to both users and crawlers.

### 5.1 Core Web Vitals Targets

| Metric | Good | Needs Work | Poor |
|---|---|---|---|
| **LCP** (Largest Contentful Paint) | < 2.5s | 2.5 – 4s | > 4s |
| **INP** (Interaction to Next Paint) | ≤ 200ms | 200 – 500ms | > 500ms |
| **CLS** (Cumulative Layout Shift) | < 0.1 | 0.1 – 0.25 | > 0.25 |

> ℹ️ **INP replaced FID in March 2024.** It measures *all* interactions across the page visit, not just the first — making it a more accurate responsiveness signal. Optimise by reducing long tasks on the main thread and deferring non-critical JavaScript.

**Test tools:**
- [PageSpeed Insights](https://pagespeed.web.dev) (target: 90+ desktop, 70+ mobile)
- Chrome DevTools → Lighthouse tab
- [WebPageTest.org](https://webpagetest.org) for waterfall analysis

---

### 5.2 Speed Fixes — Priority Order

#### Images (Highest Impact)

- [ ] Compress images: TinyPNG or ImageOptim
- [ ] Convert to modern formats: **WebP** or **AVIF**
- [ ] Add `loading="lazy"` to below-the-fold images
- [ ] Set explicit `width` and `height` attributes to prevent layout shift

#### JavaScript

- [ ] Minify and compress all JS bundles
- [ ] Use `defer` or `async` for non-critical scripts
- [ ] Remove unused third-party scripts
- [ ] Code-split large bundles

#### CSS

- [ ] Minify and compress CSS
- [ ] Inline critical (above-the-fold) CSS
- [ ] Remove unused styles (tools: PurgeCSS)
- [ ] Avoid render-blocking `<link>` in `<head>`

#### Hosting & Infrastructure

- [ ] Use a CDN (Cloudflare, Fastly, or your host's CDN)
- [ ] Enable browser caching
- [ ] Serve over HTTP/2 or HTTP/3
- [ ] Consider fast hosting: Vercel, Netlify, Cloudflare Pages

#### Fonts

- [ ] Prefer system fonts where brand allows
- [ ] Preload custom fonts: `<link rel="preload" as="font">`
- [ ] Add `font-display: swap` to `@font-face` declarations
- [ ] Subset fonts to only the characters you need

---

### 5.3 Mobile Optimization

Google uses **mobile-first indexing** — the mobile version is what gets ranked.

- [ ] Run [Google's Mobile-Friendly Test](https://search.google.com/test/mobile-friendly)
- [ ] Check Mobile Usability report in Google Search Console
- [ ] Test manually on a real device (not just emulator)

**Fix these common mobile issues:**

| Issue | Fix |
|---|---|
| Text too small | Base font ≥ 16px, line-height ≥ 1.5 |
| Tap targets too small | Buttons ≥ 48×48 pixels |
| Horizontal scrolling | Use responsive CSS, avoid fixed widths |
| No viewport meta | Add `<meta name="viewport" ...>` |
| Intrusive popups | Use banners instead of full-screen overlays |

> ⚠️ Mobile content must match desktop content or you risk losing indexed pages.

---

## Phase 6: Instant Indexing with IndexNow

> **Goal:** Stop waiting for crawlers. Push new and updated URLs to search engines the moment you publish.

### 6.1 Setup

- [ ] Use the API key generated in Phase 1.2 (Bing Webmaster Tools), or generate a UUID
- [ ] Create a verification file named `{your-api-key}.txt` with the key as its content
- [ ] Upload to your site root:
  ```
  https://yoursite.com/{your-api-key}.txt
  ```

### 6.2 Ping on Publish

**Single URL (GET request):**
```
https://api.indexnow.org/indexnow?url=https://yoursite.com/new-page&key={your-api-key}
```

**Multiple URLs (POST request):**
```json
{
  "host": "yoursite.com",
  "key": "{your-api-key}",
  "urlList": [
    "https://yoursite.com/page1",
    "https://yoursite.com/page2"
  ]
}
```

### 6.3 Automate It

- [ ] **WordPress** → Install the IndexNow plugin
- [ ] **Next.js** → Add ping to your build/deploy script
- [ ] **Vercel** → Use deploy hooks to trigger a ping
- [ ] **Cloudflare** → Enable built-in IndexNow support
- [ ] **Custom setup** → Add the GET request call to your CI/CD pipeline

**When to ping:**

| Trigger | Ping? |
|---|---|
| New page published | ✅ Yes |
| Significant content update | ✅ Yes |
| Site launch | ✅ Yes |
| Minor typo fix | ❌ No |
| Trivial metadata change | ❌ No |

> ⚠️ **Don't spam.** Excessive pings will be ignored by search engines.

**Supported engines:** Bing, Yandex, Seznam, Naver, Yep

> ℹ️ **Google does NOT support IndexNow** (confirmed as of 2026). Google relies on its own Googlebot crawl infrastructure. For Google, continue using Search Console's URL Inspection tool and your sitemap. Google's separate [Indexing API](https://developers.google.com/search/apis/indexing-api/v3/quickstart) only applies to job posting and live-stream pages.

---

## Phase 7: Ongoing SEO

> **Goal:** Maintain and grow your search presence through consistent monitoring, content updates, authority building, and modern AI-era signals.

### 7.1 Weekly Tasks

- [ ] Check Google Search Console for new crawl errors
- [ ] Review performance data (clicks, impressions, CTR, position)
- [ ] Monitor Core Web Vitals for regressions
- [ ] Scan for broken links (internal and external)

### 7.2 Monthly Tasks

- [ ] Review keyword rankings — are you improving?
- [ ] Identify top-performing pages and understand why they work
- [ ] Check competitor rankings for your target keywords
- [ ] Update and refresh outdated content (dates, statistics, links)
- [ ] Review and rewrite underperforming meta descriptions

### 7.3 Quarterly Tasks

- [ ] Full site audit (use Screaming Frog, Ahrefs, or Semrush)
- [ ] Review and regenerate sitemap if site structure changed
- [ ] Validate all structured data / schema markup
- [ ] Audit your backlink profile for toxic links
- [ ] Reassess your content strategy based on data

### 7.4 Content Updates

- [ ] Update old posts with new information and statistics
- [ ] Add new pages targeting emerging keywords in your niche
- [ ] Write about trending topics with original insight
- [ ] Remove or consolidate thin/duplicate pages

**Internal Linking (do this every time you publish):**

- [ ] Link from every new page to 2–3 relevant older pages
- [ ] Link from older high-authority pages *back* to important new pages
- [ ] Use descriptive anchor text with your target keyword — not "click here"
- [ ] Check for orphan pages (pages with no internal links pointing to them) quarterly

### 7.5 Building Authority

- [ ] Seek mentions and links from other reputable sites
- [ ] Guest post on relevant, high-quality blogs
- [ ] Create genuinely shareable content (tools, calculators, guides)
- [ ] Build relationships within your niche community
- [ ] Earn natural backlinks through content quality — don't buy links

### 7.6 E-E-A-T & AI Overviews (2025+ Priority)

Google now evaluates **Experience, Expertise, Authoritativeness, and Trustworthiness (E-E-A-T)** as quality signals — especially critical for any content covering health, finance, law, or major purchase decisions.

**E-E-A-T signals to build:**

- [ ] Add an **About page** with real credentials, background, and author information
- [ ] Include author bios on all articles with relevant experience
- [ ] Cite credible external sources (link to primary research, official docs)
- [ ] Add `author` and `datePublished` fields to your Article schema (Phase 4.2)
- [ ] Display contact information and a clear privacy policy
- [ ] Collect and display genuine user reviews or testimonials where relevant

**Optimise for Google AI Overviews (Generative Engine Optimisation / GEO):**

Google's AI Overviews now answer questions directly in search results. Getting cited in these boxes is the new frontier for organic visibility.

- [ ] Write content that **directly answers specific questions** — one clear answer per section
- [ ] Use question-format headings (e.g. "How does X work?" "What is the best Y?")
- [ ] Add `FAQPage` schema to question-based content (links to Phase 4.2)
- [ ] Keep sentences concise and factual — AI systems prefer quotable, precise statements
- [ ] Build topical authority by covering a subject comprehensively across multiple linked pages
- [ ] Monitor which of your pages appear in AI Overviews via Google Search Console's **Search Appearance** filter

---

## Master Checklist

Use this to track your overall implementation progress.

### Phase 1 — Foundation & Discovery
- [ ] Google Search Console property added and verified
- [ ] Sitemap submitted to Google
- [ ] Bing Webmaster Tools set up
- [ ] IndexNow API key saved from Bing

### Phase 2 — Crawlability
- [ ] `sitemap.xml` generated and accessible
- [ ] `sitemap.xml` submitted to both Google and Bing
- [ ] `robots.txt` created and points to sitemap
- [ ] `robots.txt` not blocking CSS, JS, or main content
- [ ] `robots.txt` tested in Search Console

### Phase 3 — Keyword Research
- [ ] Seed keywords identified for each core page
- [ ] Keywords researched with volume and difficulty data
- [ ] Search intent confirmed for each keyword
- [ ] Keyword map created (page → primary keyword → secondaries)
- [ ] Keyword gaps identified vs. competitors

### Phase 4 — On-Page SEO Signals
- [ ] Unique `<title>` on every page (< 60 chars, keyword-first)
- [ ] Unique `meta description` on every page (< 160 chars)
- [ ] Viewport meta tag on every page
- [ ] Canonical tags on pages with duplicate content
- [ ] Schema markup added and validated (Article, FAQ, etc.)
- [ ] Rich Results Test passing
- [ ] `og:title`, `og:description`, `og:image`, `og:url` set
- [ ] Twitter card tags set
- [ ] OG image at 1200×630 px
- [ ] OG/Twitter tested in platform debuggers

### Phase 5 — Performance
- [ ] PageSpeed score: 90+ desktop, 70+ mobile
- [ ] LCP < 2.5 seconds
- [ ] INP ≤ 200 milliseconds
- [ ] CLS < 0.1
- [ ] Images compressed and in WebP/AVIF format
- [ ] JS/CSS minified
- [ ] Mobile-friendly test passed
- [ ] Text readable without zooming
- [ ] Tap targets ≥ 48×48 px

### Phase 6 — Instant Indexing
- [ ] IndexNow API key file hosted at site root
- [ ] Pings integrated into publish workflow
- [ ] Tested and confirmed working

### Phase 7 — Ongoing
- [ ] Weekly Search Console check scheduled
- [ ] Monthly ranking review scheduled
- [ ] Quarterly site audit scheduled
- [ ] Content calendar established
- [ ] Author bios and About page with credentials published
- [ ] Internal linking process added to publishing workflow
- [ ] FAQ-format content added to key pages for AI Overviews

---

> **Remember:** SEO is a marathon, not a sprint. Phases 1–2 give you the technical foundation. Phase 3–4 make your content readable to both search engines and AI. Phase 5–6 give you a speed and indexing edge. Phase 7 compounds all of it over time.
