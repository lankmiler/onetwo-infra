module "dev_frontend" {
    source        = "./modules/apps"
    mode          = "test"
    zone          = "dev"
    domain_name   =  var.domain_name
    app_namespace = "test"
    port          = 80
    image         = "gcr.io/vocal-capsule-328318/onetwocareer-test/front:latest"
    app           = "frontend"
    #depends_on    = [ module.dns ]
}

#module "dev_quest1" {
    # source        = "./modules/apps"
    # mode          = "test"
    # zone          = "dev"
    # domain_name   =  var.domain_name
    # app_namespace = "test"
    # port          = 80
    # image         = "gcr.io/vocal-capsule-328318/onetwocareer-test/quest:latest"
    # app           = "quest1"
    #depends_on   = [module.dns] 
#}

#module "dev_api" {
    #source        = "./modules/apps"
    #app           = "api"
    #app_namespace = "dev"
    #zone          = "dev"
    #depends_on    = [module.dns, module.db]
#}