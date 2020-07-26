name      = "server2"
data_dir  = "/opt/nomad/server2/data"
log_level = "DEBUG"

server {
  server_join {
    retry_join = [ "192.168.1.11", "192.168.1.12", "192.168.1.13" ]
    retry_interval = "5s"
  }
  enabled = true
}

tls {
  http = true
  rpc  = true

  ca_file   = "/etc/nomad.d/tls/nomad-agent-ca.pem"
  cert_file = "/etc/nomad.d/tls/global-server-nomad-0.pem"
  key_file  = "/etc/nomad.d/tls/global-server-nomad-0-key.pem"

  verify_server_hostname = true
  verify_https_client    = true
}
