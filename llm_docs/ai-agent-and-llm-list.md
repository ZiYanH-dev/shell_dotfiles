# 主流 AI Agent 清单 + 开源大模型大全

> 更新时间：2026 年 7 月 | 所有链接均经过验证

---

## 第一部分：AI Agent 开发框架与平台

### A. 代码型 Agent 框架（需要写代码）

| # | 名称 | 语言 | Stars | 简介 | GitHub / 链接 |
|---|------|------|-------|------|---------------|
| 1 | **LangGraph** | Python / TS | 15k+ | LangChain 团队出品，有状态循环 + 条件分支，复杂工作流之王 | https://github.com/langchain-ai/langgraph |
| 2 | **CrewAI** | Python | 44k+ | 角色驱动的多 Agent 协作框架，开发效率最高 | https://github.com/crewAIInc/crewAI |
| 3 | **Microsoft AutoGen** | Python | 40k+ | 微软出品，最成熟的多 Agent 对话框架 | https://github.com/microsoft/autogen |
| 4 | **MetaGPT** | Python | 50k+ | 模拟软件公司（PM→架构师→工程师→QA），一行需求生成完整项目 | https://github.com/geekan/MetaGPT |
| 5 | **AutoGPT** | Python | 182k+ | 自主 Agent 鼻祖，目标→规划→执行→反思闭环 | https://github.com/Significant-Gravitas/AutoGPT |
| 6 | **BabyAGI** | Python | 20k+ | 任务驱动自主系统，概念简洁，AGI 项目灵感来源 | https://github.com/yoheinakajima/babyagi |
| 7 | **OpenHands (OpenDevin)** | Python | 70k+ | 开源版 Devin，自主写代码、跑测试、修 Bug、提 PR | https://github.com/All-Hands-AI/OpenHands |
| 8 | **OpenAI Swarm** | Python | 17k+ | OpenAI 官方轻量级 Multi-Agent 框架，极简设计，适合学习 | https://github.com/openai/swarm |
| 9 | **OpenAI Agents SDK** | Python | — | OpenAI 新一代轻量 Agent SDK，少样板代码 | https://github.com/openai/openai-agents-python |
| 10 | **Microsoft Agent Framework** | Python / .NET | — | 整合 AutoGen + Semantic Kernel，企业级跨语言 | https://github.com/microsoft/agent-framework |
| 11 | **LangChain** | Python / TS | 98k+ | 最流行的 LLM 应用开发框架，Agent 生态最完善 | https://github.com/langchain-ai/langchain |
| 12 | **LlamaIndex** | Python / TS | 37k+ | RAG 领域最强，数据连接器丰富，Agent + 知识库首选 | https://github.com/run-llama/llama_index |
| 13 | **Semantic Kernel** | C# / Python / Java | 22k+ | 微软出品，企业级，支持 Java | https://github.com/microsoft/semantic-kernel |
| 14 | **Google ADK** | Python | — | Google Cloud 原生 Agent 开发套件，深度集成 Vertex AI | https://github.com/google/adk-python |
| 15 | **OWL** | Python | — | 优化工作流学习框架，任务自动化 | https://github.com/camel-ai/owl |
| 16 | **AgentVerse** | Python | — | 100+ Agent 社会模拟，研究级项目 | https://github.com/OpenBMB/AgentVerse |
| 17 | **Browser-Use** | Python | 93k+ | 让 AI Agent 操控真实浏览器，Web 自动化首选 | https://github.com/browser-use/browser-use |
| 18 | **SuperAGI** | Python | 15k+ | 自主 Agent 平台，内置 GUI 面板 | https://github.com/TransformerOptimus/SuperAGI |
| 19 | **Phidata** | Python | — | 轻量 Agent 框架，构建有记忆、有工具的助手 | https://github.com/phidatahq/phidata |
| 20 | **Atomic Agents** | Python | — | 模块化、轻量级 Agent 框架 | https://github.com/BrainBlend-AI/atomic-agents |

### B. 可视化/低代码 Agent 平台（零代码或少量代码）

| # | 名称 | 类型 | 简介 | 链接 |
|---|------|------|------|------|
| 1 | **Dify** | 开源低代码 | 可视化工作流编排，多模型接入，一键发布 API，私有化部署 | https://github.com/langgenius/dify |
| 2 | **扣子 Coze 3.0** | 低代码平台 | 字节跳动出品，零代码拖拽，700+ 插件，一键发布微信/飞书 | https://www.coze.cn / 开源: https://github.com/coze-dev |
| 3 | **n8n** | 开源自动化 | 工作流自动化 + AI Agent 节点，可私有化部署 | https://github.com/n8n-io/n8n |
| 4 | **Flowise** | 开源低代码 | LangChain 的可视化版，拖拽搭 Agent | https://github.com/FlowiseAI/Flowise |
| 5 | **Langflow** | 开源低代码 | LangChain 可视化编排，已被 DataStax 收购 | https://github.com/langflow-ai/langflow |
| 6 | **AgentGPT** | 浏览器端 | 在浏览器里配置和部署 Agent，零代码 | https://github.com/reworkd/AgentGPT |

### C. 国内大厂 Agent 平台（SaaS）

| # | 平台 | 公司 | 核心能力 | 链接 |
|---|------|------|---------|------|
| 1 | **扣子 Coze** | 字节跳动 | 零代码拖拽，700+ 插件，一键多端发布 | https://www.coze.cn |
| 2 | **文心智能体平台** | 百度 | 低代码开发，中文语义理解，千帆模型广场 | https://agents.baidu.com |
| 3 | **腾讯元器** | 腾讯 | 基于混元大模型，低代码，内置微信支付 | https://yuanqi.tencent.com |
| 4 | **通义千问 Agent** | 阿里云 | 多模态交互，Function Calling 深度集成阿里云 | https://tongyi.aliyun.com |
| 5 | **智谱清言** | 智谱 AI | 开源模型支持，推理严谨，科研场景强 | https://chatglm.cn |
| 6 | **腾讯云智能体开发平台** | 腾讯 | 企业级 RAG + 多 Agent 协作，等保三级 | https://cloud.tencent.com/product/aco |

---

## 第二部分：开源大模型大全

### A. 国际开源大模型

| # | 模型 | 开发者 | 参数量 | 架构 | 上下文 | 许可证 | 链接 |
|---|------|--------|--------|------|--------|--------|------|
| 1 | **Llama 4 Maverick** | Meta | 400B (17B active) | MoE | 1M | Llama 4 Community | https://github.com/meta-llama/llama4 |
| 2 | **Llama 4 Scout** | Meta | 109B (17B active) | MoE | 10M | Llama 4 Community | https://github.com/meta-llama/llama4 |
| 3 | **Llama 3.3** | Meta | 70B | Dense | 128K | Llama 3.3 Community | https://github.com/meta-llama/llama3 |
| 4 | **DeepSeek V3.2** | DeepSeek | 671B (37B active) | MoE | 128K | MIT | https://github.com/deepseek-ai/DeepSeek-V3 |
| 5 | **DeepSeek R1** | DeepSeek | 671B (37B active) | MoE | 128K | MIT | https://github.com/deepseek-ai/DeepSeek-R1 |
| 6 | **Mistral Large 3** | Mistral AI | 675B (41B active) | MoE | 256K | Apache 2.0 | https://huggingface.co/mistralai |
| 7 | **Mistral Small 4** | Mistral AI | 119B (6B active) | MoE | 256K | Apache 2.0 | https://huggingface.co/mistralai |
| 8 | **Mixtral 8x7B** | Mistral AI | 46.7B (12.9B active) | MoE | 32K | Apache 2.0 | https://huggingface.co/mistralai/Mixtral-8x7B-v0.1 |
| 9 | **Gemma 3 (27B/12B/4B/1B)** | Google | 1B-27B | Dense | 128K | Gemma (permissive) | https://huggingface.co/google/gemma-3-27b-it |
| 10 | **Phi-4** | Microsoft | 14B | Dense | 16K | MIT | https://huggingface.co/microsoft/phi-4 |
| 11 | **Phi-4 Mini** | Microsoft | 3.8B | Dense | 128K | MIT | https://huggingface.co/microsoft/phi-4-mini |
| 12 | **gpt-oss-120b** | OpenAI | 117B | MoE | — | Apache 2.0 | https://github.com/openai/gpt-oss |
| 13 | **gpt-oss-20b** | OpenAI | 20B | MoE | — | Apache 2.0 | https://github.com/openai/gpt-oss |
| 14 | **Command R+** | Cohere | 104B | Dense | 128K | CC-BY-NC | https://huggingface.co/CohereForAI/c4ai-command-r-plus |
| 15 | **Command A** | Cohere | 111B | Dense | 256K | CC-BY-NC | https://huggingface.co/CohereForAI/command-a |
| 16 | **Falcon 3** | TII (阿联酋) | 10B | Dense | 32K | TII Falcon 2.0 | https://huggingface.co/tiiuae/Falcon3-10B-Instruct |
| 17 | **DBRX** | Databricks | 132B (36B active) | MoE | 32K | Databricks Open | https://huggingface.co/databricks/dbrx-instruct |
| 18 | **Grok-1** | xAI | 314B | MoE | — | Apache 2.0 | https://github.com/xai-org/grok-1 |
| 19 | **RWKV** | RWKV 社区 | 14B | RNN | 无限 | Apache 2.0 | https://github.com/BlinkDL/RWKV-LM |

### B. 国内开源大模型

| # | 模型 | 开发者 | 参数量 | 架构 | 上下文 | 许可证 | 链接 |
|---|------|--------|--------|------|--------|--------|------|
| 1 | **Qwen 3 (235B)** | 阿里通义千问 | 235B (22B active) | MoE | 128K | Apache 2.0 | https://github.com/QwenLM/Qwen3 |
| 2 | **Qwen 3 (32B / 8B / 4B 等)** | 阿里通义千问 | 0.6B-32B | Dense | 128K | Apache 2.0 | https://github.com/QwenLM/Qwen3 |
| 3 | **Qwen 2.5 (72B 等)** | 阿里通义千问 | 0.5B-72B | Dense | 128K | Apache 2.0 | https://github.com/QwenLM/Qwen2.5 |
| 4 | **Qwen3-Max-Thinking** | 阿里通义千问 | — | — | — | Apache 2.0 | https://huggingface.co/Qwen |
| 5 | **DeepSeek V3** | 深度求索 | 671B (37B active) | MoE | 128K | MIT | https://github.com/deepseek-ai/DeepSeek-V3 |
| 6 | **DeepSeek R1 (蒸馏版 1.5B-70B)** | 深度求索 | 1.5B-70B | Dense | 128K | MIT | https://huggingface.co/deepseek-ai |
| 7 | **GLM-5** | 智谱 AI | 744B (40B active) | MoE | 205K | MIT | https://github.com/zai-org/GLM-5 |
| 8 | **GLM-4.5** | 智谱 AI | — | — | 128K | MIT | https://github.com/THUDM/GLM-4 |
| 9 | **ChatGLM3-6B** | 智谱 AI | 6B | Dense | 32K | 免费商用 | https://github.com/THUDM/ChatGLM3 |
| 10 | **Kimi K2.5** | 月之暗面 | 1T (32B active) | MoE | 128K | Modified MIT | https://github.com/MoonshotAI/Kimi-K2 |
| 11 | **MiniMax-01** | MiniMax | 456B (45.9B active) | MoE | 4.1M | Modified MIT | https://github.com/MiniMax-AI/MiniMax-01 |
| 12 | **Baichuan-M3 (医疗)** | 百川智能 | 235B | — | — | Apache 2.0 | https://huggingface.co/baichuan-inc/Baichuan-M3-235B |
| 13 | **Baichuan 2 (7B/13B)** | 百川智能 | 7B/13B | Dense | — | Apache 2.0 | https://github.com/baichuan-inc/Baichuan2 |
| 14 | **ERNIE 4.5 (开源轻量)** | 百度文心 | 3B/7B | Dense | — | Apache 2.0 | https://huggingface.co/baidu |
| 15 | **Yi (6B/9B/34B)** | 零一万物 | 6B-34B | Dense | 32K-200K | Apache 2.0 | https://github.com/01-ai/Yi |
| 16 | **InternLM2 (7B/20B)** | 上海 AI 实验室 | 7B/20B | Dense | — | Apache 2.0 | https://github.com/InternLM/InternLM |
| 17 | **MiMo-V2-Flash** | 小米 | — | — | — | — | https://huggingface.co/XiaomiMiMo |
| 18 | **QwQ-32B** | 阿里通义千问 | 32B | Dense | 128K | Apache 2.0 | https://huggingface.co/Qwen/QwQ-32B |

### C. 多模态/专项开源模型

| # | 模型 | 类型 | 开发者 | 链接 |
|---|------|------|--------|------|
| 1 | **Qwen2.5-VL** | 视觉语言 | 阿里 | https://github.com/QwenLM/Qwen2.5-VL |
| 2 | **InternVL** | 视觉语言 | 上海 AI 实验室 | https://github.com/OpenGVLab/InternVL |
| 3 | **CogVLM** | 视觉语言 | 智谱 AI | https://github.com/THUDM/CogVLM |
| 4 | **Whisper v4** | 语音识别 | OpenAI | https://github.com/openai/whisper |
| 5 | **Flux Dev** | 文生图 | Black Forest Labs | https://huggingface.co/black-forest-labs/FLUX.1-dev |
| 6 | **Stable Diffusion 3.5** | 文生图 | Stability AI | https://huggingface.co/stabilityai/stable-diffusion-3.5-large |
| 7 | **Wan 2.1** | 文生视频 | 阿里 | https://github.com/Wan-AI/Wan2.1 |
| 8 | **CogVideoX** | 文生视频 | 智谱 AI | https://github.com/THUDM/CogVideo |
| 9 | **BGE (embedding)** | 向量嵌入 | 智谱 AI | https://github.com/FlagOpen/FlagEmbedding |
| 10 | **Jina Embeddings v3** | 向量嵌入 | Jina AI | https://huggingface.co/jinaai/jina-embeddings-v3 |

---

## 第三部分：模型获取与使用入口

### 在线体验 / API 调用

| 平台 | 链接 | 说明 |
|------|------|------|
| **HuggingFace** | https://huggingface.co/models | 全球最大开源模型库，几乎所有开源模型都能在这找到 |
| **ModelScope (魔搭)** | https://modelscope.cn | 阿里达摩院，国内访问快，中文模型全 |
| **Ollama** | https://ollama.com | 本地一键运行开源模型，最简单的本地部署方案 |
| **vLLM** | https://github.com/vllm-project/vllm | 高性能推理引擎，生产部署首选 |
| **Together AI** | https://www.together.ai | 开源模型 API 托管，按量付费 |
| **SiliconFlow (硅基流动)** | https://siliconflow.cn | 国内开源模型 API 平台，DeepSeek/Qwen 等免费额度 |
| **Fireworks AI** | https://fireworks.ai | 开源模型 API，速度快 |

### 国内大模型 API（闭源但有免费额度）

| 平台 | 链接 | 说明 |
|------|------|------|
| **DeepSeek API** | https://platform.deepseek.com | 最便宜的高质量 API，兼容 OpenAI 格式 |
| **通义千问 API** | https://dashscope.aliyun.com | 阿里云，Qwen 系列，有免费额度 |
| **智谱 GLM API** | https://open.bigmodel.cn | GLM 系列，有免费额度 |
| **月之暗面 Kimi API** | https://platform.moonshot.cn | 长上下文能力强 |
| **百度文心 API** | https://qianfan.baidubce.com | 千帆平台 |
| **腾讯混元 API** | https://cloud.tencent.com/product/hunyuan | 腾讯混元 |
| **MiniMax API** | https://platform.minimaxi.com | 4M 超长上下文 |

### 闭源大模型（对比参考）

| 模型 | 公司 | 链接 |
|------|------|------|
| **GPT-4o / GPT-5** | OpenAI | https://platform.openai.com |
| **Claude 4 (Opus/Sonnet)** | Anthropic | https://console.anthropic.com |
| **Gemini 2.5 Pro** | Google | https://aistudio.google.com |
| **Grok 4** | xAI | https://x.ai |

---

## 快速选型指南

### Agent 框架怎么选？

| 你的场景 | 推荐 |
|---------|------|
| 快速原型验证 | **CrewAI**（最易上手） |
| 复杂多步工作流、生产级 | **LangGraph**（控制力最强） |
| 多 Agent 对话协作 | **AutoGen**（学术标杆） |
| 自动化软件开发 | **OpenHands**（开源 Devin） |
| 浏览器自动化 | **Browser-Use** |
| 零代码快速搭 | **Dify** 或 **Coze** |
| 纯 Java 技术栈 | **Spring AI** + **Langchain4j** |

### 开源大模型怎么选？

| 你的场景 | 推荐 |
|---------|------|
| 便宜好用、代码/数学强 | **DeepSeek V3 / R1**（MIT 协议，最开放） |
| 综合能力最强、全尺寸覆盖 | **Qwen 3**（0.6B-235B，Apache 2.0） |
| 本地电脑跑（消费级 GPU） | **Qwen 3 8B** / **Gemma 3 4B** / **Phi-4 Mini** |
| 推理任务（数学/逻辑） | **DeepSeek R1** / **QwQ-32B** |
| 超长上下文 | **MiniMax-01**（4M）/ **Llama 4 Scout**（10M） |
| 视觉理解 | **Qwen2.5-VL** / **InternVL** |
| 中文最强 | **Qwen 3** / **GLM-5** / **DeepSeek V3** |
| RAG 向量嵌入 | **BGE-large-zh**（中文）/ **Jina v3**（多语言） |
