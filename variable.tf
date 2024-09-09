variable "region" {
  description = "The region in which the resources will be created."
  default     = "eu-west-1"

}

variable "common_tags" {
  description = "Common tags to be applied to all resources."
  default     = "tf_challenge"

}

variable "availability_zones" {
  description = "The availability zones in which the resources will be created."
  default     = "eu-west-1a"
}
