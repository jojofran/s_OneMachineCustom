#!/bin/bash

# 检查是否为 root 用户
if [ "$(id -u)" -ne 0 ]; then
    echo "请使用 sudo 运行此脚本！"
    exit 1
fi

# 配置文件路径
CONF_FILE="/usr/share/X11/xorg.conf.d/10-nocursor.conf"

# 创建配置文件目录（如果不存在）
mkdir -p "$(dirname "$CONF_FILE")"

# 写入配置内容
cat > "$CONF_FILE" <<EOF
Section "Device"
    Identifier "NoCursor"
    Driver "dummy"
    Option "NoCursor" "true"
EndSection
EOF

# 设置权限
chmod 644 "$CONF_FILE"

echo "X11 光标禁用配置已写入: $CONF_FILE"
echo "请重启 X 服务或系统生效。"
