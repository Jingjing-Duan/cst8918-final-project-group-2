variable "location" {
  type    = string
  default = "eastus" # Or any region preferred by your group
}

variable "environment_slugs" {
  type = map(string)
  default = {
    prod  = "10.0.0.0/16"
    test  = "10.1.0.0/16"
    dev   = "10.2.0.0/16"
    admin = "10.3.0.0/16"
  }
}