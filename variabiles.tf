variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
  default     = "C:\\Users\\Eugen\\.ssh\\mtcazurekey.pub"



}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key"
  type        = string
  default     = "C:\\Users\\Eugen\\.ssh\\mtcazurekey"
}