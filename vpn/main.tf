module "vpn_routing" {
  source               = "../_modules/vpn_routing"
  blueprint_id         = data.terraform_remote_state.fabric.outputs.blueprint_id
  routing_zone_id      = data.terraform_remote_state.fabric.outputs.routing_zone_id
  vpn_edge_router_ip   = local.vpn_edge_router_ip
  vpn_routing_policies = local.vpn_routing_policies
}
