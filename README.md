# OpenWrt for Phicomm K2P A2

基于 [Lean's LEDE](https://github.com/coolsnowwolf/lede) 源码，使用 GitHub Actions 自动编译斐迅 K2P A2 版本 OpenWrt 固件。

## 功能特性

- **目标设备**: 斐迅 K2P (A2版本, MT7621AT)
- **SSR Plus**: 含 Xray / ShadowsocksR / Shadowsocks-Rust / Hysteria / Tuic 等
- **Luci 界面**: 中文界面，包含常用插件
- **内置插件**:
  - SSR Plus (科学上网)
  - Turbo ACC (网络加速)
  - UPnP
  - DDNS
  - KMS (vlmcsd)
  - 访问控制
  - 定时重启
  - 文件传输

## 使用方法

### 1. Fork 本仓库

点击右上角 `Fork` 按钮，将本仓库 Fork 到你的账户下。

### 2. 触发编译

有两种方式触发编译：

**方式一：手动触发**
- 进入你 Fork 后的仓库
- 点击 `Actions` 标签
- 选择 `Build OpenWrt for K2P A2`
- 点击 `Run workflow`

**方式二：SSH 调试模式**
- Run workflow 时将 `SSH connection to Actions` 设为 `true`
- 可以在编译前通过 SSH 连接到编译环境，手动修改配置

### 3. 下载固件

编译完成后：
- 在 `Actions` 页面的对应 workflow run 中下载 Artifact
- 或在仓库的 `Releases` 页面下载

### 4. 刷机

1. 进入 K2P 的 Breed 引导（按住 reset 键开机，等待指示灯闪烁后松开）
2. 浏览器访问 `192.168.1.1`
3. 选择固件更新，上传编译好的 `.bin` 固件文件
4. 等待刷写完成并自动重启

## 默认配置

| 项目 | 值 |
|------|-----|
| 默认 IP | 192.168.1.1 |
| 默认密码 | password |
| WiFi | 默认关闭，需手动开启 |

## 文件说明

```
.
├── .github/workflows/build-openwrt.yml  # GitHub Actions 工作流
├── .config                               # OpenWrt 编译配置
├── diy-part1.sh                          # 自定义脚本1（添加 SSR Plus 源）
├── diy-part2.sh                          # 自定义脚本2（自定义配置）
└── README.md                             # 说明文档
```

## 自定义修改

### 修改默认 IP
编辑 `diy-part2.sh`，修改 `192.168.1.1` 为你想要的 IP。

### 增减插件
编辑 `.config` 文件，按 OpenWrt menuconfig 格式添加或删除软件包。

### SSH 调试
手动触发 workflow 时，将 SSH 参数设为 `true`，可以在线进入编译环境执行 `make menuconfig` 等操作。

## 致谢

- [Lean's LEDE](https://github.com/coolsnowwolf/lede)
- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
- [helloworld (SSR Plus)](https://github.com/fw876/helloworld)
- [luci-theme-argon](https://github.com/jerrykuku/luci-theme-argon)
