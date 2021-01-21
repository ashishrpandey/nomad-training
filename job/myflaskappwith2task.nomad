# This declares a job named "docs". There can be exactly one
# job declaration per job file.
job "flaskappwithredis" {
  # Specify this job should run in the region named "us". Regions
  # are defined by the Nomad servers' configuration.
  #region = "us"

  # Spread the tasks in this job between us-west-1 and us-east-1.
  datacenters = ["dc1"]

  # Run this job as a "service" type. Each job type has different
  # properties. See the documentation below for more examples.
  type = "service"

  # Specify this job to have rolling updates, one-at-a-time, with
  # 10 second intervals.
  update {
    stagger      = "10s"
    max_parallel = 1
  }

  # A group defines a series of tasks that should be co-located
  # on the same client (host). All tasks within a group will be
  # placed on the same host.
  group "webs" {
    # Specify the number of these tasks we want.
    count = 1
        network {

          # This requests a dynamic port named "http".
          port "http" {
               to  = 80
		}
          port "redisport" {
               to  = 6379
		}
        }

    # Create an individual task (unit of work). This particular
    # task utilizes a Docker container to front a web application.
    task "frontend" {
      # Specify the driver to be "docker". Nomad supports
      # multiple drivers.
      driver = "docker"

      # Configuration is specific to each driver.
      config {
        image = "ashishrpandey/myflaskapp:v1"
        ports = ["http"]

      }

      # The service block tells Nomad how to register this service
      # with Consul for service discovery and monitoring.
      service {
        # This tells Consul to monitor the service on the port
        # labelled "http". Since Nomad allocates high dynamic port
        # numbers, we use labels to refer to them.
        #port = "http"


       # check {
       #   type     = "http"
       #   path     = "/index.html"
       #   interval = "10s"
       #   timeout  = "2s"
       # }
      }

      # It is possible to set environment variables which will be
      # available to the task when it runs.
      env {
        DB_USER = "web"
        DB_PASS = "loremipsum"
      }

      # Specify the maximum resources required to run the task,
      # include CPU, memory, and bandwidth.
      resources {
        cpu    = 100 # MHz
        memory = 32 # MB

      }
    }
    task "backend" {
      # Specify the driver to be "docker". Nomad supports
      # multiple drivers.
      driver = "docker"

      # Configuration is specific to each driver.
      config {
        image = "redis"
        ports = ["redisport"]

      }

      # The service block tells Nomad how to register this service
      # with Consul for service discovery and monitoring.
      service {
        # This tells Consul to monitor the service on the port
        # labelled "http". Since Nomad allocates high dynamic port
        # numbers, we use labels to refer to them.
        # port = "http"

       # check {
       #   type     = "http"
       #   path     = "/index.html"
       #   interval = "10s"
       #   timeout  = "2s"
       # }
      }

      # It is possible to set environment variables which will be
      # available to the task when it runs.
      env {
        DB_USER = "web"
        DB_PASS = "loremipsum"
      }

      # Specify the maximum resources required to run the task,
      # include CPU, memory, and bandwidth.
      resources {
        cpu    = 100 # MHz
        memory = 32 # MB

      }
    }
  }
}
