## DATA BLOCKS
## ----------------------------------------------------------------

# Creating the data that will be used by the IAM policy
data "aws_iam_policy_document" "s3_ls_policy_data" {
  statement {
    actions = [
      "s3:ListAllMyBuckets"
    ]

    resources = [
      "arn:aws:s3:::*"
    ]
  }
}

# Creating the assume role policy data
data "aws_iam_policy_document" "s3_ls_assume_role_data" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
  }
}



## RESOURCE BLOCKS
## ----------------------------------------------------------------

# Creating the IAM policy using the data block from above
resource "aws_iam_role_policy" "s3_ls_policy" {
  name   = "s3_ls_iam_policy_tfcloud"
  policy = data.aws_iam_policy_document.s3_ls_policy_data.json
  role   = aws_iam_role.s3_ls_role.id
}

# Creating the IAM role associated to the resources above
resource "aws_iam_role" "s3_ls_role" {
  name               = "s3_ls_iam_role_tfcloud"
  description        = "This role allows for all S3 buckets to be listed."
  assume_role_policy = data.aws_iam_policy_document.s3_ls_assume_role_data.json
}