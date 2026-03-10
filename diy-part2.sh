#!/bin/bash
#========================================================
# DIY script part 2 - After feeds install
# Customize configuration for Phicomm K2P A2
#========================================================

# Modify default IP address (change to your preference)
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# Modify default hostname
sed -i 's/OpenWrt/K2P/g' package/base-files/files/bin/config_generate

# Modify default timezone
sed -i "s/'UTC'/'CST-8'\n\t\tset system.@system\[0\].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# Remove default theme argon (if exists) and re-clone latest version
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
