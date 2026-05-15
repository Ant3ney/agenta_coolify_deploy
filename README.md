# Agenta on Coolify

This repo is a minimal Docker Compose deployment wrapper for self-hosting [Agenta](https://github.com/Agenta-AI/agenta) on Coolify.

It uses Agenta's published GHCR images and keeps the public surface to one `nginx` service. Nginx routes:

- `/` to the Agenta web app
- `/api/` to the Agenta API
- `/services/` to Agenta services

## Coolify Quick Start

1. Push this folder to your own Git repo.
2. In Coolify, create a new Docker Compose resource from that repo.
3. Assign your domain to the `nginx` service on port `80`.
4. Add environment variables from `.env.example`, replacing the secrets and domain values.
5. Deploy.

Generate production secrets locally:

```sh
./scripts/generate-secrets.sh
```

For local smoke testing:

```sh
cp .env.example .env
docker compose --env-file .env -f docker-compose.yml -f docker-compose.local.yml up -d
```

Then open `http://localhost:8080`.

## Notes

- Do not expose Postgres or Redis to the public internet.
- Set the Agenta URL variables to your final Coolify domain before first real use.
- Keep `POSTGRES_PASSWORD` stable after the first deployment unless you also rotate the existing database user password.
- The compose file defaults image tags to `latest`; pin `AGENTA_*_IMAGE_TAG` to a specific Agenta release when you want controlled upgrades.
