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

    frontend = {
      secret = "roboshop-dev"
      value = {
        catalogue_url = "http://catalogue-dev.mydevops.shop:8080/"
        user_url = "http://user-dev.mydevops.shop:8080/"
        cart_url = "http://cart-dev.mydevops.shop:8080/"
        shipping_url = "http://shipping-dev.mydevops.shop:8080/"
        payment_url = "http://payment-dev.mydevops.shop:8080/"
      }
    }

    ssh = {
      secret =  "robsohop-infra"
      value = {
        username = "azuser"
        password = "Giveme123456"
      }
    }
  }
}