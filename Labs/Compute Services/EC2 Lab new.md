 **Overview**

<img width="421" height="335" alt="image" src="https://github.com/user-attachments/assets/bce1319c-7644-4a0f-8c4e-228a6edce231" />

This lab provided me with a basic overview of launching, resizing, managing, and monitoring an Amazon EC2 instance.

Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides resizable compute capacity in the cloud. It is designed to make web-scale cloud computing easier for developers.

Amazon EC2's simple web service interface allows you to obtain and configure capacity with minimal friction. It provides you with complete control of your computing resources and lets you run on Amazon's proven computing environment. Amazon EC2 reduces the time required to obtain and boot new server instances to minutes, allowing you to quickly scale capacity, both up and down, as your computing requirements change.

Amazon EC2 changes the economics of computing by allowing you to pay only for capacity that you actually use. Amazon EC2 provides developers the tools to build failure resilient applications and isolate themselves from common failure scenarios.

**Topics covered**

- Launch a web server with termination protection enabled
- Monitor my EC2 instance
- Modify the security group that my web server is using to allow HTTP access
- Resize my Amazon EC2 instance to scale
- Test termination protection
- Terminate my EC2 instance

**Task 1: Launching your EC2 instance**
In this task, I will launch an Amazon EC2 instance with termination protection. Termination protection prevents me from accidentally terminating an EC2 instance. I will deploy my instance with a User Data script that will allow me to deploy a simple web server.

1. In the AWS Management Console on the Services menu, choose EC2.

2. In the left navigation pane, choose EC2 Dashboard to ensure that you are on the dashboard page.

3. Choose Launch instance, and then select Launch instance.

**Step 1: Naming your EC2 instance**
When you name your instance, AWS creates a key value pair. The key for this pair is Name, and the value is the name you enter for your EC2 instance.

4. In the Name and tags pane, in the Name text box, enter "Web Server".

**Step 2: Choosing an Amazon Machine Image (AMI)**
An AMI provides the information required to launch an instance, which is a virtual server in the cloud. An AMI includes the following:

- A template for the root volume for the instance (for example, an operating system or an application server with applications)

- Launch permissions that control which AWS accounts can use the AMI to launch instances

- A block device mapping that specifies the volumes to attach to the instance when it is launched

5. Locate the Application and OS Images (Amazon Machine Image) pane. 

6. Under AMI Machine Image (AMI), notice that the Amazon Linux 2023* image is selected by default. Keep this setting.

**Step 3: Choosing an instance type**
Amazon EC2 provides a wide selection of instance types optimized to fit different use cases. Instance types comprise varying combinations of CPU, memory, storage, and networking capacity and gives the flexibility to choose the appropriate mix of resources for applications. Each instance type includes one or more instance sizes so that can scale resources to the requirements of target workload.

Select a t3.micro instance. This instance type has 2 virtual CPU and 1 GiB of memory.

7. From the dropdown, select t3.micro.

Step 4: Configuring the network settings 
This pane is used to configure networking settings.

The VPC indicates which virtual private cloud (VPC) you want to launch the instance into. You can have multiple VPCs, including different ones for development, testing, and production.

8. In the Network settings pane, choose Edit

9. For VPC - required, select Lab VPC.

10. Still in the Network settings pane, configure the Security Group as follows:

11. Security group name - required: Web Server security group

12. Description: Security group for my web server

A security group acts as a virtual firewall that controls the traffic for one or more instances. When you launch an instance, you associate one or more security groups with the instance. You add rules to each security group that allow traffic to or from its associated instances. You can modify the rules for a security group at any time; the new rules are automatically applied to all instances that are associated with the security group.

**Step 7: Configuring advanced details** 
Expand the Advanced details pane.

Select the dropdown for Termination protection, then choose Enable.

When you launch an instance in Amazon EC2, you have the option of passing user data to the instance. These commands can be used to perform common automated configuration tasks and even run scripts after the instance starts. 

Copy the following commands, and paste them into the User data text box.

#!/bin/bash
yum -y install httpd
systemctl enable httpd
systemctl start httpd
echo '<html><h1>Hello From Your Web Server!</h1></html>' > /var/www/html/index.html

The script does the following:

Install an Apache web server (httpd)

Configure the web server to automatically start on boot

Activate the Web server

Create a simple web page

Step 8: Launching an EC2 instance
Now that you have configured your EC2 instance settings, it is time to launch your instance.

In the right pane, choose Launch instance

Choose View all instances

The instance appears in a Pending state, which means it is being launched. It then changes to Running, which indicates that the instance has started booting. There will be a short time before you can access the instance.

The instance receives a public DNS name that you can use to contact the instance from the Internet.

Select the  box next to your Web Server. The Details tab displays detailed information about your instance.

 To view more information in the Details tab, drag the window divider upward.

Review the information displayed in the Details, Security and Networking tabs.

Wait for your instance to display the following:

Note: Refresh if needed.

Instance State:  Running

Status Checks:   2/2 checks passed
