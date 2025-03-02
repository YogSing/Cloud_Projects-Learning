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

3. Creates an execution plan for changes to the infrastructure:

   ```sh
   terraform plan
   ```
   **Explanation**: This command shows you what changes Terraform plans to make. It compares your configuration files to the current state of the infrastructure (stored in the state file) and shows you a "preview" of what changes will be applied.
4. Applies the changes defined in the Terraform configuration files:
    ```sh
   terraform apply
   ```
   **Explanation**: This command will take the execution plan from the terraform plan command and apply it to your infrastructure. It will create, modify, or destroy resources according to the plan. You'll be asked to confirm before changes are actually made.
5. Destroys the infrastructure managed by Terraform:
    ```sh
   terraform destroy
   ```
   **Explanation**: This command is used when you want to completely tear down the infrastructure you have created with Terraform. It will remove all resources defined in the configuration files.
6. Synchronizes the state with the real infrastructure:
    ```sh
   terraform apply -refresh-only
   ```
   **Explanation**: When you use the `-refresh-only` flag, Terraform will only refresh the state of your resources by querying the current state of your infrastructure, but it will not create, update, or destroy any 
    resources. Essentially, it updates the Terraform state to match the real-world infrastructure, but it won't apply any changes defined in the configuraton files.
7. Displays output values defined in the Terraform configuration:
   ```sh
   terraform output
   ```
   **Explanation**: This command is used to display the outputs defined in your Terraform configurations (usually in output blocks). It's useful to retrieve the values (such as IP addresses, instance IDs, etc.) that 
     Terraform outputs after applying the configuration.
8. Displays the current state or plan:
    ```sh
   terraform show
   ```
    **Explanation**: This command provides human-readable output from a state or plan file.
9. Manages Terraform's state file:
     ```sh
      terraform state 
     ```
    **Explanation**: This set of commands allows you to interact directly with Terraform’s state file. You can use it to move resources between states, list resources, or remove resources from the state file.
10. Imports existing infrastructure into Terraform's state.
    ```sh
      terraform import
     ```
    **Explanation**: This command allows you to import resources that were created outside of Terraform into Terraform’s state file. This allows you to manage these resources using Terraform going forward.
11. Displays all providers required by your configuration.
     ```sh
      terraform providers
     ```
     **Explanation**: This command shows a list of providers that Terraform needs to work with in the current configuration. It’s useful for understanding which provider plugins will be installed when you run terraform 
       init.
    














    
    
    
      
