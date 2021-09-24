resource "aws_instance" "web" {
    count = "1"
  ami           = "ami-04bf6dcdc9ab498ca"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.deployer.key_name}"
}