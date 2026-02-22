---
title: JPA注解
description: JPA常用注解与说明
pubDate: 2026-01-26
---

# JPA注解

```java
@entity
//持久化实体声明注解
```

```java
@Table
//表映射注解
```

```java
@Id//主键标识注解
@GeneratedValu(strategy=GenerationType.UUID)//主键值由框架生成，生成策略是 UUID

```

```java
@Column//字段到数据库列的映射与约束声明注解
```

```java
@Enumerated()//告诉 ORM“枚举字段该怎么存进数据库”。
```

```java
//实体生命周期回调（Lifecycle Callbacks）
@PrePersist//含义：在实体第一次被插入数据库之前调用
@PostPersist

@PreUpdate//在实体即将被更新数据库之前调用
@PostUpdate

@PreRemove
@PostRemove

```
