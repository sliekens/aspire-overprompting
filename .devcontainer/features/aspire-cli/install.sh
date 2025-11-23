#!/bin/env bash
set -euo pipefail
set -x

ASPIRE_INSTALL_URL="https://aspire.dev/install.sh"
TARGET_SCRIPT="/tmp/aspire-install.sh"
QUALITY_OPTION="${QUALITY:-release}"

curl --fail --silent --show-error --location "$ASPIRE_INSTALL_URL" --output "$TARGET_SCRIPT"

run_installer() {
    bash "$TARGET_SCRIPT" --install-path /usr/local/bin --quality "$QUALITY_OPTION"
}

run_installer
echo "Aspire installer completed." 
