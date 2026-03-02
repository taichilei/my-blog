# My Blog

A personal technical blog built with Astro, containing rich technical articles and learning notes.

## Features

- **Multi-language support**: Supports both Chinese and English language switching
- **Clear categorization**: Categorized by technical fields, including AI, backend, frontend, network, database, etc.
- **Performance optimization**: Fast loading speed using Astro static site generation
- **Responsive design**: Adapts to different device screens
- **Automatic deployment**: Automatically deployed to GitHub Pages via GitHub Actions

## Tech Stack

- **Framework**: Astro
- **Content format**: Markdown/MDX
- **Multi-language**: i18n support
- **Deployment**: GitHub Actions + GitHub Pages
- **Styling**: Native CSS

## Directory Structure

```
├── .github/            # GitHub configuration files
│   └── workflows/      # GitHub Actions workflows
├── scripts/            # Script files
├── site/               # Blog main directory
│   ├── public/         # Static resources
│   ├── src/            # Source code
│   │   ├── components/ # Components
│   │   ├── content/    # Blog content
│   │   ├── i18n/       # Internationalization configuration
│   │   ├── layouts/    # Layouts
│   │   ├── pages/      # Pages
│   │   └── styles/     # Styles
│   ├── astro.config.mjs # Astro configuration
│   └── package.json    # Project dependencies
├── README.md           # English project documentation
└── README.zh-CN.md     # Chinese project documentation
```

## Quick Start

### Environment Requirements

- Node.js 18+
- npm or yarn

### Install Dependencies

```bash
cd site
npm install
```

### Local Development

```bash
npm run dev
```

Visit `http://localhost:4321` to view the blog.

### Build Production Version

```bash
npm run build
```

The build output will be generated in the `site/dist` directory.

## Content Management

Blog posts are located in the `site/src/content/blog/` directory, organized by language and category:

- `zh/`: Chinese articles
- `en/`: English articles (reserved)

### Article Categories

- **AI**: Artificial intelligence related content
- **3D**: 3D related content such as spatial computing
- **Computer Network**: Computer network related content
- **Data Analyse**: Data analysis related content
- **Database**: Database related content
- **Finance**: Finance knowledge related content
- **IOT**: Internet of Things related content
- **Software Engineering**: Software engineering related content
- **backend**: Backend development related content
- **frontend**: Frontend development related content
- **mac-mini专栏**: Mac mini related content
- **运维**: Operations and maintenance related content

## Deployment

The project uses GitHub Actions to automatically deploy to GitHub Pages:

1. Push code to the `main` branch
2. GitHub Actions will automatically execute build and deployment
3. After deployment is complete, you can access it via `https://[username].github.io/my-blog/`

## Contribution

Welcome to submit Issues and Pull Requests to improve this blog.

## License

MIT License
