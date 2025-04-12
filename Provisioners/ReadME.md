## Provisioners in the Terraform

### Use case of provisioners in the Terraform
- 'local-exec': Cmd used to run locally where Terraform is executed such as for the time stamp of deployment.
   ``` tf
   provisioner "local-exec" {
   command = "echo 'Deployment started at ${timestamp()}' > deployment-${replace(timestamp(), ":", "-")}.log"
   }
   ```
- 'remote-exec' : Cmd used to run remotely on the target machine for example linux vm
  ``` tf
   provisioner "remote-exec" {
    ///code and connections
  }
  ```
- 'file' : Cmd used to copy files from local machine to target machine
  ```tf
  provisioner "file" {
  source      = "configs/sample.txt"
  destination = "/home/adminuser/sample.txt"
  connection{
  }
 }
  ```
