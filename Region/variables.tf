variable "Name" {
  type = string

  description = "Friendly readable name for this region"
}

#
# TODO: Auto Generate this from Postal Code, or PLUS Code/What3Words
#
variable "Slug" {
  type = string

  description = "Machine readable slug for URLs and others"
}