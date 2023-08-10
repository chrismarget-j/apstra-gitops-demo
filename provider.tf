terraform {
  required_providers {
    apstra = {
      source  = "Juniper/apstra"
      version = "0.27.0"
    }
  }
  backend "s3" {
    bucket = "inform-demo"
    key    = "inform-demo/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "apstra" {
  tls_validation_disabled = true
  blueprint_mutex_enabled = false
}
