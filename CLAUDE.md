# KavasiMihaly.github.io - Project CLAUDE.md

## Project Overview
Jekyll-based blog (Self-Service BI Blog) by Mihaly Kavasi. Hosted on GitHub Pages.

## Project Structure

```
_posts/          - Published blog posts (live on site)
_drafts/         - Draft blog posts (NOT published, use for WIP posts)
_layouts/        - Jekyll layout templates
_includes/       - Reusable HTML partials
_sass/           - SCSS stylesheets
_pages/          - Static pages (about, etc.)
_config.yml      - Jekyll site configuration
assets/images/   - Blog post images (subfolder per post slug)
documentation/   - Style guides, agent prompts, reference docs
.claude/agents/  - Custom Claude Code subagent definitions
_Research/        - Research outputs
_Plan/            - Plans and blog post ideas
_Agent Logs/      - AI agent action logs
```

## Blog Post Workflow

### Drafts vs Published
- **New posts go to `_drafts/`** — always write new blog posts here first, never directly to `_posts/`.
- **Move to `_posts/` only when ready to publish** — the author decides when to promote.
- Draft filenames follow the same convention: `YYYY-MM-DD-slug.md`
- Jekyll does not build `_drafts/` by default (use `--drafts` flag locally to preview).

### Image Folder Convention
- Each post gets its own image folder: `assets/images/{post-slug}/`
- Create the image folder when starting a draft, even if images are added later.
- Use `<!-- IMAGE PLACEHOLDER: description -->` markers where screenshots are needed.

### Front Matter Template
```yaml
---
title: "Title Here"
date: YYYY-MM-DD 10:00:00 +0000
layout: post
categories:
- Category1
- Category2
tags:
- Tag1
- Tag2
excerpt: "Short description for previews."
author: Mihaly Kavasi
image: /assets/images/{post-slug}/Header.jpeg
---
```

## Key Reference Files
- **Style guide**: `documentation/Blog-Writing-Style-Guide-Updated.md`
- **Blog writer prompt**: `documentation/Blog-Writer-Agent-Prompt.md`
- **Blog post ideas**: `Plan/Blog Post Ideas.md`
- **Blog writer agent**: `.claude/agents/blog-writer.md`

## Common Pitfalls
- Do NOT put new/draft blog posts directly in `_posts/` — use `_drafts/` first.
- Image paths use forward slashes and start from site root: `/assets/images/slug/file.png`
- Internal links to posts use the format: `/YYYY/MM/DD/slug.html`

## Series Conventions

### Front Matter Fields
Posts that belong to a series must include these fields:
```yaml
series: "slug-identifier"           # URL-safe slug (e.g., "context-window-optimization")
series_title: "Display Name"        # Human-readable name shown in UI
series_part: 0                      # Integer part number (0-indexed or 1-indexed per series)
series_total: 5                     # Total number of parts in the series
permalink: /series/{slug}/{post-slug}/ # Canonical URL (use post's filename slug, NOT part-N)
redirect_from:                      # Only for published posts with old URLs
  - /old-url-here/
```

### Permalink Pattern
All series posts use: `/series/{series-slug}/{post-slug}/` where `{post-slug}` is derived from the post filename (e.g., `the-hidden-cost-of-mcps-and-custom-instructions-on-your-context-window`). This is more SEO-friendly than generic `part-N` URLs.

### Creating a New Series
1. Choose a URL-safe slug (lowercase, hyphens)
2. Add series front matter to each post
3. Create a landing page at `_pages/series/{slug}.html`
4. Add the series card to `_pages/series/index.html`
5. For published posts changing URLs, add `redirect_from:` with old URL

### Existing Series
| Series | Slug | Parts |
|--------|------|:-----:|
| Context Window Optimization | `context-window-optimization` | 5 |
| Built-in Analytics in Power BI | `built-in-analytics` | 4 |
| Hidden Features of Analyze in Excel | `analyze-in-excel` | 3 |
| Documenting Power BI Data Model | `documenting-data-model` | 4 |
| Log Analytics for Power BI | `log-analytics-power-bi` | 2 |

### Series Infrastructure Files
- `_includes/series-nav.html` — In-post series TOC
- `_includes/series-sidebar.html` — Sidebar widget
- `_includes/series-schema.html` — Schema.org JSON-LD
- `_sass/_series.scss` — Series styles
- `_pages/series/index.html` — Master series listing
- `_pages/series/{slug}.html` — Individual series landing pages
