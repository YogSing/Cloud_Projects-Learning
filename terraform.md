# Terraform Commands - Infrastructure as code (LaC)
Terraform is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. You can then use a consistent workflow to provision and manage all of your infrastructure throughout its lifecycle. Terraform can manage low-level components like compute, storage, and networking resources, as well as high-level components like DNS entries and SaaS features.

## Getting Started
Most common and important Terraform commands to deploy resources 

1. Initialize a Terraform working directory:

   ```sh
    terraform init
     ```
   **Explanation**: This command sets up the environment for Terraform by initializing the backend (where state is stored), downloading any required provider plugins, and setting up the necessary files to work with Terraform.
2. Validates the syntax and configuration files:
   ```sh
    terraform validate
     ```
   **Explanation**: This command checks whether the configuration files are syntactically valid and correct. It doesn’t communicate with the infrastructure or perform any changes, just ensures that your Terraform files are correctly formatted.

4. Creates an execution plan for changes to the infrastructure:

   ```sh
   terraform plan
   ```
   **Explanation**: This command shows you what changes Terraform plans to make. It compares your configuration files to the current state of the infrastructure (stored in the state file) and shows you a "preview" of what changes will be applied.
5. Applies the changes defined in the Terraform configuration files:
    ```sh
   terraform apply
   ```
   **Explanation**: This command will take the execution plan from the terraform plan command and apply it to your infrastructure. It will create, modify, or destroy resources according to the plan. You'll be asked to confirm before changes are actually made.
6. Destroys the infrastructure managed by Terraform:
    ```sh
   terraform destroy
   ```
   **Explanation**: This command is used when you want to completely tear down the infrastructure you have created with Terraform. It will remove all resources defined in the configuration files.
7. Synchronizes the state with the real infrastructure:
    ```sh
   terraform apply -refresh-only
   ```
   **Explanation**: When you use the `-refresh-only` flag, Terraform will only refresh the state of your resources by querying the current state of your infrastructure, but it will not create, update, or destroy any resources. Essentially, it updates the Terraform state to match the real-world infrastructure, but it won't apply any changes defined in the configuraton files.
   
    














    
    
    
      
