#provider is aws other possible values can be azure gcp
provider "aws"{
  	 region     = "us-east-1"
}

resource "aws_instance" "example" {
	ami	= "ami-40d28157"
	instance_type = "t2.micro"
	vpc_security_group_ids = ["${aws_security_group.instance_sg.id}"]
	user_data = <<-EOF
		    #!/bin/bash
		    echo "Hello, Shiva" > index.hrml
		    nohup busybox httpd -f -p 8080 &
		EOF

	tags {
	Name = "example-terraform"
 	}
}

resource "aws_security_group" "instance_sg" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
	value = "${aws_instance.example.public_ip}"
}

