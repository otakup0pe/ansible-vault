{% if vault_backend == "s3" %}
storage "s3" {
  bucket = "{{vault_bucket}}"
  access_key = "{{vault_aws_key}}"
  secret_key = "{{vault_aws_secret}}"
  region = "{{vault_aws_region}}"
}
{% elif vault_backend == "memory" %}
storage "inmem" {}
{% elif vault_backend == "file" %}
storage "file" {
{% if vault_backend == "docker" %}
  path = "/vault/backend"
{% else %}
  path = "{{vault_backend_path}}"
{% endif %}
}
{% endif %}
disable_mlock = {{vault_disable_mlock|lower}}
listener "tcp" {
  address = "{{vault_bind_ip}}:{{vault_port}}"
{% if vault_backend == "docker" %}
  tls_cert_file = "/vault/config/server.crt"
  tls_key_file = "/vault/config/server.key"
{% else %}
  tls_cert_file = "{{vault_config_path}}/server.crt"
  tls_key_file = "{{vault_config_path}}/server.key"
{% endif %}  
}
