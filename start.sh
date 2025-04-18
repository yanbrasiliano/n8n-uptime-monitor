#!/bin/bash

echo "🔧 Fixing permissions for ./data..."
sudo chown -R 1000:1000 ./data

echo "🐳 Starting n8n with Docker Compose..."
docker compose up -d

echo "✅ n8n is running at: http://localhost:6060"
