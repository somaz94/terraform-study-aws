variable "region" {
  description = "The AWS region to create resources in"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.micro"
}

variable "environment" {
  description = "The environment for the infrastructure (e.g., development, staging, production)"
  type        = string
  default     = "development" # Optional: Provide a default value if desired
}

variable "terraform" {
  description = "This resource means that it was created with terraform (e.g., development, staging, production)"
  type        = string
  default     = "true" # Optional: Provide a default value if desired
}

variable "my_public_ip" {
  description = "Your public IP address in CIDR notation (e.g., x.x.x.x/32)"
  type        = string
}

variable "aws_profile" {
  description = "The AWS CLI profile to use for authentication"
  type        = string
  default     = "somaz" # Optional: Provide a default profile name if desired
}

variable "key_pair_name" {
  description = "The name of the key pair to use for the EC2 instance"
  type        = string
}
