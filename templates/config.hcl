backend "s3" {
  bucket = "{{vault_bucket}}"
  access_key = "{{vault_aws_key}}"
  secret_key = "{{vault_aws_secret}}"
  region = "{{vault_aws_region}}"
}
disable_mlock = {{vault_disable_mlock|lower}}
listener "tcp" {
  address = "0.0.0.0:{{vault_port}}"
  tls_cert_file = "/vault/config/server.crt"
  tls_key_file = "/vault/config/server.key"
}
