terraform {
  backend "http" {
    address            = "https://api.tfstate.dev/app/RAJKUMAR-E/tech_eazy_devops_RAJKUMAR-E"
    lock_address       = "https://api.tfstate.dev/app/RAJKUMAR-E/tech_eazy_devops_RAJKUMAR-E/lock"
    unlock_address     = "https://api.tfstate.dev/app/RAJKUMAR-E/tech_eazy_devops_RAJKUMAR-E/unlock"
    username           = "RAJKUMAR-E"
    password           = "YOUR_GITHUB_TOKEN"
    skip_cert_verification = false
  }
}
