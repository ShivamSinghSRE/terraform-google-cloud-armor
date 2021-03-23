/**
 *
 * A simple module for Google Cloud Armor rules based on IP ranges
 * By Gustavo Antão <gustavo.antao@gmail.com>
 * https://github.com/gustavoantao/terraform-google-cloud-armor
 *
 */

#### Example ####
provider "google" {
  alias   = "project-name"
  project = "project-name"
  region  = "us-central1"
}
