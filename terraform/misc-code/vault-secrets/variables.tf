variable "token" {}

variable "secrets" {
  default = {
    roboshop-dev = {
      description = "RoboShop App Component All secrets"
    }
    robsohop-infra = {
      description = "Roboshop infra related secrets"
    }
  }
}

variable "values" {
  default = {
    cart ={
      secret = "roboshop-dev"
      value  = {
                zip = "zap",
                foo = "bar"
        }
      }
    ssh = {
      secret =  "roboshop-infra"
      value = {
        username = "azuser"
        password = "Giveme123456"
      }
    }
  }
}