# 应用安装归档（多设备合并）

[项目首页](../README.md) · [推荐清单](app-list.md) · [维护规范](maintenance.md)

> 当前设备扫描：2026-10-18 00:19 CST（2026-10-17 23:53 初次扫描，复扫补充 Qoder）
> 合并日期：2026-10-18
> 扫描范围：`/Applications` 与 `~/Applications`，包含一层子目录中的应用包
> 当前设备：MacBook Pro（Apple M5，32 GB）· macOS 26.5.1（25F80）
> 当前设备扫描到 38 个应用包，占用约 19 GB；合并后共 53 条唯一应用记录（含 1 个卸载辅助程序）。
> 当前设备扫描结果只代表一台设备，不包含 Safari 等系统自带应用；其他设备记录来自既有安装清单。

## 归档说明

- 本归档按“已登记设备的应用并集”维护。当前设备扫描只负责补充和更新当前设备元数据，不覆盖或删除其他设备记录。
- 合并时按 Bundle ID 优先、应用名称兜底去重；每个应用包只保留一条记录。
- 当前设备未扫描到不等于已卸载，也不据此移除推荐清单中的 `✅` 标记。
- `设备来源` 标明记录来自当前设备扫描，还是来自其他设备的既有清单；未知字段使用 `—`。
- 本文件只记录可追溯的应用元数据，不复制 `.app` 本体、DMG、PKG 或用户数据。
- 安装方式按 Homebrew Cask、Mac App Store、独立安装包/手动安装三类记录。
- 签名状态基于当前设备 2026-10-18 的检查；`Ad-hoc` 和签名异常会在备注中标明。
- 应用版本会随自动更新变化，需要更新当前设备快照时重新运行扫描脚本。
- 推荐清单与归档按 Bundle ID 优先、名称兜底去重；推荐清单中的未安装条目继续保留，不做删除。

## 概览

| 分类 | 数量 | 已登记安装应用 |
|---|---:|---|
| 开发与 AI 编程 | 25 | Antigravity、Android Studio、CC Switch、ChatGPT、Claude、Cline、Cumora、DeepSeek Harness、Ghostty、Kaku、LobeHub、Netcatty、OpenChamber、OrbStack、Orca、PortHawk、Ports、Qoder、Reasonix、Trae CN、Transporter、VS Code、wechatwebdevtools、Xcode、ZCode |
| AI / 知识 / 效率 | 5 | Bloome、magpie、Nowledge Mem、Obsidian、uTools |
| 系统与网络 | 12 | BetterDisplay、FlClash、Keka、LocalSend、Macs Fan Control、Microsoft Edge、MonitorControl、OpenVPN Connect、Pulse、Stats、zerotrust-client、云脉（Yunmai） |
| 通讯与办公 | 6 | Cherry Studio、ONLYOFFICE、Telegram、WeChat、WorkBuddy、研发云SDP |
| 媒体与工具 | 3 | Google Chrome、网易云音乐、Snipaste |
| 独立应用目录 / 卸载辅助 | 2 | Hopper Disassembler、Uninstall OpenVPN Connect |

> 分类用于归档，不完全等同于推荐清单中的产品分类。部分应用可跨类，例如 Cherry Studio 同时属于 AI 客户端与办公工具。

本次保留的 15 条其他设备记录：Android Studio、Cline、Kaku、Ports、Trae CN、Transporter、Xcode、BetterDisplay、Keka、Macs Fan Control、Microsoft Edge、MonitorControl、zerotrust-client、云脉（Yunmai）、ONLYOFFICE。这些条目在当前设备扫描中未出现，但按多设备合并规则继续保留。

## 开发与 AI 编程

| 应用 | 版本 | Bundle ID | 设备来源 | 安装位置 | 来源 / 安装方式 | 签名状态 | 备注 |
|---|---|---|---|---|---|---|---|
| Antigravity | 2.24.0 | `com.google.antigravity` | 当前设备 | `/Applications/Antigravity.app` | 独立安装 | Notarized Developer ID | Google 的 AI 开发环境 |
| Android Studio | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| CC Switch | 3.20.3 | `com.ccswitch.desktop` | 当前设备 | `/Applications/CC Switch.app` | 独立安装 | Notarized Developer ID | AI 编程配置切换器 |
| ChatGPT | 26.1007.71326 | `com.openai.codex` | 当前设备 | `/Applications/ChatGPT.app` | 独立安装 | Notarized Developer ID | Bundle ID 为 `com.openai.codex` |
| Claude | 2.42304.0 | `com.anthropic.claudefordesktop` | 当前设备 | `/Applications/Claude.app` | 独立安装 | Notarized Developer ID | Anthropic 桌面客户端 |
| Cline | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| Cumora | 0.1.64 | `io.cumora.app` | 当前设备 | `/Applications/Cumora.app` | 独立安装 | Notarized Developer ID | 本地 AI 工作流工具 |
| DeepSeek Harness | 0.2.1-rc.2 | `com.deepseek.dsh` | 当前设备 | `/Applications/DeepSeek Harness.app` | 独立安装 | Notarized Developer ID | 预发布版本 |
| Ghostty | 1.3.1 | `com.mitchellh.ghostty` | 当前设备 | `/Applications/Ghostty.app` | Homebrew Cask | Notarized Developer ID | 通过 `brew install --cask ghostty` 安装 |
| Kaku | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| LobeHub | 2.2.19 | `com.lobehub.lobehub-desktop` | 当前设备 | `/Applications/LobeHub.app` | 独立安装 | Notarized Developer ID | AI 助手桌面端 |
| Netcatty | 1.1.81 | `com.netcatty.app` | 当前设备 | `/Applications/Netcatty.app` | 独立安装 | Notarized Developer ID | SSH / Telnet / JumpServer 客户端 |
| OpenChamber | 2.1.1 | `dev.openchamber.desktop` | 当前设备 | `/Applications/OpenChamber.app` | 独立安装 | Notarized Developer ID | Agentic 开发环境 |
| OrbStack | 2.2.3 | `dev.kdrag0n.MacVirt` | 当前设备 | `/Applications/OrbStack.app` | Homebrew Cask | Notarized Developer ID | Docker / Linux 容器运行环境 |
| Orca | 1.4.224 | `com.stablyai.orca` | 当前设备 | `/Applications/Orca.app` | 独立安装 | Notarized Developer ID | AI 编程工作台 |
| PortHawk | 0.1.4 | `app.porthawk.PortHawk` | 当前设备 | `/Applications/PortHawk.app` | 独立安装 | Ad-hoc，Gatekeeper 拒绝 | 本地构建或未签名分发 |
| Ports | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| Qoder | 0.4.8 | `com.qoder.app` | 当前设备 | `/Applications/Qoder.app` | 独立安装 | Notarized Developer ID | AI 编程 IDE |
| Reasonix | 1.39.5 | `com.wails.reasonix-desktop` | 当前设备 | `/Applications/Reasonix.app` | Homebrew Cask | Notarized Developer ID | Cask 记录为 1.18.0，应用已自动更新到 1.39.5 |
| Trae CN | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| Transporter | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| VS Code | 1.142.0 | `com.microsoft.VSCode` | 当前设备 | `/Applications/Visual Studio Code.app` | Homebrew Cask | Notarized Developer ID | 应用包显示名称为 `Code` |
| wechatwebdevtools | 36.6.0 | `com.github.Electron` | 当前设备 | `/Applications/wechatwebdevtools.app` | 独立安装 | Notarized Developer ID | 微信开发者工具 |
| Xcode | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| ZCode | 3.15.3 | `dev.zcode.app` | 当前设备 | `/Applications/ZCode.app` | 独立安装 | Notarized Developer ID | 智谱 GLM 编码客户端 |

## AI / 知识 / 效率

| 应用 | 版本 | Bundle ID | 设备来源 | 安装位置 | 来源 / 安装方式 | 签名状态 | 备注 |
|---|---|---|---|---|---|---|---|
| Bloome | 0.1.54 | `com.reson.desktop` | 当前设备 | `/Applications/Bloome.app` | 独立安装 | Notarized Developer ID | AI 社交 / 知识工具 |
| magpie | 0.1.1279 | `com.yetone.magpie` | 当前设备 | `/Applications/magpie.app` | 独立安装 | Notarized Developer ID | 菜单栏 AI 工具 |
| Nowledge Mem | 0.10.67 | `co.nowledge.mem.desktop` | 当前设备 | `/Applications/Nowledge Mem.app` | 独立安装 | Notarized Developer ID | 本地知识记忆工具 |
| Obsidian | 1.12.7 | `md.obsidian` | 当前设备 | `/Applications/Obsidian.app` | 独立安装 | Notarized Developer ID | 本地优先 Markdown 笔记 |
| uTools | 8.0.0-beta.7 | `org.yuanli.utools` | 当前设备 | `/Applications/uTools.app` | 独立安装 | Notarized Developer ID | 预发布版本 |

## 系统与网络

| 应用 | 版本 | Bundle ID | 设备来源 | 安装位置 | 来源 / 安装方式 | 签名状态 | 备注 |
|---|---|---|---|---|---|---|---|
| BetterDisplay | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| FlClash | 0.8.99 | `com.follow.clash` | 当前设备 | `/Applications/FlClash.app` | 独立安装 | Ad-hoc，Gatekeeper 拒绝 | 开源代理客户端 |
| Keka | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| LocalSend | 1.18.2 | `org.localsend.localsendApp` | 当前设备 | `/Applications/LocalSend.app` | Homebrew Cask | Notarized Developer ID | 局域网文件传输 |
| Macs Fan Control | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| Microsoft Edge | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| MonitorControl | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| OpenVPN Connect | 3.8.2 | `org.openvpn.client.app` | 当前设备 | `/Applications/OpenVPN Connect/OpenVPN Connect.app` | 官方 PKG | Notarized Developer ID | 安装在子目录中 |
| Pulse | 0.1.12 | `com.egoist.pulse` | 当前设备 | `/Applications/Pulse.app` | 独立安装 | Notarized Developer ID | 菜单栏网络 / 系统监控 |
| Stats | 3.0.20 | `eu.exelban.Stats` | 当前设备 | `/Applications/Stats.app` | Homebrew Cask | Notarized Developer ID | 系统状态监控 |
| zerotrust-client | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| 云脉（Yunmai） | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |

## 通讯与办公

| 应用 | 版本 | Bundle ID | 设备来源 | 安装位置 | 来源 / 安装方式 | 签名状态 | 备注 |
|---|---|---|---|---|---|---|---|
| Cherry Studio | 2.1.2 | `com.kangfenmao.CherryStudio` | 当前设备 | `/Applications/Cherry Studio.app` | 独立安装 | Notarized Developer ID | 多模型 AI 桌面客户端 |
| ONLYOFFICE | — | — | 其他设备 | — | 既有清单（其他设备） | — | 其他设备已登记；当前设备未扫描到，保留 |
| Telegram | 7.2.9 | `com.tdesktop.Telegram` | 当前设备 | `/Applications/Telegram.app` | 独立安装 | Notarized Developer ID | 即时通讯 |
| WeChat | 4.1.13 | `com.tencent.xinWeChat` | 当前设备 | `/Applications/WeChat.app` | Mac App Store | Mac App Store | 微信 macOS 客户端 |
| WorkBuddy | 5.8.3 | `com.tencent.workbuddy.mac` | 当前设备 | `/Applications/WorkBuddy.app` | 独立安装 | Notarized Developer ID | 腾讯办公助手 |
| 研发云SDP | 2.1.1 | `com.cyberex3.SecAccess` | 当前设备 | `/Applications/研发云SDP.app` | 独立安装 | Developer ID（深度校验异常） | 应用包内 `sdp.process.plist` 导致签名校验失败 |

## 媒体与工具

| 应用 | 版本 | Bundle ID | 设备来源 | 安装位置 | 来源 / 安装方式 | 签名状态 | 备注 |
|---|---|---|---|---|---|---|---|
| Google Chrome | 155.0.8059.85 | `com.google.Chrome` | 当前设备 | `/Applications/Google Chrome.app` | 独立安装 | Developer ID（资源分叉告警） | 深度校验提示资源分叉 / Finder 信息残留，应用可正常使用 |
| 网易云音乐 | 3.1.13 | `com.netease.163music` | 当前设备 | `/Applications/NeteaseMusic.app` | 独立安装 | Notarized Developer ID | 应用包名称为 `NeteaseMusic` |
| Snipaste | 2.11.3 | `com.Snipaste` | 当前设备 | `/Applications/Snipaste.app` | 独立安装 | Notarized Developer ID | 截图与贴图工具 |

## 独立应用目录 / 卸载辅助

| 应用 | 版本 | Bundle ID | 设备来源 | 安装位置 | 来源 / 安装方式 | 签名状态 | 备注 |
|---|---|---|---|---|---|---|---|
| Hopper Disassembler | 6.6.0-demo | `com.cryptic-apps.hopper-web-4` | 当前设备 | `~/Applications/Hopper Disassembler.app` | 独立安装 | Notarized Developer ID | Demo 版本 |
| Uninstall OpenVPN Connect | 0.1 | `net.openvpn.uninstaller` | 当前设备 | `/Applications/OpenVPN Connect/Uninstall OpenVPN Connect.app` | 官方 PKG 附带 | Notarized Developer ID | OpenVPN Connect 自带的卸载器，计入应用包总数 |

## 当前设备 Homebrew Cask 对照

当前设备登记的 Cask：

```text
android-commandlinetools
flutter
ghostty
localsend
orbstack
reasonix
stats
temurin@17
visual-studio-code
```

其中 `android-commandlinetools`、`flutter` 和 `temurin@17` 是命令行工具或 SDK，不对应 `/Applications` 中的 `.app`。`orbstack` 的 Cask 登记版本为 2.2.3，与当前应用一致。

> 本次运行 `brew list --cask --versions` 时，Homebrew 因 `reasonix` Cask 定义中的 `staged_path` 错误而退出；Cask 清单通过 `/opt/homebrew/Caskroom` 目录补全，未修改 Homebrew 配置。

## 重新生成当前设备快照

```bash
bash scripts/scan-macos-apps.sh --format tsv
bash scripts/scan-macos-apps.sh --report /tmp/installed-apps-scan.md
```

脚本只读取应用包的 `Info.plist`、签名和安装位置；不会上传、复制或修改任何应用。生成的原始报告只代表当前设备，用于和本文件合并，不直接覆盖人工维护的分类、设备来源与备注。

---

*归档版本：v2.2.0*
*合并日期：2026-10-18*
*数据来源：当前设备 2026-10-18 复扫（含 2026-10-17 初次扫描）+ 既有其他设备安装清单 + Homebrew Caskroom*
