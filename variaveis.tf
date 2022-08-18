
variable "region" {
  default = "sa-east-1"
}

variable "user_arn" {
  default ="arn:aws:iam::*luiza.andrade"
}

variable key_spec {
  default = "SYMMETRIC_DEFAULT"
}

variable enabled {
  default = true
}

output "key_id" {
  value = aws_kms_key.braspag-key.key_id
}

output "key_arn" {
  value = aws_kms_key.braspag-key.arn
}

