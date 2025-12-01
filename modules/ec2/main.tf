resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  user_data = <<-EOF
#!/bin/bash
# Update system
sudo apt update -y

# Install Docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu

# # Create a sample Dockerfile
sudo docker pull farhajqureshi81/eminence-tally_backend:latest
# sudo docker rm -f eminence-tally_backend || true
# 
# 

# # Build Docker image
# # Run Docker container
sudo docker run -d -p 5000:80 --name application_backend farhajqureshi81/eminence-tally_backend:latest
EOF

  tags = {
    Name = var.ec2_name
  }
}
