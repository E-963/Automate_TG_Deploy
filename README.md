# Automate Transit gateway deployment

### week_eleven_&_Twelve - Automate Transit gateway deployment utilizing CircleCI CI/CD & Terraform IaC
    duration: 2 weeks
    ForgTech company wanna test your ability to type down a clean code by Deploying the structure of resources. This will help you to build a
    good reputation.
    The FrogTech Cloud Network team requested you to provision a transit gateway based on AWS Best Practice as follows:

        1. Deploy VPC_1 and VPC_2 including Private subnets and ec2 machines for traffic testing.
        2. Deploy VPC_3 including public subnet.
        3. Deploy Transit gateway The manage the internet traffic flow-driven from/to The Private subnets to The Public subnet.
        By following The ForgTech deployment policy, you should deliver this deployment in an automated pipeline using CircleCI and follow the
        DevOps Team pipeline structure standards as The Pipeline stages should be as follows:
        4. Preparation stage: This includes the installation and preparation steps (i.e. install AWS CLI, Terraform, and Terraform Initialization) the
        installation must be done by Commands map.
        5. Plan Stage: This includes the terraform validation and plan commands; The plan must done by using the output file (i.e. tfplan_tgw file,)
        and Then Saving the output plan file using CircleCI workspace.
        6. Manual approval: Pause the pipeline until Reviewed & Approved by the checker engineer.
        7. Terraform apply: This includes attaching the output plan saved file in the plan stage and then Starting provision resources.
        the
        After provisioning the required Resources, Check The deployed EC2 machines in the private subnet’s internet accessibility using the
        package manager command:
        1
        dnf search httpd
        Consider the below requirements specifications.
        8. Resources must be created at the us-east-1 region.
        9. Store state file backend into HCP.
        10. Resources must have common tags combination as below:
        </aside>
        
![alt text](<TG between 3VPCs (1).jpg>)