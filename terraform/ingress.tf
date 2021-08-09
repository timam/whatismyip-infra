//module "alb-ingress-controller" {
//  source       = "../tf-modules/alb-ingress-controller"
//  region       = "ap-southeast-1"
//  cluster_name = "sit-ortrta-eks-cluster"
//  vpc_id       = "vpc-84fa6ce3"
//}

//module "private-alb-ingress" {
//  source    = "../tf-modules/private-alb-ingress"
//  namespace = local.project
//
//  certificate_arn  = module.acm.acm-arn
//  healthcheck_path = "/"
//  private_subnet1  = data.aws_subnet.private-subnet-1a.id
//  private_subnet2  = data.aws_subnet.private-subnet-1b.id
//  private_subnet3  = data.aws_subnet.private-subnet-1c.id
//
//  values = <<EOF
//services:
//  cps:
//    service_url:  "cps.${local.domain-name}"
//    service_name: "${module.cps.microservice_name}"
//    service_port: "${module.cps.service_port}"
//EOF
//}

module "public-alb-ingress" {
  source    = "../tf-modules/public-alb-ingress"
  namespace = local.project

  certificate_arn  = "arn:aws:acm:ap-southeast-1:354285753755:certificate/44e11307-55f4-4365-a0fe-0c408af4f7fa"
  healthcheck_path = "/"
  public_subnet1  = "subnet-0d0fc9c4095d96e08"
  public_subnet2  = "subnet-bf092df6"
  public_subnet3  = "subnet-4978670f"

  values = <<EOF
services:
  app:
    service_url:  "whatismyip-app.labs.bka.sh"
    service_name: "${module.app.microservice_name}"
    service_port: "${module.app.service_port}"
  api:
    service_url:  "whatismyip-api.labs.bka.sh"
    service_name: "${module.api.microservice_name}"
    service_port: "${module.api.service_port}"
EOF
}
