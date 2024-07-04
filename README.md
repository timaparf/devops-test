## Test task for DevOps 

### Prerequisites
- This repo describes basic infrastructure, currently in only has VPC and networks resources described. Module https://github.com/terraform-aws-modules/terraform-aws-vpc used for that
- terragrunt is used as wrapper around terraform to handle state and common variables

### What needs to be done
- Fork this repo
- In you need to create terraform code for EKS cluster. Just basic but ready to work setup.
- Use https://github.com/terraform-aws-modules/terraform-aws-eks module
- EKS cluster should be in it's own private subnets. Subnets that are currently configured in `private_subnets` variable in VPC module are already taken, so you need to create additional set of subnets in the same VPC. Take `/22` range for them.
- EKS cluster should have autoscaling enabled
- Basically that's all