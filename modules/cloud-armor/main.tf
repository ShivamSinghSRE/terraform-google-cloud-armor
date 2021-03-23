
/**
 *
 * A simple module for Google Cloud Armor rules based on IP ranges
 * By Gustavo Antão <gustavo.antao@gmail.com>
 * https://github.com/gustavoantao/terraform-google-cloud-armor
 *
 */


resource "google_compute_security_policy" "policy" {
  name        = var.policy_name
  
 
  dynamic "rule" {

      for_each = [ for item in var.policy_rules: {
          action = item.action
          priority = item.priority
          ip_ranges = split(",", item.ip_ranges)
          description = item.description
      }]


      content {
          action = rule.value.action
          priority = rule.value.priority
          match {
            versioned_expr = "SRC_IPS_V1"

            config {
                src_ip_ranges = rule.value.ip_ranges
            }
        }
        description = rule.value.description
    }      
  }
}

