#!/usr/bin/env bash
set -euo pipefail
COMFY="${COMFY:-http://127.0.0.1:8188}"
LLM_MODELS_URL="${LLM_MODELS_URL:-}"
echo "==> ComfyUI"
curl -fsS "$COMFY/system_stats" > /dev/null && echo "    up"
if [ -n "$LLM_MODELS_URL" ]; then
  curl -fsS "$LLM_MODELS_URL" > /dev/null && echo "==> LLM API up" || echo "==> LLM check failed"
else
  echo "==> LLM check skipped (set LLM_MODELS_URL)"
fi
