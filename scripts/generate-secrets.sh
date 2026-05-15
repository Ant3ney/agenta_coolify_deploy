#!/usr/bin/env sh
set -eu

make_secret() {
    openssl rand -hex 32
}

cat <<EOF
AGENTA_AUTH_KEY=$(make_secret)
AGENTA_CRYPT_KEY=$(make_secret)
SUPERTOKENS_API_KEY=$(make_secret)
POSTGRES_PASSWORD=$(make_secret)
EOF
