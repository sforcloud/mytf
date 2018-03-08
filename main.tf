#provider is aws other possible values can be azure gcp
provider "aws"{
	 access_key = "AKIAI2DQ7AS3GKRGRQNQ"
	 secret_key = "Kiy5XswOmP6Tcm0hhINgiW9VhBEK/dg06lkXQGsN"
  	 region     = "us-east-1"
}

resource "aws_instance" "example" {
	ami	= "ami-97785bed"
	instance_type = "t2.micro"

	tags {
	Name = "example-terraform"
 	}
}
