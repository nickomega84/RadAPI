# RadAPI ☢️ - Industrial IoT Telemetry System

A high-concurrency, asynchronous REST API designed to process telemetry data from industrial and nuclear sensors. Built to handle rapid data ingestion without blocking the main web thread.

## 🏗️ Architecture & Stack
* **Backend:** Ruby on Rails (API Only)
* **Database:** PostgreSQL
* **Queue / Cache:** Redis
* **Background Processing:** Sidekiq
* **Infrastructure:** 100% Dockerized (Multi-container orchestration)

## ⚡ Core Features
* **Asynchronous Processing:** Telemetry payloads are instantly enqueued in Redis and processed by Sidekiq workers in the background.
* **Safety Threshold Alerts:** Background jobs evaluate sensor data in real-time and trigger critical alerts if thresholds are breached.
* **Data Integrity:** Strict Active Record validations for industrial facilities and sensor metrics.

## 🚀 Quick Start (Docker)

1. Clone the repository
2. Build and spin up the microservices:
   ```bash
   docker compose up --build
   ```
3. In a new terminal, setup the database (creates, migrates, and seeds test reactors):
   ```bash
   docker compose exec web rails db:setup
   ```
4. Test the async pipeline:
   ```bash
   curl -X POST http://localhost:3000/api/v1/telemetry \
   -H "Content-Type: application/json" \
   -d '{"telemetry": {"serial_number": "RAD-X-99", "value": 0.080}}'
   ```
   *Watch the Sidekiq container logs for the real-time threshold alert!*