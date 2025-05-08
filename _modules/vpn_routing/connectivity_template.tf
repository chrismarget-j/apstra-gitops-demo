resource "apstra_datacenter_connectivity_template_interface" "vpn" {
  blueprint_id = var.blueprint_id
  name         = "IP+BGP handoff to VPN block"
  description  = "includes routing policies for [${join(", ", [for k, v in apstra_datacenter_routing_policy.vpn : k])}]"
  tags = [
    "test",
    "terraform",
  ]
  ip_links = {
    "IP handoff to VPN router" = {
      routing_zone_id      = var.routing_zone_id
      ipv4_addressing_type = "numbered"
      ipv6_addressing_type = "none"
      bgp_peering_ip_endpoints = {
        "BGP peering with VPN router" = {
          bfd_enabled  = false
          ipv4_address = var.vpn_edge_router_ip
          routing_policies = {
            for k, v in apstra_datacenter_routing_policy.vpn : k => {
              routing_policy_id = v.id
            }
          }
        }
      }
    }
  }
}
