variable "region" {
  default = "sa-east-1"
}

variable "user_arn" {
  default ="arn:aws:iam::754464749225:user/luiza.andrade"
}

variable key_spec {
  default = "SYMMETRIC_DEFAULT"
}

variable enabled {
  default = true
}


variable rotation_enabled {
  default = true
}

variable tags {}

variable kms_alias {
    default  = "bee2pay-backend-payments-backend-braspag-lambda_function-devMarketplaceMasterCredential-secret-key"
}

variable policy {}
