resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = "ami-03746875d916becc0"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name

  connection {
    user        = "ubuntu"
    private_key = file("~/mykey")
  }

  #Tag입력
  tags = {
    Name = "my92 ${var.V1}"
  #  #Name = "MyInstance${var.V1}"
  #  Name = join("", ["MyInstance", var.V1])
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}
