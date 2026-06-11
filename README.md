---

```markdown
# Fleet of Drones: Event-Driven Simulation Platform

A distributed, high-throughput simulation platform designed to model real-time autonomous delivery drone fleet operations. This project simulates real-world flight telemetry ingestion, dynamic order dispatching, and analytical data pipelines under varying environmental and traffic conditions (e.g., weather modifiers, high-load scenarios).

## Architecture Overview

The system is designed around an event-driven architecture utilizing microservices orchestrated in a Cloud-Native environment:

1. **Traffic Generator (Python):** Simulates real-time user demand, adjusting order frequency based on virtual variables such as holidays, peak hours, and weather conditions (e.g., rain increasing battery consumption).
2. **Dispatcher API (Go / Gin):** Acts as the entry point for orders. Persists transaction states into PostgreSQL using `sqlc` for compile-time safe queries and publishes tasks to Apache Kafka.
3. **Drone Core (Go / Kubernetes):** Independent microservices scaled dynamically within a Kubernetes cluster. Drones consume orders from Kafka, simulate 3D flight paths uniformly, and continuously stream state telemetry.
4. **Data Pipeline (PySpark):** Ingests high-frequency telemetry streams from Kafka in real time, batching and processing spatial-temporal logs for long-term analytics and ML model training.
5. **Dashboard UI (React):** Connects to the system via WebSockets to visualize real-time tracking, drone statuses, and key operational metrics.

## Tech Stack

- **Backend Services:** Golang (Gin, sqlc), Python
- **Data Streaming & Processing:** Apache Kafka, PySpark
- **Storage:** PostgreSQL (OLTP)
- **Infrastructure & Orchestration:** Kubernetes (Minikube), Docker
- **Frontend UI:** React, TypeScript, WebSockets

## Repository Structure

```text
├── apps/
│   ├── dispatcher-api/    # Go REST API for order ingestion & database management
│   ├── drone-agent/       # Go microservice executing simulation & telemetry streaming
│   ├── traffic-generator/ # Python script simulating system load and weather factors
│   └── dashboard-ui/      # React monitoring frontend
├── db/
│   ├── schema.sql         # PostgreSQL database layout
│   └── query.sql          # SQL queries compiled by sqlc
├── k8s-infra/             # Kubernetes manifests for local infrastructure deployment
│   ├── kafka.yaml
│   └── postgres.yaml
└── sqlc.yaml              # sqlc configuration file

```

## Getting Started

### Prerequisites

* Go 1.22+
* Docker & Docker Compose (or Minikube)
* kubectl
* sqlc

### Local Deployment (Kubernetes)

1. **Start your local cluster:**
```bash
minikube start

```


2. **Deploy infrastructure components:**
```bash
kubectl apply -f k8s-infra/postgres.yaml
kubectl apply -f k8s-infra/kafka.yaml

```


3. **Expose services to your local machine:**
```bash
# Terminal 1: PostgreSQL
kubectl port-forward svc/postgres-service 5432:5432

# Terminal 2: Apache Kafka
kubectl port-forward svc/kafka-service 9092:9092

```


4. **Initialize database schema & compile Go queries:**
```bash
# Run migrations on your local instance, then generate boilerplate via sqlc
sqlc generate

```


5. **Run the Dispatcher Service:**
```bash
cd apps/dispatcher-api
go run main.go

```



## Simulation Metrics Captured

The platform captures and aggregates multi-dimensional datasets through its streaming pipeline to evaluate delivery efficiency:

* Flight distance vs. actual delivery time.
* Battery degradation models influenced by wind/rain variables.
* Dispatch queue latency during unexpected traffic spikes.

```

```
