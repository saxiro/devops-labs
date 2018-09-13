
variable "user_names" {
  description = "Create IAM users with these names"
  type = "list"
  default = ["joe", "bob", "susan"]
}

variable "enable_special_user" {
  description = "Enable or disable special user"
  default = false
}
