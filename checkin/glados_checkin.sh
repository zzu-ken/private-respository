#!/bin/bash

# GLaDOS 自动签到脚本
# 使用方法: ./glados_checkin.sh

# API 端点
API_URL="https://glados.cloud/api/user/checkin"

# Cookie 配置 - 请替换为你自己的 Cookie
COOKIE='koa:sess=eyJ1c2VySWQiOjM3OTYxMywiX2V4cGlyZSI6MTc5NjY5NjcxNDcwNCwiX21heEFnZSI6MjU5MjAwMDAwMDB9; koa:sess.sig=UNFtkKRGOVa070zo6L6kg2YqHGg'

# 发送签到请求
response=$(curl -s -X POST "$API_URL" \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'content-type: application/json;charset=UTF-8' \
  -H "cookie: $COOKIE" \
  -H 'origin: https://glados.cloud' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36' \
  --data-raw '{"token":"glados.cloud"}')

# 输出结果
echo "===== GLaDOS 签到结果 ====="
echo "$response" | jq . 2>/dev/null || echo "$response"
echo "========================"
echo "签到时间: $(date '+%Y-%m-%d %H:%M:%S')"
