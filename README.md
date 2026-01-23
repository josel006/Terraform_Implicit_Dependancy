# Terraform_Implicit_Dependancy
Terraform automatically determines the order in which resources should be created by analyzing references between resources. This behavior is known as an implicit dependency.
## What Is an Implicit Dependency?

An implicit dependency occurs when one resource references an attribute of another resource. Terraform detects this reference and ensures the dependent resource is created after the resource it relies on — without requiring you to explicitly define a dependency.

- Note: The example below was created using Visual Studio Code with the HashiCorp Terraform extension installed to provide syntax highlighting, validation, and Terraform workflow support.

Example: EC2 Instance and Elastic IP (EIP)

<img width="1316" height="549" alt="image" src="https://github.com/user-attachments/assets/3a10ce40-bbe9-4e95-90a9-20326a57ff09" />


## How Terraform Interprets This

Because the aws_eip resource references aws_instance.myec2.id, Terraform understands that:

The EC2 instance must be created first

The Elastic IP depends on the EC2 instance

The EIP will only be created after the instance exists

You do not need to add a depends_on block here — Terraform infers the dependency automatically.

## Key Takeaway

Terraform automatically creates dependencies when one resource references another resource’s attributes.
This implicit dependency ensures correct provisioning order without extra configuration.
