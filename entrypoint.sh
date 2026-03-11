#!/bin/bash
set -e

# Remove um possível server.pid que impede o Rails de arrancar
rm -f /app/tmp/pids/server.pid

# Executa o comando principal (o que estiver no CMD do Dockerfile ou Compose)
exec "$@"
