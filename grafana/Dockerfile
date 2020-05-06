FROM grafana/grafana:latest

COPY dashboards.yml /etc/grafana/provisioning/dashboards/rabbitmq.yaml
COPY datasources.yml /etc/grafana/provisioning/datasources/prometheus.yaml
ADD dashboards /dashboards

# ENTRYPOINT []