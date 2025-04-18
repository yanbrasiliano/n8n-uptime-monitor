# 📡 API Uptime Monitor with n8n

This project is a simple and practical use case to learn and showcase automation using [n8n](https://n8n.io/).</br>
It sets up a workflow to monitor the availability of a public API and prepares it for future improvements like logging and notifications.

## 🎯 Goal

Periodically check the status of an external API (`https://jsonplaceholder.typicode.com/posts`) and apply conditional logic based on the response, using only native n8n nodes.

## 🧱 Stack

-   [n8n](https://n8n.io/) (self-hosted via Docker)
-   Docker Compose

## ⚙️ Features

-   Cron-based API polling every 5 minutes
-   HTTP Request node to check endpoint status
-   IF node to filter or branch logic
-   Fully local setup using Docker
-   No third-party dependencies (email, Slack, DB, etc.)

## 🚀 How to Run

```bash
git clone https://github.com/your-user/n8n-uptime-monitor.git
cd n8n-uptime-monitor
docker-compose up -d
```

Then open your browser:

```
http://localhost:6060
```

Login:

-   **Username**: `admin`
-   **Password**: `admin123`

## 🐳 Docker Configuration

Docker Compose sets up n8n with:

-   Basic auth enabled
-   Port 6060
-   Timezone set to `America/Bahia`
-   Volume for persistent workflow storage

You can customize the variables in the `.env` file.

---

## 🛠 Permission Issue (Linux)

If you're running on Linux and see this error:

```bash
EACCES: permission denied, open '/home/node/.n8n/config'
```

Run this once to fix it:

```bash
sudo chown -R 1000:1000 ./data
```

This gives the internal container user (`node`, UID 1000) permission to write to the mounted volume.

---

## 📂 Project Structure

```
n8n-uptime-monitor/
├── docker-compose.yml
├── README.md
└── data/                    ← Workflow data (volume)
└── api-uptime-monitor.json  ← n8n workflow
```

---

## 🧠 How It Works

Workflow consists of:

1. `Schedule Trigger`: runs every 5 minutes
2. `HTTP Request`: calls the external API
3. `IF`: filters the response (e.g. `id === 1`)
4. Output: can be extended to logging, notifications or saving data

---

## 📈 Ideas to Improve

-   Use `Set` node to prepare logs
-   Add `Function` node to summarize response stats
-   Store results in a Google Sheet or local database
-   Add Slack/Telegram/Webhook notification
-   Export execution logs for uptime analysis

---

## 📌 Notes

-   This project is meant to **demonstrate** how n8n can be used as an automation orchestrator.
-   It avoids external integrations intentionally to keep the setup clean and focused.
-   Next evolution steps are optional and can be done incrementally.
