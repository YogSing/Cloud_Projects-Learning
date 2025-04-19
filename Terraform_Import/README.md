## How to import Azure resources to the Terraform State file.
-  `provider.tf`: This file is used to declare the provider configuration
-  `main.tf`: I created resources with matching names from Azure to import into the tf.state file.  
-  `terraform.tfstate`: This is the tf state file for visibility.

## Screenshot of before and after TF Import run CMD. 
- Resource created via ClickOps  
![clickops_resources_on_azure](https://github.com/user-attachments/assets/8a605aab-ab8e-4358-adf2-56681027fd9f)
- Created resources in the main.tf file with the same names and 3 to add
  
  ![Show_resources_to_add](https://github.com/user-attachments/assets/eb0247af-4a1f-468c-a676-0177c3d53b49)
- Ran Terraform import command with resource ID.  
![Import_tf_resouces_to state file](https://github.com/user-attachments/assets/2300d319-cda3-4e47-b637-160caf2e4e44)
- All resources imported in the tfstate file, and no changes to infrastructure.  
![No_changes_to_infrastructure](https://github.com/user-attachments/assets/06e7d861-2ad6-409d-9f93-f8ef0c429876)

  
   

