# Chat-Death-Battle

AI-powered VS Battles Wiki consultation and Death Battle website.

## Current stage

This repository is being built incrementally. The current commit contains only the initial Next.js + TypeScript project foundation.

Planned integrations are intentionally deferred until the foundation is verified:
- Supabase
- VS Battles Wiki MediaWiki API
- Groq API

## Development

Required Node.js version: 20.9 or newer.

Install dependencies, then run:

```bash
npm install
npm run dev
```

Type-check with:

```bash
npm run typecheck
```

Real API keys must stay in local environment variables and must never be committed to Git.
