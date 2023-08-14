module "vpn_routing" {
  source               = "../_modules/vpn_routing"
  blueprint_id         = data.terraform_remote_state.fabric.outputs.blueprint_id
  routing_zone_id      = data.terraform_remote_state.fabric.outputs.routing_zone_id
  vpn_edge_router_ip   = local.vpn_edge_router_ip
  vpn_routing_policies = local.vpn_routing_policies
}

resource "null_resource" "force_redeploy" {
  depends_on = [module.vpn_routing]
  triggers   = { fabric_staging_revision = module.vpn_routing.staging_revision }
}

resource "apstra_blueprint_deployment" "dc_1" {
  blueprint_id = data.terraform_remote_state.fabric.outputs.blueprint_id
  comment      = "$COMMENT"
  depends_on   = [null_resource.force_redeploy]
}
