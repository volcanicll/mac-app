# 维护规范

## 目录结构

```text
.
├── README.md                   # 项目入口、导航与版本说明
├── CHANGELOG.md                # 全量版本变更记录
├── VERSION                     # 当前语义化版本号
├── docs/
│   ├── app-list.md             # 软件清单正文，单一事实来源
│   ├── installed-apps.md       # 多设备合并的应用安装元数据归档
│   └── maintenance.md          # 本维护规范
└── scripts/
    └── scan-macos-apps.sh      # 当前设备应用扫描脚本
```

## 更新流程

1. 扫描当前设备应用并查看 TSV 结果：

   ```bash
   bash scripts/scan-macos-apps.sh --format tsv
   ```

   如需生成 Markdown 原始报告：

   ```bash
   bash scripts/scan-macos-apps.sh --report /tmp/installed-apps-scan.md
   ```

   扫描范围包括 `/Applications`、`~/Applications` 及其一层子目录。脚本只读取 `Info.plist`、签名和安装位置，不复制应用本体或用户数据。扫描结果只代表当前设备快照。

2. 将扫描结果合并到 `docs/installed-apps.md`：

   - 按 Bundle ID 优先、应用名称兜底去重，每个应用只保留一行。
   - 使用多设备并集合并：新增当前设备记录，同时保留既有其他设备记录。
   - 当前设备未扫描到不等于卸载，不得删除既有记录或清除 `✅`。
   - 保留人工维护的分类、设备来源、备注和异常说明，不直接用原始报告覆盖归档。
   - 建议为每条记录标明设备来源；无法确认来源时保留原记录并在备注中说明。
   - 只记录元数据，不提交 `.app`、DMG、PKG、应用图标或用户数据。
   - 签名异常、Ad-hoc 分发和 Gatekeeper 拒绝项需在备注中标明。

3. 同步 `docs/app-list.md` 中的安装状态和速览表。安装状态按所有已登记设备的并集维护；推荐清单中的未安装条目继续保留，不做删除。

4. 更新 `VERSION`，并在 `CHANGELOG.md` 的 `[Unreleased]` 或新版本章节记录变化。

5. 提交前检查：

   ```bash
   git diff --check
   bash -n scripts/scan-macos-apps.sh
   bash scripts/scan-macos-apps.sh --format tsv
   ```

   同时核对当前设备扫描行数、多设备去重总数、其他设备记录是否完整，以及推荐清单条目是否减少。

6. 发布版本时：

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
