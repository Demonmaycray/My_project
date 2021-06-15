provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "Web-server" {
    ami                    = "ami-00399ec92321828f5"
    instance_type          = "t2.micro"
    key_name               = "Web-server"
    vpc_security_group_ids = [aws_security_group.Web-server.id]
    user_data              = <<EOF
#!/bin/bush
sudo apt update
sudo apt install apache2
sudo ufw allow 'Apache'
sudo systemctl status apache2
    EOF

    tags = {
       Name  = "Web_server"
       owner = "Korchovyi" 
    }
}

resource "aws_instance" "Jenkins" {
    ami                    = "ami-00399ec92321828f5"
    instance_type          = "t2.micro"
    key_name               = "Jenkins"
    vpc_security_group_ids = [aws_security_group.Jenkins.id]    

    tags = {
       Name  = "Jenkins"
       owner = "Korchovyi" 
    }  
}

resource "aws_security_group" "Web-server" {
  name = "web-server-security"

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        from_port        = 8080
        to_port          = 8080
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

      tags = {
       Name  = "Web_server"
       owner = "Korchovyi" 
    } 
}

resource "aws_security_group" "Jenkins" {
  name = "jenkins-security"

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        from_port        = 8080
        to_port          = 8080
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

      tags = {
       Name  = "Jenkins"
       owner = "Korchovyi" 
    }  
      
}