---
title: "SSM"
description: "SSM"
pubDate: "2026-01-18"
---

**SSM**

**Spring Bean** 是Spring管理的对象实例，由IoC容器创建、组装和管理。

**IoC（控制反转）介绍**

**IoC（Inversion of Control）** 是 Spring 框架的核心思想之一，它是一种设计原则，用于解耦组件之间的依赖关系，提高代码的灵活性和可维护性。

**将对象的创建和依赖注入交给外部容器（如 Spring IoC 容器）管理**，程序只需声明依赖关系，而无需手动创建对象。

**3. Spring IoC 容器**

Spring IoC 容器负责：

1. **创建和管理对象（Bean）**
2. **解析依赖关系并自动注入**

3. 管理 Bean 的生命周期（如初始化、销毁）** 

**1. Repository 层（数据访问／DAO）**

​	•**建议返回**：Optional<Entity>

​	•**理由**：数据可能不存在，用 Optional.empty() 更清晰地表示无值状态，不返回 null  

interface UserRepository extends JpaRepository<User, Long> {

  Optional<User> findByUsername(String username);

}

**2. Service 层（业务逻辑）**

​	•**建议返回**：Optional<Entity> 或直接 Entity + 抛出异常

​	•**为什么？**

​	•没找到是常态 → Optional.empty() 很合适

​	•若“没找到”不应发生 → orElseThrow(...) 抛出业务异常（如 UserNotFoundException）更适宜  

​	•**规范建议**：

​	•数据存在性可预期 → 使用 Optional

​	数据应存在 → Optional.orElseThrow() 抛异常

// 避免 null

public Optional<User> findByUsername(String username) { … }



// 对安全性有要求的方法，推荐：

public User getUserByUsername(String username) {

  return findByUsername(username)

​      .orElseThrow(() -> new UserNotFoundException(...));

}

**3. Controller 层（Web/API）**

​	•	**建议返回**：实体数据（Entity / VO / DTO）本体 **不返 Optional**，在 Service 层已处理完毕

​	•	**异常处理由 global exception handler 负责**

​	•	**示例**：

@GetMapping("/{username}")

public CommonResult<UserVO> getByUsername(String username) {

  User user = userService.findByUsername(username)

​          .orElseThrow(() -> new UserNotFoundException(...));

  return CommonResult.success(UserMapper.toVO(user));

}

| **层级**   | **返回类型**                      | **目的与用途**                      |
| ---------- | --------------------------------- | ----------------------------------- |
| Repository | Optional<Entity>                  | 表明可 absence，避免 null           |
| Service    | Optional<Entity> 或 Entity + 异常 | 根据业务语义明确返回                |
| Controller | Entity/VO/DTO                     | 对外接口采用一致结构，不用 Optional |

**总结**

​	**不要在 DTO/VO 中使用 Optional<T> 字段**，与前端兼容性差   

​	•**统一从 Repository 起用 Optional，避免 null 传播**

​	•**异常处理统一由 Controller 捕获并映射为 API 响应**

Repository 层：返回 `Optional<Entity>` 表示查不到数据。**

Service 层

 **- 合理空值 → 保留 `Optional`**

 **- 不应出现空值 → `.orElseThrow(...)` 抛业务异常**

**- Controller 层：获取实体（非 Optional），由全局异常处理器处理出错，用统一 `CommonResult`**

DTO/VO 层：不要用Optional，保持纯数据结构用于序列化