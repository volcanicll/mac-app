# Changelog

本文件记录 Mac 软件清单的重要变化。

- 格式参考 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.1.0/)。
- 版本遵循 [Semantic Versioning](https://semver.org/lang/zh-CN/)。
- 日期统一使用 `YYYY-MM-DD`。

## [Unreleased]

暂无待发布变更。

## [2.1.1] - 2026-10-18

### 新增

- 新增 `docs/installed-apps.md`，归档多设备合并后的 53 条唯一应用记录，其中 38 条包含当前设备元数据。
- 新增 Antigravity、Claude、Cumora、DeepSeek Harness、LobeHub、magpie、Netcatty、Nowledge Mem、Orca、PortHawk、Pulse、Qoder、Telegram、WorkBuddy、Hopper Disassembler 等当前设备应用记录。
- 扫描脚本新增 `--format tsv` 和 `--report FILE`，支持生成可重复的 Markdown 快照。

### 变更

- 扫描范围扩展到 `/Applications`、`~/Applications` 及其一层子目录，可识别 OpenVPN Connect 等嵌套应用包。
- 扫描结果增加安装来源、Gatekeeper / 签名状态和 Homebrew Cask 对照。
- 合并既有安装清单与 2026-10-18 当前设备复扫（含 2026-10-17 初次扫描），形成 2026-10-18 的多设备已安装速览。
- 合并归档与推荐清单时按 Bundle ID 优先、应用名称兜底去重，保留全部未安装的推荐条目。
- 当前设备扫描结果只更新当前设备元数据，不覆盖或删除其他设备记录。

### 修复

- 恢复其他设备已安装的 Xcode、Cline、Trae CN、Kaku、Android Studio、Transporter、Ports、Macs Fan Control、BetterDisplay、MonitorControl、Keka、ONLYOFFICE 等应用的 `✅` 标记。
- 当前设备未扫描到的 15 条其他设备应用记录继续保留，不据此判定卸载。
- 修正 Claude 的安装状态，并补充当前设备已安装的 OrbStack、微信开发者工具等条目。
- 修正 OpenVPN Connect 卸载器的版本和 Bundle ID。

### 安全

- 记录 FlClash、PortHawk 的 Ad-hoc 签名与 Gatekeeper 拒绝状态。
- 记录研发云SDP 的深度签名校验异常，以及 Google Chrome 的资源分叉告警。

## [2.1.0] - 2026-09-28

### 新增

- 新增本机已安装速览，记录 2026-09-28 扫描 `/Applications` 的结果。
- 新增 Android Studio、Transporter、微信开发者工具、Ports 等开发工具。
- 新增 Cline、Trae CN、ZCode、OpenChamber、CC Switch、Kaku 等 AI 编程/Agent 工具。
- 新增 FlClash、OpenVPN Connect、ONLYOFFICE、网易云音乐等清单条目。
- 新增 `docs/maintenance.md`，定义目录、更新流程、版本策略和提交规范。
- 新增 `scripts/scan-macos-apps.sh`，用于生成可重复的本机应用扫描结果。

### 变更

- 为原有推荐清单中的本机已安装应用增加 `✅` 标记。
- 更新快速选型指南，增加本机当前开发组合。
- 将完整软件清单从 `README.md` 迁移至 `docs/app-list.md`。
- 将 `README.md` 调整为项目入口页，仅保留导航和维护说明。
- 页脚更新为 2026-09-28，并注明本机 `/Applications` 扫描来源。

## [2.0.0] - 2026-05-02

### 变更

- 基于 awesome-mac 与社区口碑全面重写清单。
- 重建开发、效率、AI、截图设计、系统、网络、写作、媒体和进阶推荐分类。
- 统一补充免费/付费/开源标识、软件描述和官网链接。

## [1.0.0] - 2026-04-02

### 新增

- 创建初始 Mac 软件分类推荐清单。
