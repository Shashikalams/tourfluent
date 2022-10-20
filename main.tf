terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.27"
    }
  }

  required_version = ">=0.14.9"

}
provider "aws" {
  region = "us-east-1"
  profile = "shashikala"
}


terraform {
  required_version = ">=0.14.9"

   backend "s3" {
       bucket = "[tourfluent]"
       key    = "[smith2002sc6361]"
     region = "east-us-1"
   }
}


resource "aws_s3_bucket" "s3Bucket" {
     bucket = "[tourfluent]"
     acl       = "public-read"

     policy  = <<EOF
{
     "id" : "MakePublic",
   "version" : "2012-10-17",
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
         "effect" : "Allow",
         "resource" : "arn:aws:s3:::tourfluent/*",
         "principal" : "*"
      }
    ]
  }
EOF
  website {
       index_document = "index.html"
   }
}
