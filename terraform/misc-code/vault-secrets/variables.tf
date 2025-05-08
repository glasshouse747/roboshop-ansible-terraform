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
        REDIS_HOST      = "redis-dev.mydevops.shop"
        CATALOGUE_HOST  = "catalogue-dev.mydevops.shop"
        CATALOGUE_PORT  = 8080
        }
      }

    catalogue = {
      secret = "roboshop-dev"
      value  = {
        MONGO       = "true"
        MONGO_URL   = "mongodb://mongodb-dev.mydevops.shop:27017/catalogue"
        DB_TYPE     = "mongo"
        APP_GIT_URL = "https://github.com/roboshop-devops-project-v3/catalogue"
        DB_HOST     = "mongodb://mongodb-dev.mydevops.shop"
        SCHEMA_FILE = "db/master-data.js"
      }
    }

    # dispatch = {
    #   secret = "roboshop-dev"
    #   value  = {
    #     AMQP_HOST="rabbitmq-dev.mydevops.shop"
    #     AMQP_USER="roboshop"
    #     AMQP_PASS="roboshop123"
    #   }
    # }

    frontend = {
      secret = "roboshop-dev"
      value = {
        catalogue_url   = "http://catalogue-dev.mydevops.shop:8080/"
        user_url        = "http://user-dev.mydevops.shop:8080/"
        cart_url        = "http://cart-dev.mydevops.shop:8080/"
        shipping_url    = "http://shipping-dev.mydevops.shop:8080/"
        payment_url     = "http://payment-dev.mydevops.shop:8080/"
        CATALOGUE_PORT  = 8080
        USER_HOST       = "user-dev.mydevops.shop:8080"
        USER_PORT       = 8080
        CART_HOST       = "cart-dev.mydevops.shop:8080"
        CART_PORT       = 8080
        SHIPPING_HOST   = "shipping-dev.mydevops.shop:8080"
        SHIPPING_PORT   = 8080
        PAYMENT_HOST    = "payment-dev.mydevops.shop:8080"
        PAYMENT_PORT    = 8080


      }
    }

    mongodb = {
      secret = "roboshop-dev"
      value  = {
        MONGO     = "true"
        MONGO_URL = "mongodb://mongodb-dev.mydevops.shop:27017/catalogue"

      }
    }

    mysql = {
      secret = "roboshop-dev"
      value  = {
        username  = "root"
        password  = "RoboShop@1"


      }
    }

    payment = {
      secret = "roboshop-dev"
      value  = {
        CART_HOST   = "cart-dev.mydevops.shop"
        CART_PORT   = 8080
        USER_HOST   = "user-dev.mydevops.shop"
        USER_PORT   = 8080
        AMQP_HOST   = "rabbitmq-dev.mydevops.shop"
        AMQP_USER   = "roboshop"
        AMQP_PASS   = "roboshop123"
      }
    }

    rabbitmq = {
      secret = "roboshop-dev"
      value  = {
        username  = "roboshop"
        password  = "roboshop123"


      }
    }

    shipping = {
      secret = "roboshop-dev"
      value  = {
        CART_ENDPOINT  = "cart-dev.mydevops.shop:8080"
        DB_HOST        = "mysql-dev.mydevops.shop"
        username       = "root"
        password       = "RoboShop@1"
        DB_USER        = "root"
        DB_PASS        = "RoboShop@1"
        DB_TYPE        = "mysql"
        APP_GIT_URL    = "https://github.com/roboshop-devops-project-v3/shipping"
      }
    }

    user = {
      secret = "roboshop-dev"
      value  = {
        MONGO       = "true"
        REDIS_URL   = "redis://redis-dev.mydevops.shop:6379"
        MONGO_URL   = "mongodb://mongodb-dev.mydevops.shop:27017/users"
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