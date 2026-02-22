---
title: "Golang"
description: "Go"
pubDate: "2026-01-18"
---

# Go

## 并发

三大工具

### Goroutine

- 本质是一段待执行的**函数**，记录**栈**、**状态**、**入口信息**

- ```go
  go func(){
      //	启动一个Goroutine,do work
  }
  ```

- 提问：为什么说在go的世界里面，并发不是依赖线程实现的，而是通过Goroutine实现的。

  - Goroutine的初始栈为2KB
  - os thread初始栈为1MB

- 提问：

  - Go的GPM调度器是什么？
    - G是Goroutine,P是逻辑处理器,M是操作系统线程
  - 逻辑处理器
    - 每个**逻辑处理器**都有自己的**本地队列**和**缓存**， 决定哪些Goroutine能被调度执行
    - Goroutine被逻辑处理器调度，绑定了逻辑处理器，才能被操作系统取出并执行
    - 优点：逻辑处理器之间会自动实现负载均衡
  - 调度从内核拉回用户态，自己掌控
  - 操作系统线程

### Channels

- 负责通信与同步
- 在Goroutine之间传递数据，核心的机制是channel。
- Goroutine用channel通信，这就是Go的并发思路。不要通过共享内存来通信，而是通过通信来共享内存
- Channel类似于一个有类型、方向的数据管道。两端天然同步，不需要锁，不需要条件变量。

### Select

- select负责协调与决策

- select是channel的控制器，它能同时监听多个channel的事件，天然支持**非阻塞**和**超时控制**

- ```go
  select{
      case v:= <-dataCh:
      	fmt.Println("got:",v);
      case <-time.After(time.Second):
      	fmt.Println("timeout")
  }
  //“最多等 dataCh 1 秒：1 秒内拿到值就处理，否则放弃并超时提示。”
  ```
  
- GC：go内置高性能的并发GC

  - 自动管理内存，避免C\C++常见错误
  - 编译速度快
