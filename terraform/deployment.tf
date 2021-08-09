module "api" {
  source    = "../tf-modules/deployment"
  env       = local.env
  namespace = local.project
  replicas  = 1
  microservice_name = "${local.env}-${local.project}-api"
  health_check_path = "/"
  docker_image      = "timam/${local.project}-api"
  docker_image_tag  = "v1"
  container_port    = "8080"
  service_port      = "8080"
}

module "app" {
  source    = "../tf-modules/deployment"
  env       = local.env
  namespace = local.project
  replicas  = 1
  microservice_name = "${local.env}-${local.project}-app"
  health_check_path = "/"
  docker_image      = "timam/${local.project}-app"
  docker_image_tag  = "v1"
  container_port    = "8080"
  service_port      = "8080"
}
