job "mysql-server" {
  datacenters = ["dc1"]
  type        = "service"

  group "mysql-server" {
    count = 1

    volume "mysql" {
      type      = "host"
      read_only = false
      source    = "mysql"
    }

    restart {
      attempts = 10
      interval = "5m"
      delay    = "25s"
      mode     = "delay"
    }

        network {
          port "db" {
            static = 3306
          }
        }
    task "mysql-server" {
      driver = "docker"

      volume_mount {
        volume      = "mysql"
        destination = "/var/lib/mysql"
        read_only   = false
      }

      env  {
        MYSQL_ROOT_PASSWORD = "password"
      }

      config {
        image = "hashicorp/mysql-portworx-demo:latest"

        ports  = ["db"]
      }

      resources {
         cpu    = 200 # MHz
        memory =  500 # MB


      }

      #service {
      #  name = "mysql-server"
      #  port = "db"

       # check {
       #   type     = "tcp"
       #   interval = "10s"
       #   timeout  = "2s"
       # }
      #}
    }
  }
}
