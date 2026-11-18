terraform {
  required_providers {
    apstra = {
      source  = "Juniper/apstra"
      version = "0.108.0"
    }
  }
}

provider "apstra" {
  blueprint_mutex_enabled = false
  api_timeout             = 0
  experimental            = true
}
