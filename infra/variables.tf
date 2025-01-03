variable "region" {
  description = "The region to create all our Civo resources in"
  type        = string
  default     = "LON1"
}

variable "github_token" {
  description = "GitHub token"
  sensitive   = true
  type        = string
  default     = ""
}

variable "github_org" {
  description = "GitHub organization"
  type        = string
  default     = "AverageMarcus"
}

variable "github_repository" {
  description = "GitHub repository"
  type        = string
  default     = "bootstrap-civo-cluster-blog-post-example"
}
