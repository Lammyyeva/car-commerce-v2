# 🛒 Vendure + MeiliSearch Large-Scale E-commerce Project

This README describes a **large, production-grade e-commerce architecture** built with **Vendure**, using a **monorepo** and a **plugin-based approach**.

Project goals:

* Highly scalable
* Easily extensible via plugins
* Clear separation of Admin / Frontend / Server
* Powerful search with MeiliSearch
* Support for complex business logic such as dealer pricing, multi-price items, wallet, and cashback

---

## 📦 Overall Architecture

```
vendure-root/
│
├── apps/              # Application layer
├── plugins/           # All business logic plugins
├── packages/          # Shared packages (utils, types, SDKs)
├── infra/             # Infrastructure (Docker, CI/CD, Nginx)
├── scripts/           # Seed, migration, cron jobs
├── docs/              # Architecture & ADR documentation
└── package.json       # Monorepo workspace definition
```

---

## 🧠 Architecture Principles

* **Minimal core** – Vendure server contains only configuration & bootstrap logic
* **Business logic = Plugins**
* **Event-driven architecture** (loose coupling)
* **Admin API & Storefront API are separated**
* **Future-proof & microservice-ready**

---

## 🚀 apps/

```
apps/
├── server/        # Vendure backend (core)
├── admin-ui/      # Custom Vendure Admin UI
└── storefront/    # Storefront frontend (Next.js / React Native)
```

### apps/server/

The Vendure core server. No direct business logic lives here.

```
apps/server/
├── src/
│   ├── config/            # Vendure configuration files
│   ├── environment/       # env.dev / env.prod / env.test
│   ├── main.ts            # Application bootstrap
│   └── shared/            # Shared constants & helpers
├── migrations/
└── test/
```

---

## 🧩 plugins/

All **business logic** is implemented as isolated plugins.

```
plugins/
├── auth/
├── payments/
├── pricing/
├── wallet/
├── cashback/
├── recommendation/
├── search-meili/
└── shared/
```

### Standard plugin structure

```
plugin-name/
├── *.plugin.ts        # VendurePlugin definition
├── entities/          # Database entities
├── services/          # Core business logic
├── api/               # GraphQL resolvers
│   ├── admin.resolver.ts
│   └── shop.resolver.ts
├── events/            # Event listeners / subscribers
├── permissions.ts     # Custom permissions
└── index.ts
```

---

## 🔐 Auth Plugin

Supported authentication methods:

* Email / Password
* Phone (OTP)
* Google OAuth
* Apple Sign-In

```
auth/
├── strategies/
│   ├── google.strategy.ts
│   ├── apple.strategy.ts
│   ├── phone.strategy.ts
│   └── email.strategy.ts
└── api/
```

---

## 💳 Payments Plugin

* Online payment providers
* Webhook handling
* Order state integration

```
payments/
├── providers/
│   ├── stripe.provider.ts
│   ├── payme.provider.ts
│   └── click.provider.ts
└── webhooks/
```

---

## 💰 Pricing Plugin

Supports:

* Dealer vs Retail pricing
* Multiple prices per item
* Quantity-based pricing tiers

```
pricing/
├── strategies/
│   ├── dealer-pricing.strategy.ts
│   ├── qty-pricing.strategy.ts
│   └── multiprice.strategy.ts
```

---

## 👛 Wallet Plugin

* User balance management
* Transaction history
* Refund & cashback integration

```
wallet/
├── entities/
├── services/
└── api/
```

---

## 🎁 Cashback Plugin

* Rule-based cashback engine
* Triggered on order completion
* Integrated with Wallet plugin

```
cashback/
├── rules/
├── services/
└── api/
```

---

## 🤖 Recommendation Plugin

* Rule-based recommendations
* AI-ready architecture (future extension)

```
recommendation/
├── engines/
│   ├── rule-based.engine.ts
│   └── ai.engine.ts
└── cron/
```

---

## 🔍 MeiliSearch Plugin

```
search-meili/
├── meili.client.ts
├── indexer/
├── sync/
├── api/
└── search-meili.plugin.ts
```

Features:

* Typo-tolerant full-text search
* Faceted & filtered search
* High performance at scale
* Multi-language ready

---

## 🧑‍💻 apps/admin-ui/

Custom Vendure Admin UI with feature-specific plugins.

```
admin-ui/
├── plugins/
│   ├── pricing-admin/
│   ├── wallet-admin/
│   └── cashback-admin/
└── theme/
```

---

## 🛍️ apps/storefront/

```
storefront/
├── modules/
│   ├── auth/
│   ├── product/
│   ├── pricing/
│   ├── wallet/
│   └── search/
├── graphql/
├── hooks/
└── ui/
```

The frontend communicates **only via GraphQL contracts**.

---

## 🏗️ infra/

```
infra/
├── docker/
│   ├── vendure.yml
│   └── meilisearch.yml
├── nginx/
└── ci/
```

---

## ⚙️ scripts/

* Database seed
* MeiliSearch reindexing
* Cron & maintenance jobs

```
scripts/
├── seed.ts
├── reindex-meili.ts
└── cleanup.ts
```

---

## 📈 Ready for the Future

* Event-driven architecture
* Microservice-ready design
* Queue support (BullMQ / RabbitMQ)
* External AI recommendation service

---

## ✅ Summary

With this structure:

* Large teams can work efficiently
* Business logic is cleanly isolated
* Adding new features is straightforward
* Performance and scalability are built-in

---

📌 **Recommendation:** Every new major feature should be implemented as a new plugin.

---

✍️ Author: Vendure Architecture Template

---

## 🧪 Development

```bash
npm run dev
```

Starts the Vendure **server** and **worker** processes in development mode.

Useful links:

* Vendure Worker: [https://www.vendure.io/docs/developer-guide/vendure-worker/](https://www.vendure.io/docs/developer-guide/vendure-worker/)

---

## 🏗️ Build

```bash
npm run build
```

Compiles all TypeScript sources into the `/dist` directory.

---

## 🚀 Production

Production deployment depends on your infrastructure and operational requirements.

### Running directly

```bash
npm run start
```

For long-running processes, it is recommended to use a process manager such as **PM2**.

---

### Using Docker

A sample `Dockerfile` is included.

```bash
docker build -t vendure .
```

Run containers:

```bash
# Server
docker run -dp 3000:3000 \
  -e "DB_HOST=host.docker.internal" \
  --name vendure-server vendure npm run start:server

# Worker
docker run -dp 3001:3000 \
  -e "DB_HOST=host.docker.internal" \
  --name vendure-worker vendure npm run start:worker
```

> ⚠️ `host.docker.internal` is intended for local development only.

---

### Docker Compose

A `docker-compose.yml` file is provided with commonly used services:

* PostgreSQL
* MySQL / MariaDB
* Redis
* MeiliSearch

```bash
docker-compose up <service>

# examples
docker-compose up postgres_db
docker-compose up redis
```

---

## 🧩 Plugins

Custom functionality should be implemented as **Vendure plugins**.

To generate a new plugin:

```bash
npx vendure add
```

Select:

```
[Plugin] Create a new Vendure plugin
```

---

## 🗄️ Migrations

Database migrations are required when:

* Adding new entities
* Modifying custom fields

Generate a migration:

```bash
npx vendure migrate
```

Migration files are stored in:

```
apps/server/src/migrations/
```

During early development only, you may enable:

```ts
dbConnectionOptions: { synchronize: true }
```

⚠️ **Never use `synchronize: true` in production**.

---

## 🛠️ Troubleshooting

### Error: Could not load the "sharp" module

Ensure:

* Node.js version: `^18.17.0 || ^20.3.0 || >=21.0.0`
* Package manager is up to date

As a last resort (not recommended):

```bash
pnpm install sharp --config.platform=linux --config.architecture=x64
# or
npm install sharp --os linux --cpu x64
```

---

## 🧾 Git Commit Guidelines

This project follows **Conventional Commits** with optional **Gitmoji** support to keep commit history clean, readable, and automatable.

---

### 📐 Commit Message Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Example:**

```bash
git commit -m "fix: resolve price calculation issue"
```

---

### 🏷️ Commit Types

| Type     | Description                                |
| -------- | ------------------------------------------ |
| feat     | Introduces a new feature                   |
| fix      | Fixes a bug                                |
| chore    | Maintenance tasks (deps, configs, tooling) |
| refactor | Code refactoring without behavior change   |
| docs     | Documentation changes (README, docs)       |
| style    | Formatting, linting, no logic change       |
| test     | Adding or fixing tests                     |
| perf     | Performance improvements                   |
| ci       | CI/CD related changes                      |
| build    | Build system or dependency changes         |
| revert   | Reverts a previous commit                  |

---

## 😄 Gitmoji (Optional but Recommended)

Gitmoji adds **visual meaning** to commits and improves GitHub readability.

### Installation

```bash
npm i -g gitmoji-cli
```

---

### ✨ Commit Examples with Emojis

```bash
git commit -m ":tada: initial commit"
git commit -m ":sparkles: add wallet plugin"
git commit -m ":bug: fix dealer price calculation"
git commit -m ":books: update README"
git commit -m ":hammer: refactor pricing strategy"
```

You can also use emojis inline:

```bash
git commit -m "We did it, time to party :partying_face:"
```

---

### 📊 Common Gitmoji Reference

| Purpose         | Emoji                              |
| --------------- | ---------------------------------- |
| Initial commit  | 🎉 `:tada:`                        |
| New feature     | ✨ `:sparkles:`                     |
| Bug fix         | 🐛 `:bug:`                         |
| Documentation   | 📚 `:books:`                       |
| Refactor        | 🔨 `:hammer:`                      |
| Performance     | 🏎️ `:racehorse:`                  |
| Tests           | 🚨 `:rotating_light:`              |
| CI              | 💚 `:green_heart:`                 |
| Security        | 🔒 `:lock:`                        |
| Dependencies    | ⬆️⬇️ `:arrow_up:` / `:arrow_down:` |
| Docker          | 🐳 `:whale:`                       |
| Config          | 🔧 `:wrench:`                      |
| Breaking change | 💥 `:boom:`                        |
| Revert          | ⏪ `:rewind:`                       |

Full reference: [https://gitmoji.dev/](https://gitmoji.dev/)

---

## 📌 Final Notes

* Each **major feature = separate plugin**
* Prefer **event-driven communication** between plugins
* Keep Vendure core minimal
* Follow **Conventional Commits** to enable changelogs & releases

---

✍️ Author: 100haryt team
