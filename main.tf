#provider is aws other possible values can be azure gcp
provider "aws"{
  	 region     = "us-east-1"
}

resource "aws_instance" "example" {
	ami	= "ami-97785bed"
	instance_type = "t2.micro"

	tags {
	Name = "example-terraform"
 	}
}
