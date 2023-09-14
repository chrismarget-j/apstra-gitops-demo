locals {
  vpn_routing_policies = {
    Vendor_A = {
      import = ["172.16.0.0/24"]
      export = ["10.5.16.0/24", "10.5.18.0/24"]
    }
    Vendor_B = {
      import = ["172.17.0.0/24", "172.17.2.0/24", "172.17.4.0/24", "172.17.6.0/24", "172.17.8.0/24", "172.17.10.0/24", "172.17.12.0/24", "172.17.14.0/24", "172.17.17.0/24", "172.17.18.0/24"]
      export = ["10.5.16.0/24"]
    }
    Vendor_C = {
      import = ["172.18.0.0/24", "172.18.3.0/24", "172.18.5.0/24"]
      export = ["10.5.16.0/24", "10.5.20.0/22"]
    }
#    Vendor_D = {
#      import = ["172.19.0.0/24"]
#      export = ["10.5.0.0/24", "10.5.7.0/24", "10.5.32.0/22"]
#    }
  }
}
