module "test_one" {
  source          = "../../"
  name_components = ["ResourceType", "Org", "ProjAppSvc", "Environment", "Location", "Instance"]
  environment     = "dev"
  organization    = "rog"
  location        = "wu"
  proj_app_or_svc = "mtx"
  unit_or_dept    = "fin"
  instance        = "01"
}


module "test_two" {
  source          = "../../"
  name_components = ["ResourceType", "ProjAppSvc", "Environment", "UnitDept", "Location", "Instance"]
  environment     = "prd"
  location        = "cc"
  proj_app_or_svc = "svt"
  unit_or_dept    = "acc"
  instance        = "02"
}

module "test_two_random" {
  source          = "../../"
  name_components = ["ResourceType", "ProjAppSvc", "Environment", "UnitDept", "Location", "Instance"]
  environment     = "prd"
  location        = "cc"
  proj_app_or_svc = "svt"
  unit_or_dept    = "acc"
  instance        = "02"
  enable_random_name_component = true
}

module "test_three" {
  source            = "../../"
  name_components   = ["ResourceType", "ProjAppSvc", "Environment", "UnitDept", "Location"]
  environment       = "prod"
  location          = "scu"
  proj_app_or_svc   = "dnl"
  unit_or_dept      = "it"
  output_debug_info = true
}