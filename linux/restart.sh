#!/bin/bash

# 使用通配符匹配文件
files=(/root/fomoMiner*/swap.js /root/fomoMiner*/mine.js)

# 定义要替换的旧URL和新URL
old_url="https://sui-rpc.publicnode.com"
new_url="https://rpc-mainnet.suiscan.xyz"

# 遍历文件并进行替换
for file in "${files[@]}"; do
  echo "正在处理文件: $file"
  if [ -f "$file" ]; then
    echo "文件存在且是常规文件"
    if [ -r "$file" ] && [ -w "$file" ]; then
      echo "文件可读可写"
      # 使用sed进行替换，并直接修改文件
      sed -i "s|$old_url|$new_url|g" "$file"
      echo "已在文件 $file 中完成URL替换"
    else
      echo "错误：文件 $file 权限不足"
    fi
  else
    echo "错误：文件 $file 不存在或不是常规文件"
  fi
done

echo "替换操作完成"


pm2 restart all
