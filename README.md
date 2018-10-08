This is an example of using Terraform modules to host a WordPress app using the AWS services. 

Requirements: 
Terraform 
AWS 

Terraform modules are created for EC2, RDS and ELB with respective directory and this information is passed to the source.tf file. 

Variables are used to provide VPC, Subnet and credentials information. 

Steps:
1.Run Terraform init to initialize the AWS provider 
2.Run Terraform apply with the variables as input. 

Example:
terraform apply -var key-pair= -var subnet-id= -var sg-elb= -var wp-vpc-id= -var wp-private-id1= -var wp-private-id2= -var password= -var sg-rds= -var sg-inst=
