terraform {
  required_providers {
    apstra = {
      source  = "Juniper/apstra"
      version = "0.27.1"
    }
  }
}

provider "apstra" {
  url                     = "https://admin@18.181.146.179:28859"
  tls_validation_disabled = true
  blueprint_mutex_enabled = false
  api_timeout             = 0
}
