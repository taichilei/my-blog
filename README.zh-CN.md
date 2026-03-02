# 我的博客

一个使用 Astro 构建的个人技术博客，包含丰富的技术文章和学习笔记。

## 项目特点

- **多语言支持**：支持中英文双语言切换
- **分类清晰**：按技术领域分类，包括 AI、后端、前端、网络、数据库等
- **性能优化**：使用 Astro 静态站点生成，加载速度快
- **响应式设计**：适配不同设备屏幕
- **自动部署**：通过 GitHub Actions 自动部署到 GitHub Pages

## 技术栈

- **框架**：Astro
- **内容格式**：Markdown/MDX
- **多语言**：i18n 支持
- **部署**：GitHub Actions + GitHub Pages
- **样式**：原生 CSS

## 目录结构

```
├── .github/            # GitHub 配置文件
│   └── workflows/      # GitHub Actions 工作流
├── scripts/            # 脚本文件
├── site/               # 博客主目录
│   ├── public/         # 静态资源
│   ├── src/            # 源代码
│   │   ├── components/ # 组件
│   │   ├── content/    # 博客内容
│   │   ├── i18n/       # 国际化配置
│   │   ├── layouts/    # 布局
│   │   ├── pages/      # 页面
│   │   └── styles/     # 样式
│   ├── astro.config.mjs # Astro 配置
│   └── package.json    # 项目依赖
├── README.md           # 英文项目说明
└── README.zh-CN.md     # 中文项目说明
```

## 快速开始

### 环境要求

- Node.js 18+
- npm 或 yarn

### 安装依赖

```bash
cd site
npm install
```

### 本地开发

```bash
npm run dev
```

访问 `http://localhost:4321` 查看博客。

### 构建生产版本

```bash
npm run build
```

构建产物会生成在 `site/dist` 目录。

## 内容管理

博客文章位于 `site/src/content/blog/` 目录，按语言和分类组织：

- `zh/`：中文文章
- `en/`：英文文章（预留）

### 文章分类

- **AI**：人工智能相关内容
- **3D**：空间计算等3D相关内容
- **Computer Network**：计算机网络相关内容
- **Data Analyse**：数据分析相关内容
- **Database**：数据库相关内容
- **Finance**：财务知识相关内容
- **IOT**：物联网相关内容
- **Software Engineering**：软件工程相关内容
- **backend**：后端开发相关内容
- **frontend**：前端开发相关内容
- **mac-mini专栏**：Mac mini 相关内容
- **运维**：运维相关内容

## 部署

项目使用 GitHub Actions 自动部署到 GitHub Pages：

1. 推送代码到 `main` 分支
2. GitHub Actions 会自动执行构建和部署
3. 部署完成后，可通过 `https://[username].github.io/my-blog/` 访问

## 贡献

欢迎提交 Issue 和 Pull Request 来改进这个博客。

## 许可证

MIT License
