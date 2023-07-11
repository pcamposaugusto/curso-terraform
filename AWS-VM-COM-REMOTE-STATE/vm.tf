resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
  # colocar o comando abaixo no terminal para gerar as chaves localmente:
  # ssh-keygen -f aws-key
}

resource "aws_instance" "vm" {
  ami                         = "ami-053b0d53c279acc90"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group]
  associate_public_ip_address = true

  tags = {
    "Name" = "vm-terraform"
  }
}