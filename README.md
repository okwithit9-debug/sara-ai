# Sara AI

Open-source home AI node. Local LLM chat + ComfyUI images behind Open WebUI. MIT.

Live prototype (registration-gated): https://saraai.chat

Clone:

```bash
git clone https://github.com/okwithit9-debug/sara-ai.git
cd sara-ai
cp compose/.env.example compose/.env
# set WEBUI_SECRET_KEY and OPENAI_API_BASE_URL
cd compose && docker compose up -d
```

## What runs

| Role | Typical box | Software |
|------|-------------|----------|
| Chat brain | NVIDIA Spark-class (128 GB) | Qwen 3.8 Flash Next, OpenAI-compatible API |
| Fallback LLM | Apple Mac Studio | Qwen 3.8 27B |
| Images | Same Studio | ComfyUI + FLUX FP8 + LoRAs |
| Front door | Same Studio | Open WebUI, Docker, HTTPS tunnel or tailnet |

The model stays on its box. The UI only sends a short request and gets tokens back. No KV cache over the wire.

## Layout

- `compose/` - Open WebUI Docker recipe
- `scripts/` - ComfyUI install + smoke test
- `workflows/` - Flux style JSONs
- `docs/blueprint.md` - architecture
- `docs/economics.md` - honest prototype math
- `docs/SANITIZE.md` - what never ships in this repo

Private household ops stay in a separate private repo.

## License

MIT. See `LICENSE`.
