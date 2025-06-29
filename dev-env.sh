#!/bin/bash

# Usage: ./dev-env.sh start|stop|reload

set -e

MOUNTS=(
  "./pm-auth-api:/mnt/pm-auth-api"
  "./pm-identity-api:/mnt/pm-identity-api"
  "./pm-front:/mnt/pm-front"
  "/tmp/pgdata-auth:/mnt/pgdata-auth"
  "/tmp/pgdata-identity:/mnt/pgdata-identity"
)

ensure_dirs() {
  for d in /tmp/pgdata-auth /tmp/pgdata-identity; do
    if [ ! -d "$d" ]; then
      echo "Creating directory $d"
      mkdir -p "$d"
    fi
  done
}

MOUNT_PIDS=()

start_minikube() {
  echo "Starting Minikube..."
  minikube start --driver=docker
}

start_mounts() {
  ensure_dirs
  echo "Mounting folders..."
  for m in "${MOUNTS[@]}"; do
    minikube mount $m &
    MOUNT_PIDS+=("$!")
    sleep 1
  done
}

stop_mounts() {
  echo "Stopping all minikube mount processes..."
  pkill -f "minikube mount"
}

start_tilt() {
  echo "Starting Tilt..."
  tilt up
}

case "$1" in
  start)
    start_minikube
    start_mounts
    start_tilt
    ;;
  stop)
    echo "Stopping Tilt (if running)..."
    pkill -f "tilt up" || true
    stop_mounts
    minikube stop
    ;;
  reload)
    stop_mounts
    start_mounts
    ;;
  *)
    echo "Usage: $0 start|stop|reload"
    exit 1
    ;;
esac
