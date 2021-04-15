job "some_job" {
  # required: datacenters 
  datacenters = ["dc1"]
  group "some group" {
    task "some task" {
      driver = "raw_exec"
      config {
        command = "date"
	args = ["--iso-8601=ns"]
      }
    }
  }
}
