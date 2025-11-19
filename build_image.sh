#!/bin/bash
set -eo pipefail

# Docker Buildx cross-compilation script
# Usage: ./build_image.sh [TAG] [PLATFORM]
# Examples:
#   ./build_image.sh                    # builds latest for linux/amd64
#   ./build_image.sh v1.0.0             # builds v1.0.0 for linux/amd64
#   ./build_image.sh latest linux/arm64 # builds latest for linux/arm64

IMAGE_NAME="gcr.io/the-helper-bees/httping"
TAG="${1:-latest}"
PLATFORM="${2:-linux/amd64}"

docker buildx create --name multiarch-builder --driver docker-container --use 2>/dev/null || docker buildx use multiarch-builder

docker buildx build \
    --platform "${PLATFORM}" \
    --tag "${IMAGE_NAME}:${TAG}" \
    --push \
    .
