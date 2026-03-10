#!/bin/bash
#========================================================
# DIY script part 1 - Before feeds update
# Add custom feeds (SSR Plus / helloworld)
#========================================================

# Add SSR Plus (helloworld) feed
echo 'src-git helloworld https://github.com/fw876/helloworld.git' >> feeds.conf.default

# Add passwall packages (optional dependency source)
echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git' >> feeds.conf.default
