disable_cache = true
disable_mlock = true

ui = true

listener "tcp" {
  address 	= "127.0.0.1:8200"
  tls_disable = 1
}

storage "consul" {
  address = "127.0.0.1:8500"
  path    = "vault/"
  disable_registration = "true"
}

cluster_name = "labs-vault"