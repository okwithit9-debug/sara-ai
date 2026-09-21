# Blueprint

## Current

```
phones (HTTPS)
   -> Open WebUI  127.0.0.1:8080
        -> LLM API   http://LLM_LAN_IP:8001/v1
        -> ComfyUI   127.0.0.1:8188
```

## Future

| Role | Target |
|------|--------|
| Brain | Larger unified-memory Mac |
| Images + smaller LLM | Original Studio |
| Video | Spark + ComfyUI (CUDA) |

## Public vs private

This repo: compose, examples, workflows, installer.
Not this repo: live .env, tokens, family accounts, agent configs, grant drafts.
