---
title: "OLAP是什么"
description: "OLAP是什么"
pubDate: "2026-01-18"
---

**OLAP是什么**

**On-line Analytical Processing**

OLAP（On-line Analytical Processing）引擎是面向多维数据分析的核心技术，支持**上卷、下钻、切片、旋转**等操作，广泛应用于BI报表、实时分析和大数据探索场景。根据实现方式可分为**MOLAP**（预聚合高性能）、**ROLAP**（灵活即席查询）、**HOLAP**（混合模式）。

**常见开源OLAP引擎及特点：**

- **ClickHouse** 高性能列式数据库，支持向量化执行、稀疏索引，适合大数据单表聚合分析，响应延迟可达毫秒级。优点是查询快、功能丰富；缺点是多表JOIN和高并发支持有限。
- **Druid** 面向实时数据摄取与低延迟聚合，支持倒排索引和位图索引，适合广告分析、监控等时序类场景。不支持复杂JOIN，查询类型较单一。
- **Kylin** 典型MOLAP系统，通过预计算Cube实现亚秒级查询，适合维度固定、数据量巨大的批量分析。缺点是预计算开销大、实时性差。
- **Elasticsearch** 基于Lucene的搜索与聚合引擎，擅长高QPS、低延迟的简单聚合查询，支持自动分片与集群管理。不适合复杂多维分析和JOIN。
- **Presto** MPP架构的分布式SQL查询引擎，支持跨多数据源联邦查询，适合ad-hoc分析。高并发和低延迟在线服务场景表现一般。
- **Impala** Hadoop生态的实时交互式SQL引擎，低延迟、兼容性好，适合已有Hadoop集群的企业。资源占用高，超大规模下扩展性有限。
- **Hive / Spark SQL / Flink SQL** 适合批处理和大规模数据分析，支持流批一体化（Spark/Flink）。Hive延迟高，Spark/Flink需额外生态建设。
- **Apache Doris** 新一代MPP+向量化执行引擎，兼容MySQL协议，易用性高，支持联邦查询，性能与功能平衡，适合多数企业通用分析需求。

**选型建议：**

- **实时高并发简单查询**：Elasticsearch、Druid、Kylin
- **复杂即席分析**：Presto、Impala、ClickHouse
- **批处理/流批一体**：Spark SQL、Flink SQL
- **易用性与性能平衡**：Apache Doris

不同引擎在**查询延迟、并发能力、灵活性**上各有优势，应结合业务场景、数据规模和团队能力综合评估。