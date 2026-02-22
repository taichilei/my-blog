---
title:"LangExtract"
decription:"一个 Python 库，使用大语言模型从非结构化文本中提取结构化信息，并自动处理整个流程"
source:"https://developers.googleblog.com/introducing-langextract-a-gemini-powered-information-extraction-library/"


---



# Introducing LangExtract: A Gemini powered information extraction library

## 



- 数据提取

常见的痛点

- ﻿文本超出模型上下文窗口
- ﻿﻿大语言模型输出格式不可预测
- ﻿﻿提取的数据无法追溯到来源
- ﻿﻿处理速度缓慢且串行
- ﻿﻿切换模型需要重写代码

智能分块

- ﻿﻿自动沿句子边界分割文本
- ﻿﻿使用重叠的上下文窗口
- ﻿﻿在分块之间保留上下文以解析引用

可靠的结构化输出

- ﻿﻿内置解析器自动处理各种输出格式
- ﻿﻿根据示例强制执行一致的输出模式
- ﻿﻿“模糊对齐"功能将提取内容映射回源文本

这条数据来自原始文档的哪个位置？

精准的来源定位

- ﻿﻿每次提取都映射到其确切的字符位置
- ﻿﻿lx.visualize （）生成交互式 ITML文件
- ﻿﻿在原始文本中高亮显示提取的实体

你如何加速处理成千上万份文档？