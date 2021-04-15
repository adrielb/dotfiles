# common configuration
datacenter = "dc1"
data_dir = "/home/abergman/nomad"

# log_level = "DEBUG"

plugin "raw_exec" {
  config {
    enabled = true
  }
}
