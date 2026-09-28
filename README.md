# 🍎 Mac 软件推荐清单

> 当前版本：v2.1.0 · 最后更新：2026-09-28
>
> 免费优先，付费值得的也列。每个软件标明：🆓免费 / 💰付费 / 🔓开源。

## 📚 项目文档

| 文档 | 说明 |
|---|---|
| [软件清单](docs/app-list.md) | 完整分类清单、价格/开源信息与本机安装状态 |
| [变更记录](CHANGELOG.md) | 记录每个版本的清单新增、调整和修复 |
| [维护规范](docs/maintenance.md) | 目录约定、更新流程、版本策略和提交规范 |
| [当前版本](VERSION) | 当前清单的语义化版本号 |

## 🧭 更新清单

1. 运行 `bash scripts/scan-macos-apps.sh` 扫描本机应用。
2. 编辑 [docs/app-list.md](docs/app-list.md)，同步清单与安装状态。
3. 按 [维护规范](docs/maintenance.md) 更新 `VERSION` 和 `CHANGELOG.md`。
4. 发布时创建对应的 Git tag，例如 `v2.1.0`。

## 🔖 版本管理

项目使用语义化版本：

- `MAJOR`：目录结构、清单格式或字段定义发生不兼容变化。
- `MINOR`：新增/删除分类、批量调整应用或较大范围内容更新。
- `PATCH`：链接、价格、描述、安装状态等修正。

完整规则见 [维护规范](docs/maintenance.md)。
