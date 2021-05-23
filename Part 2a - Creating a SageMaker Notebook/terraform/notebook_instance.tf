# Creating the SageMaker notebook instance
resource "aws_sagemaker_notebook_instance" "notebook_instance" {
	name = "ds-quick-tips-instance"
	role_arn = aws_iam_role.notebook_iam_role.arn
	instance_type = "ml.t2.medium"
	default_code_repository = aws_sagemaker_code_repository.git_repo.code_repository_name
}