#!/usr/bin/env bash
# Build k9s with a custom prompt icon.
#
# k9s hardcodes the prompt emoji in internal/ui/prompt.go (🐶 for the `:`
# command prompt, 🐩 for the `/` filter prompt). There is no config or skin
# setting for it, so changing it means building from source.
#
#   ./build-k9s.sh                 # default: 🌸, latest release tag
#   ./build-k9s.sh 🦊              # different icon
#   ./build-k9s.sh 🌸 v0.50.18     # pin a version
#
# Installs to ~/.local/bin/k9s, which must come before the system k9s on PATH.
set -euo pipefail

ICON="${1:-🌸}"
VERSION="${2:-}"
DEST="${HOME}/.local/bin"
WORKDIR="$(mktemp -d)"
trap 'rm -rf "${WORKDIR}"' EXIT

command -v go >/dev/null || { echo "go toolchain required"; exit 1; }

if [[ -z "${VERSION}" ]]; then
  VERSION="$(git ls-remote --tags --refs --sort=-v:refname https://github.com/derailed/k9s.git \
    | head -1 | sed 's|.*refs/tags/||')"
fi
echo "building k9s ${VERSION} with prompt icon ${ICON}"

git clone -q --depth 1 --branch "${VERSION}" https://github.com/derailed/k9s.git "${WORKDIR}/k9s"
cd "${WORKDIR}/k9s"

# Replace both prompt runes.
perl -CSD -i -pe "s/return '\x{1F436}', '>'/return '${ICON}', '>'/; s/return '\x{1F429}', '\/'/return '${ICON}', '\/'/" \
  internal/ui/prompt.go
grep -q "${ICON}" internal/ui/prompt.go || { echo "patch did not apply, upstream may have moved the icons"; exit 1; }

go build -trimpath \
  -ldflags "-s -w -X github.com/derailed/k9s/cmd.version=${VERSION} -X github.com/derailed/k9s/cmd.commit=custom-prompt" \
  -o k9s .

mkdir -p "${DEST}"
install -m 0755 k9s "${DEST}/k9s"
echo "installed ${DEST}/k9s"
"${DEST}/k9s" version --short
