variable "cluster_name" {
  description = "Nom du cluster EKS"
  type        = string
}

variable "subnet_ids" {
  description = "Liste des IDs de sous-réseaux où le cluster EKS sera déployé"
  type        = list(string)
}

variable "node_group_name" {
  description = "Nom du groupe de nœuds EKS"
  type        = string
}

variable "desired_size" {
  description = "Nombre souhaité de nœuds dans le groupe de nœuds"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Nombre maximum de nœuds dans le groupe de nœuds"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Nombre minimum de nœuds dans le groupe de nœuds"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "Type d'instance pour les nœuds EKS"
  type        = string
  default     = "t2.micro"
}
