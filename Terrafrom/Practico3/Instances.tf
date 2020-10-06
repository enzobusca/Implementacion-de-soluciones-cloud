resource "aws_instance" "terraform-practico3-instance" {
  ami           = "ami-0817d428a6fb68645"
  instance_type = "t2.micro"
  key_name      = "practico-3"
  vpc_security_group_ids = [aws_security_group.practico-3.id,
  ]
  subnet_id = aws_subnet.practico3-private-subnet.id
  tags = {
    Name = "terraform-practico3-instance"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:\\Users/Enzo Festorazzi/Desktop/practico-3.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y ca-certificates wget",
      "wget https://get.glennr.nl/unifi/install/unifi-5.13.32.sh",
    ]
    on_failure = continue
  }
}