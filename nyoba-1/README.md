# Server Monitoring Setup with Prometheus, Grafana, and Docker

This setup involves two servers:

- **Server 1 (Gateway)**: Hosts NGINX, Prometheus, and Grafana for system monitoring and dashboard visualization.
- **Server 2 (Service)**: Hosts services and Prometheus Node Exporter for monitoring server metrics.

### Technologies Used:
- **Docker**: For containerizing services.
- **Prometheus**: For metrics collection and monitoring.
- **Grafana**: For visualizing and analyzing metrics.
- **NGINX Exporter**: For monitoring NGINX performance.
- **Node Exporter**: For monitoring system metrics on backend servers.
- **Ansible**: For automating setup and configuration.

---

## Setup Overview

1. **Server 1 (Gateway)**:
   - **NGINX Exporter**: Exposes metrics from NGINX.
   - **Prometheus**: Collects metrics from both NGINX and the backend server.
   - **Grafana**: Visualizes collected metrics and provides a central monitoring dashboard.

2. **Server 2 (Backend)**:
   - **Node Exporter**: Exposes system metrics like CPU, memory, disk, etc.

---

## Prerequisites

- Docker and Docker Compose installed on both servers.
- Ansible for automating the setup.
- Terraform (optional) for provisioning infrastructure.

---

## Directory Structure

```
.
├── ansible
│   ├── inventory.ini        # Ansible inventory file
│   ├── server1.yml          # Ansible playbook for Server 1 (Gateway)
│   └── server2.yml          # Ansible playbook for Server 2 (Backend)
├── server1
│   └── docker-compose.yml   # Docker Compose file for Server 1 (Gateway)
├── server2
|   └── docker-compose.yml   # Docker Compose file for Server 2 (Backend)
```

---

## Getting Started

### Step 1: Clone the Repository

Clone the repository to your local machine or server:

```bash
git clone <repository_url>
cd <repository_folder>
```

---

### Step 2: Configure Ansible Inventory

Edit the `inventory.ini` file with the IP addresses and SSH user credentials for your servers.

```ini
[gateway]
server1 ansible_host=<server1-ip> ansible_user=<user>

[backend]
server2 ansible_host=<server2-ip> ansible_user=<user>
```

---

### Step 3: Install Dependencies

#### **On both servers:**

Install **Docker** and **Docker Compose** if they are not already installed.

```bash
sudo apt-get update
sudo apt-get install docker.io docker-compose -y
```

---

### Step 4: Set Up the Servers Using Ansible

Run the Ansible playbooks to automatically set up Docker and services on both servers.

```bash
ansible-playbook -i inventory.ini ansible/server1.yml
ansible-playbook -i inventory.ini ansible/server2.yml
```

This will:
- Install Docker and Docker Compose.
- Deploy Prometheus, NGINX Exporter, and Grafana on Server 1.
- Deploy Prometheus and Node Exporter on Server 2.

---


### Step 5: Access Grafana Dashboard

Once the services are up, you can access the Grafana dashboard via `http://<server1-ip>:3000`. Login with the default credentials:

- **Username**: admin
- **Password**: admin

You can now visualize the metrics from both NGINX and the backend server on a centralized dashboard.

---

## Configuring Alerts

You can set up alerts in Grafana or use tools like **PagerDuty** for notification. For more information on how to configure alerts in Grafana, refer to the official Grafana documentation [here](https://grafana.com/docs/grafana/latest/alerting/).

---

## Customization

- **Prometheus Configuration**: You can modify the `prometheus.yml` file to customize scrape targets and other configurations.
- **Grafana Dashboards**: You can import pre-built dashboards or create your own in the Grafana UI.

---

## Clean Up

To stop the services and remove containers, you can run the following:

```bash
docker-compose down
```

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- [Prometheus](https://prometheus.io/)
- [Grafana](https://grafana.com/)
- [NGINX Prometheus Exporter](https://github.com/nginxinc/nginx-prometheus-exporter)
- [Node Exporter](https://github.com/prometheus/node_exporter)
- [Ansible](https://www.ansible.com/)
