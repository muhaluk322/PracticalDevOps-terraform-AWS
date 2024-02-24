# Task on the topic AWS and Terraform

## Creating AWS resources using Terraform flat modules

This Terraform configuration describes an infrastructure deployment that creates various AWS resources using reusable modules. Let's break down the code section by section:

1. **Provider Block**:
   ```
   provider "aws" {
     region = var.region
   }
   ```
   This block specifies the AWS provider that Terraform will use to provision resources. It indicates that Terraform should interact with the AWS services in the specified region, and the region value is read from the `var.region` variable, which should be defined in the `variables.tf` file.

2. **VPC Module**:
   ```
   module "vpc" {
     source = "./modules/vpc"
   }
   ```
   This block uses the `vpc` module defined in the `./modules/vpc` directory. It allows you to create a Virtual Private Cloud (VPC) with its associated resources, like subnets, route tables, and internet gateways. The `vpc` module likely exposes output variables like `vpc_id` and `environment`, which are used in other parts of the configuration.

3. **Subnet Module**:
   ```
   module "subnet" {
     source      = "./modules/subnet"
     vpc_id      = module.vpc.vpc_id
     environment = module.vpc.environment
   }
   ```
   This block uses the `subnet` module defined in the `./modules/subnet` directory. The module is responsible for creating subnets within the VPC created by the previous `vpc` module. The `vpc_id` and `environment` variables are passed to the `subnet` module, likely to define the subnet's placement within the VPC and other subnet-specific configurations.

4. **Security Group (SG) Module**:
   ```
   module "sg" {
     source      = "./modules/sg"
     vpc_id      = module.vpc.vpc_id
     environment = module.vpc.environment
   }
   ```
   This block uses the `sg` module defined in the `./modules/sg` directory. The module is responsible for creating security groups within the VPC created by the `vpc` module. The `vpc_id` and `environment` variables are passed to the `sg` module, likely to define the security group's rules and associations with the VPC.

5. **EC2 Instance Module**:
   ```
   module "ec2" {
     source                 = "./modules/ec2"
     publicSubnetCIDR       = module.subnet.publicSubnetCIDR
     subnet_id              = module.subnet.subnet_id
     vpc_security_group_ids = module.sg.vpc_security_group_ids
   }
   ```
   This block uses the `ec2` module defined in the `./modules/ec2` directory. The module is responsible for creating an EC2 instance within the public subnet. It requires information about the subnet and security groups created by the `subnet` and `sg` modules. The module likely defines configurations like instance type, AMI, and any other necessary settings for the EC2 instance.

Overall, this Terraform configuration demonstrates how to use reusable modules to define an AWS infrastructure with a VPC, subnets, security groups, and an EC2 instance. Each module is responsible for creating specific resources, and the output variables from one module are passed as input variables to other modules to establish dependencies and relationships between the resources.

## Terraform AWS Task2

In order to complete this task for the first you should develop two files. <br>
*First* one: `outputs.tf` for module *ec2* located in *"./modules/ec2"* with following *outputs*: <br>
`ec2_ami` <br>
`ec2_public_ip` <br>
`ec2_type` <br>
*Second* one: `outputs.tf` for root directory *main.tf*  with following *outputs*: <br>
`ec2_ami` <br>
`ec2_public_ip` <br>
`ec2_type` <br>
`vpc_id` <br>
`subnet_id` <br>
`security_group_ids` <br>
<br>
After compleeting previous part you should deploy your infrastructure into AWS using `terraform apply` (all created resources are in FreeTier). <br>
Next step - run `terraform output > result` (taking into account, that your infrastructure still alive). <br>
Finally, run `terraform destroy` and upload your `result` file to check <br>




