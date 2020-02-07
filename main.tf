provider "aws" {
  region  = "us-east-2"
  version = "~> 2.47"
}

resource "aws_elb" "ofe-elb1" {
  name = "Terraform_balancer1"
  availability_zones = ["us-east-2a", "us-east-2b"]
  security_groups = ["sg-066802a095641abb3", "sg-151d0576"]
  listener {
    lb_port           = 8080
    instance_port     = 8080
    lb_protocol       = "http"
    instance_protocol = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags = {
    Name = "ofe-elb1"
  }
}
