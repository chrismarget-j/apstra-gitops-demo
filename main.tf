// the initial fabric construction happens in here
module "fabric" {
  source = "./fabric"
}

// the null resource "disappears", forcing replacement whenever a
// trigger value is changed.
resource "null_resource" "force_redeploy" {
  depends_on = [module.fabric]
  triggers = {
    // replace this resource whenever staging blueprint is revised
    fabric_staging_revision      = module.fabric.staging_revision
    vpn_routing_staging_revision = module.vpn_routing.staging_revision
  }
}

// deploy resource depends on the null resource which vanishes with each new
// blueprint revision. This way the blueprint is redeployed after every change
resource "apstra_blueprint_deployment" "dc_1" {
  blueprint_id = module.fabric.blueprint_id
  comment      = "Deployment by Terraform {{.TerraformVersion}}, Apstra provider {{.ProviderVersion}}, User $USER."
  depends_on   = [module.fabric, module.vpn_routing, null_resource.force_redeploy]
}

module "vpn_routing" {
  source               = "./vpn_routing"
  blueprint_id         = module.fabric.blueprint_id
  routing_zone_id      = module.fabric.routing_zone_id
  vpn_edge_router_ip   = local.vpn_edge_router_ip
  vpn_routing_policies = local.vpn_routing_policies
}