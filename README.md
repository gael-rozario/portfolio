# portfolio

The source for [gaelrozario.com](https://gaelrozario.com) — a personal portfolio site built with SvelteKit, containerized with Docker, and deployed to Kubernetes via Helm and GitHub Actions.

The site is prerendered to static HTML at build time and served by nginx.

## Tech stack

- **[SvelteKit](https://svelte.dev/docs/kit)** with `@sveltejs/adapter-static` — fully prerendered static site
- **Vite** for the build
- **[Playwright](https://playwright.dev/)** for end-to-end tests
- **Docker** (multi-stage build → nginx) and **Helm** for Kubernetes deployment
- **GitHub Actions** for CI/CD, running on self-hosted [ARC](https://github.com/actions/actions-runner-controller) runners

## Project structure

```
src/
  routes/           SvelteKit routes (+layout.svelte, +page.svelte)
  lib/              Components and utilities
  assets/           Images and static assets
  app.html          Page template
  app.css           Global styles
Dockerfile          Multi-stage build → nginx static server
charts/portfolio/   Helm chart for Kubernetes deployment
.github/workflows/  CI, Chart, and CD pipelines
```

## Local development

Requires Node.js 22.

```sh
npm install
npm run dev          # start the dev server
```

Other scripts:

```sh
npm run build        # production build (static output in build/)
npm run preview      # preview the production build
```

## Docker

The `Dockerfile` is a two-stage build: stage one runs `vite build` on `node:22-alpine`, stage two copies the static output into `nginx:alpine` and serves it on port 80 (with SPA fallback).

```sh
docker build -t portfolio .
docker run --rm -p 8080:80 portfolio   # http://localhost:8080
```

Published images live at `ghcr.io/gael-rozario/portfolio`.

## Helm chart

The chart in `charts/portfolio/` deploys the image to Kubernetes.

| Resource | Notes |
|----------|-------|
| `Deployment` | runs the nginx image, port 80, with liveness/readiness probes and CPU/memory limits |
| `Service` | `ClusterIP` on port 80 |
| `HTTPRoute` | Gateway API routes (`gaelrozario.com`) attached to an Envoy Gateway |

Key values (`charts/portfolio/values.yaml`):

- `image.repository` / `image.tag` — image to deploy (tag defaults to the chart `appVersion`)
- `httpRoute.*` — gateway name/namespace and hostnames
- `resources` — requests/limits

Deploy manually from the published OCI chart:

```sh
helm upgrade --install portfolio \
  oci://ghcr.io/gael-rozario/charts/portfolio \
  --version <chart-version> \
  --set image.tag=<image-version> \
  --namespace portfolio --wait
```

## CI/CD

Three GitHub Actions workflows run on the `arc-runner-portfolio` self-hosted runner and publish to GHCR. Each uses least-privilege `permissions` and a `concurrency` group.

- **CI** (`.github/workflows/ci.yaml`)
  - on **push** to `main` (ignoring `charts/**` and `.github/**`): bumps a semver git tag from commit messages, creates a GitHub Release, then builds and pushes the Docker image to `ghcr.io/gael-rozario/portfolio`.
  - on **pull request**: validates the PR title is a [Conventional Commit](https://www.conventionalcommits.org/) and runs `helm lint` / `helm template` on the chart. No tagging, release, or image build happens on PRs.
- **Chart** (`.github/workflows/chart.yaml`) — on push to `main` touching `charts/**`: bumps a `chart-v*` tag, stamps the chart version, then packages and pushes the Helm chart to `oci://ghcr.io/gael-rozario/charts`.
- **CD** (`.github/workflows/cd.yaml`) — runs after CI or Chart completes successfully (or via manual `workflow_dispatch`): resolves the latest image and chart versions and runs `helm upgrade --install` into the `portfolio` namespace. The dispatch form accepts explicit `tag` and `chart` inputs.

Versioning is automatic and driven by commit messages (via [github-tag-action](https://github.com/mathieudutour/github-tag-action)): app images use `vX.Y.Z` tags, charts use `chart-vX.Y.Z` tags.
