# JSX 是什么？（给前端初学者的理解版）

## 1. JSX 本质是什么

JSX 不是 HTML，也不是字符串。

它的本质是：
> **一种“看起来像 HTML 的JavaScript 表达式语法”**

在 React 里：
```tsx
return <h1>Hello</h1>
```
并不是在写 HTML，而是在写：
> “返回一个 UI 结构描述”

---

## 2. 为什么 JSX 只能写在 `.tsx` 里

- `.ts` 文件：只能写 TypeScript（逻辑、类型、工具函数）
- `.tsx` 文件：允许写 TypeScript + JSX（UI 结构）

**规则：**
> 只要文件里出现了 `<div>`、`<LoginPage />` 这种 JSX，就必须是 `.tsx`

---

## 3. React 组件是什么

一个 React 组件，本质上是：
```ts
函数 + 返回 JSX
```

例如：
```tsx
function LoginPage() {
  return <div>Login</div>
}
```

它的含义是：
> “这个函数描述了一个页面/组件应该长什么样”

---

## 4. 为什么组件要写成 `<LoginPage />`

在 React 里：
- `<LoginPage />`：表示“这里要渲染一个 LoginPage 组件”
- `LoginPage;`：只是一个变量引用，不会渲染任何 UI

**记住一句话：**
> React 只渲染 return 里的 JSX

---

## 5. JSX 和 Vue template 的区别（简记）

- Vue：模板 + 指令（v-if / v-for）
- React：JSX + 原生 JavaScript（if / map）

React 的核心思想是：
> **UI = f(state)**

界面是“状态计算的结果”，而不是一段模板。
