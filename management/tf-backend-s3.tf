/**
 * Terraform Demo
 * By: Mark
 */

terraform {
    backend "s3" {
        region = "us-east-1"
        bucket = "geomar-tfdemo-state"
        key = "management/terraform.tfstate"
        encrypt = "true"
    }
}
