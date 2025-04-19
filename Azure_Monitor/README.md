### Azure Monitoring with Terraform

-  `provider.tf`: This file is used to declare the provider configuration
-  `Virtual-machine.tf`: This file has Linux VM configuration.  
-  `network.tf`: This file has network configuration such as Vnet, subnet, NSG and public IP. 
-  `variable.tf`: This file has common variables.
-  `action group.tf`: This group has an action group and two alerts. 
-  `stress_cms.sh`: This is used to generate fake stress on the machine. 

## Screenshot of alert and fired emails
- Metric alert
  
![image](https://github.com/user-attachments/assets/ced23a89-70bc-4397-b6ae-2768ef928755)

- Stress on Machine
![image](https://github.com/user-attachments/assets/212f9245-0c63-435a-aa34-17ff79518031)

- Fired email

![Metric_Alert_Email](https://github.com/user-attachments/assets/a13d905a-99a7-4232-aea1-fedf89a1fe4e)








