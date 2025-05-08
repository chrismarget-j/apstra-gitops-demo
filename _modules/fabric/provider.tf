terraform {
  required_providers {
    apstra = {
      source  = "Juniper/apstra"
      version = "0.86.0"
    }
  }
}

provider "apstra" {
  blueprint_mutex_enabled = false
  api_timeout             = 0
  experimental            = true
}
