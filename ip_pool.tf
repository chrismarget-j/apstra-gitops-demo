resource "apstra_ipv4_pool" "test" {
  name = "test"
  subnets = [
    {
      network = "192.168.1.0/24"
    }
  ]
}