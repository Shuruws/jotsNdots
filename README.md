# My Jots and Dots Blog

This is my personal blog built with Hugo and the PaperMod theme.

## Quick Start

1. Run development server:
```bash
hugo server -D
```

2. Create a new post:
```bash
hugo new posts/my-new-post.md
```

3. Build for production:
```bash
hugo
```

## Content Guidelines

### Posts
- Place all blog posts in `content/posts/`
- Use meaningful file names (e.g., `why-i-love-coding.md`)
- Always include a description in the front matter
- Add relevant tags and categories

### Images
- Store images in `static/images/`
- Use meaningful image names
- Reference images in posts using: `/images/your-image.jpg`
- Optimize images before uploading

### Front Matter Template
```yaml
---
title: "Your Title"
date: YYYY-MM-DD
draft: true/false
tags: ["tag1", "tag2"]
categories: ["category"]
description: "A brief description"
cover:
    image: "/images/cover.jpg"
    alt: "Alt text"
---
```

## Markdown Tips

1. Headers:
```markdown
## Second Level
### Third Level
```

2. Links:
```markdown
[Link Text](URL)
```

3. Images:
```markdown
![Alt Text](/images/image.jpg)
```

4. Code Blocks:
````markdown
```language
your code here
```
````

5. Quotes:
```markdown
> Your quote here
```

## Deployment

Build the site using `hugo` command and deploy the contents of the `public/` directory. 