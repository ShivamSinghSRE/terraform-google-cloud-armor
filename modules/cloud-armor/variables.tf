/**
 *
 * A simple module for Google Cloud Armor rules based on IP ranges
 * By Gustavo Antão <gustavo.antao@gmail.com>
 * https://github.com/gustavoantao/terraform-google-cloud-armor
 *
 */



variable "policy_name" {
  description = "The name of the policy"
  type = string
}

variable "policy_rules" {
  description = "Single rule"
  type = list
  default = [
      {
          action = "deny(403)"
      },
      {
          priority = "2147483647"
      },
      {
          ip_ranges = "0.0.0.0/0"
      },
      {
          description = "Cloud Armor Rule"
      }
  ]
}