#!/bin/bash
# Assemble the demo payload into a release tarball with a checksum, and refresh manifest.json.
#
#   ./build-payload.sh 1.0.0
#
# The tarball unpacks to a single "payload/" directory whose contents are what the 3D-DSS
# seeder expects at EXAMPLE_DATA_DIR. The checksum is the point of the exercise: the
# installer verifies it before unpacking, so a truncated download or a substituted file
# fails loudly instead of quietly seeding a broken project.
set -euo pipefail

VERSION="${1:-}"
if [ -z "$VERSION" ]; then
    echo "Usage: $0 <version>      e.g. $0 1.0.0" >&2
    exit 1
fi

cd "$(dirname "$0")"

if [ ! -d payload ]; then
    echo "Error: no payload/ directory here." >&2
    exit 1
fi

mkdir -p dist
TARBALL="dist/3d-dss-demo-${VERSION}.tar.gz"

# --sort=name and a fixed mtime make the tarball reproducible: the same payload must
# produce the same checksum, or the checksum proves nothing about the contents.
echo "Building ${TARBALL} ..."
tar --sort=name \
    --mtime='2026-01-01 00:00:00Z' \
    --owner=0 --group=0 --numeric-owner \
    -czf "$TARBALL" payload

sha256sum "$TARBALL" | awk '{print $1}' > "${TARBALL}.sha256"
SHA=$(cat "${TARBALL}.sha256")
SIZE=$(wc -c < "$TARBALL" | tr -d ' ')

echo "Refreshing manifest.json ..."
{
    printf '{\n'
    printf '  "name": "3d-dss-demo",\n'
    printf '  "version": "%s",\n' "$VERSION"
    printf '  "description": "Innertkirchen-Mettlen example project for the 3D-DSS",\n'
    printf '  "layout": "EXAMPLE_DATA_DIR",\n'
    printf '  "tarball": {\n'
    printf '    "file": "3d-dss-demo-%s.tar.gz",\n' "$VERSION"
    printf '    "bytes": %s,\n' "$SIZE"
    printf '    "sha256": "%s"\n' "$SHA"
    printf '  },\n'
    printf '  "files": [\n'
    first=1
    while read -r f; do
        h=$(sha256sum "$f" | awk '{print $1}')
        b=$(wc -c < "$f" | tr -d ' ')
        [ $first -eq 1 ] || printf ',\n'
        first=0
        printf '    { "path": "%s", "bytes": %s, "sha256": "%s" }' "${f#payload/}" "$b" "$h"
    done < <(find payload -type f | sort)
    printf '\n  ]\n'
    printf '}\n'
} > manifest.json

echo ""
echo "  tarball : $TARBALL  (${SIZE} bytes)"
echo "  sha256  : $SHA"
echo "  files   : $(find payload -type f | wc -l | tr -d ' ')"
echo ""
echo "Attach BOTH the tarball and its .sha256 to the GitHub release for v${VERSION},"
echo "and commit the refreshed manifest.json."
