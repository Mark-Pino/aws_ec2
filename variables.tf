variable "aws_access_key_id" {
  type        = string
  description = "Access Key de AWS"
}

variable "aws_secret_access_key" {
  type        = string
  description = "Secret Key de AWS"
}

variable "aws_region" {
  type        = string
  description = "Región de AWS"
}

variable "bucket_name" {
  type        = string
  description = "Nombre del bucket S3"
}

variable "ami_id" {
  type        = string
  description = "AMI para EC2"
}

variable "instance_type" {
  type        = string
  description = "Tipo de instancia EC2"
}

variable "key_name" {
  type        = string
  description = "Nombre del par de claves EC2"
}

variable "ec2_name" {
  type        = string
  description = "Nombre de la instancia EC2"
}
