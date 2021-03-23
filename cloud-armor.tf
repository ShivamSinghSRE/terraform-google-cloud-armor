/**
 *
 * A simple module for Google Cloud Armor rules based on IP ranges
 * By Gustavo Antão <gustavo.antao@gmail.com>
 * https://github.com/gustavoantao/terraform-google-cloud-armor
 *
 */



module "google-cloud-armor" {
  providers = {
    google = google.project-name
  }

  source  = "./modules/cloud-armor"

  policy_name  = "default-policy"
  policy_rules = [
      {
          action      = "deny(403)"
          priority    = "2147483647"
          ip_ranges   = "0.0.0.0/0"
          description = "Default Rule - Deny Everything"
      },
      {          
          action      = "allow"
          # Lower numbers, highest priority
          priority    = "0"
          # Use a string with CIDR's separated by comma
          ip_ranges   = "1.1.1.1/24,2.2.2.2/24,123.321.123.321/32" # Max 10 CIDR's per rule
          description = "Allow IP ranges"
      },
      {          
          action      = "allow"
          priority    = "1"        
          ip_ranges   = "1.1.1.1/24,2.2.2.2/24,123.321.123.321/32"
          description = "Allow IP ranges"
      }      
  ]
}
