# 维护规范

## 目录结构

```text
.
├── README.md                   # 项目入口、导航与版本说明
├── CHANGELOG.md                # 全量版本变更记录
├── VERSION                     # 当前语义化版本号
├── docs/
│   ├── app-list.md             # 软件清单正文，单一事实来源
│   └── maintenance.md          # 本维护规范
└── scripts/
    └── scan-macos-apps.sh      # 本机应用扫描脚本
```

## 更新流程

1. 扫描本机应用：

   ```bash
   bash scripts/scan-macos-apps.sh
   ```

   如需附带 Homebrew Cask 列表：

   ```bash
   bash scripts/scan-macos-apps.sh --with-brew
   ```

2. 只修改 `docs/app-list.md` 中的清单内容，避免在 README 中重复维护。

3. 更新 `VERSION`，并在 `CHANGELOG.md` 的 `[Unreleased]` 或新版本章节记录变化。

4. 提交前检查：

   ```bash
   git diff --check
   bash -n scripts/scan-macos-apps.sh
   ```

5. 发布版本时：

   ```bash
   git add .
   git commit -m "docs(list): release vX.Y.Z"
   git tag -a vX.Y.Z -m "vX.Y.Z"
   git push origin main --tags
   ```

## 版本策略

版本号采用 `MAJOR.MINOR.PATCH`：

- `MAJOR`：目录结构、清单格式或字段定义发生不兼容变化。
- `MINOR`：新增或删除分类、批量增删应用、较大范围内容更新。
- `PATCH`：修正链接、价格、软件描述、安装状态或措辞。

每次清单内容变化都必须对应一个 Changelog 条目。仅修改 README 导航、CI 或工程样式时，可以根据影响选择 `PATCH` 或跳过版本号，但不能跳过 Changelog 记录。

## Changelog 规范

使用以下分类，没有内容时省略：

- `新增`：新软件、新分类、新文档或新工具。
- `变更`：调整分类、描述、状态、价格、链接或维护方式。
- `弃用`：计划移除但尚未删除的内容。
- `移除`：删除软件、分类、文档或脚本。
- `修复`：修正错误信息、失效链接或错误安装状态。
- `安全`：涉及安全信息或敏感内容的变化。

## 提交规范

推荐使用 Conventional Commits：

```text
docs(list): add <app> to <category>
docs(list): update installed status from scan
chore(release): vX.Y.Z
```

一次提交只处理一类变化，便于通过 Git 历史和 tag 回溯每次清单变化。
