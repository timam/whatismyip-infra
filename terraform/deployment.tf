module "api" {
  source    = "../tf-modules/deployment"
  env       = local.env
  namespace = local.project

  microservice_name = "${local.project}-api"
  health_check_path = "/"
  docker_image      = "${local.project}-api"
  docker_image_tag  = "v1"
  container_port    = "8080"
  service_port      = "8080"
}