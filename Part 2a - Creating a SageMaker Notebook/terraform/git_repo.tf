# Defining the Git repo to instantiate on the SageMaker notebook instance
resource "aws_sagemaker_code_repository" "git_repo" {
  code_repository_name = "ds-quick-tips-repo"
  
  git_config {
    repository_url = "https://github.com/dkhundley/ds-quick-tips.git"
  }
}