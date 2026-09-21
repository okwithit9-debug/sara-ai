#!/usr/bin/env bash
set -euo pipefail
COMFY_HOME="${COMFY_HOME:-$HOME/ComfyUI}"
echo "==> ComfyUI home: $COMFY_HOME"
if [ ! -d "$COMFY_HOME/.git" ]; then
  git clone https://github.com/comfyanonymous/ComfyUI.git "$COMFY_HOME"
fi
cd "$COMFY_HOME"
if [ ! -d venv ]; then python3 -m venv venv; fi
# shellcheck disable=SC1091
source venv/bin/activate
pip install -q -r requirements.txt
mkdir -p models/checkpoints models/loras
if [ ! -f models/checkpoints/flux1-dev-fp8.safetensors ]; then
  pip install -q huggingface_hub
  huggingface-cli download Comfy-Org/flux1-dev flux1-dev-fp8.safetensors --local-dir models/checkpoints
fi
echo "==> Starting ComfyUI on 127.0.0.1:8188"
python main.py --listen 127.0.0.1 --port 8188 &
echo "    PID $!"
