backend "s3" {
  bucket = "{{vault_bucket}}"
  access_key = "{{vault_aws_key}}"
  secret_key = "{{vault_aws_secret}}"
  region = "{{vault_aws_region}}"
}

listener "tcp" {
  address = "0.0.0.0:{{vault_port}}"
{% if vault_type == "docker" %}
  tls_cert_file = "/vault/config/server.crt"
  tls_key_file = "/vault/config/server.key"
{% else %}
  tls_cert_file = "{{vault_cert_path|default(vault_default_cert_path)}}"
  tls_key_file = "{{vault_key_path|default(vault_default_key_path)}}"
{% endif %}
}

log_level = "{{ vault_log_level|capitalize }}"
