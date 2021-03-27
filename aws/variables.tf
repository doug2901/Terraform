/* abrir e Fechar comentarios*/
variable "image_id" {
    default = "ami-0a91cd140a1fc148a"
    type = string 
    description= "é um ID de uma AMI da AWS"

    validation {
        condition = length(var.image_id) > 4 && substr(var.image_id, 0, 4) =="ami-" 
        error_message = " The image_id value must be a valid AMI id, starting with \"ami-\"."
    }
}
variable "aws"{}

variable "key_pair" {
    default = "terraform-study"
    type    = string
    description = "key pair para conexões nas EC2 - Desconplicando o terraform"
  
}