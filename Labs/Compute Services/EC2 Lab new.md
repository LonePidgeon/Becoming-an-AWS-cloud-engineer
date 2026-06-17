 **Overview**

<img width="421" height="335" alt="image" src="https://github.com/user-attachments/assets/bce1319c-7644-4a0f-8c4e-228a6edce231" />

This lab provided me with a basic overview of launching, resizing, managing, and monitoring an Amazon EC2 instance.

Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides resizable compute capacity in the cloud. It is designed to make web-scale cloud computing easier for developers.

Amazon EC2's simple web service interface allows you to obtain and configure capacity with minimal friction. It provides you with complete control of your computing resources and lets you run on Amazon's proven computing environment. Amazon EC2 reduces the time required to obtain and boot new server instances to minutes, allowing you to quickly scale capacity, both up and down, as your computing requirements change.

Amazon EC2 changes the economics of computing by allowing you to pay only for capacity that you actually use. Amazon EC2 provides developers the tools to build failure resilient applications and isolate themselves from common failure scenarios.

**Topics covered**

- Launch a web server with termination protection enabled
- Monitor an EC2 instance
- Modify the security group that my web server is using to allow HTTP access
- Resize an Amazon EC2 instance to scale
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

   <img width="874" height="440" alt="image" src="https://github.com/user-attachments/assets/3c3bb8a6-0285-4d35-b86a-833d39d75266" />


**Step 3: Choosing an instance type**
Amazon EC2 provides a wide selection of instance types optimized to fit different use cases. Instance types comprise varying combinations of CPU, memory, storage, and networking capacity and gives the flexibility to choose the appropriate mix of resources for applications. Each instance type includes one or more instance sizes so that can scale resources to the requirements of target workload.

Select a t3.micro instance. This instance type has 2 virtual CPU and 1 GiB of memory.

7. From the dropdown, select t3.micro.

**Step 4: Configuring the network settings** 
This pane is used to configure networking settings.

The VPC indicates which virtual private cloud (VPC) you want to launch the instance into. You can have multiple VPCs, including different ones for development, testing, and production.

8. In the Network settings pane, choose Edit

9. For VPC - required, select Lab VPC.

10. Still in the Network settings pane, configure the Security Group as follows:

11. Security group name - required: Web Server security group

12. Description: Security group for my web server

<img width="859" height="448" alt="image" src="https://github.com/user-attachments/assets/0c33ed95-0e5e-4592-8dc8-5cfbb186ccba" />


A security group acts as a virtual firewall that controls the traffic for one or more instances. When you launch an instance, you associate one or more security groups with the instance. You add rules to each security group that allow traffic to or from its associated instances. You can modify the rules for a security group at any time; the new rules are automatically applied to all instances that are associated with the security group.

**Step 5: Adding storage**
Amazon EC2 stores data on a network-attached virtual disk called Amazon Elastic Block Store (Amazon EBS).

Launch the EC2 instance using a default 8 GiB disk volume. This is your root volume (also known as a boot volume).

13. In the Configure storage pane, keep the default storage configuration.

**Step 6: Configuring advanced details** 

14. Expand the Advanced details pane.

15. Select the dropdown for Termination protection, then choose Enable.

16. When you launch an instance in Amazon EC2, you have the option of passing user data to the instance. These commands can be used to perform common automated configuration tasks and even run scripts after the instance starts. 

17. Copy the following commands, and paste them into the User data text box.

```
#!/bin/bash
yum -y install httpd
systemctl enable httpd
systemctl start httpd
echo '<html><h1>Hello From Your Web Server!</h1></html>' > /var/www/html/index.html
```

The script does the following:

- Install an Apache web server (httpd)
- Configure the web server to automatically start on boot
- Activate the Web server
- Create a simple web page

  <img width="629" height="451" alt="image" src="https://github.com/user-attachments/assets/1451d522-24a3-4cfc-a3fe-c617ce766bc2" />


**Step 7: Launching an EC2 instance**
Now that you have configured the EC2 instance settings, you launch the instance.

18. In the right pane, choose Launch instance

19. Choose View all instances

The instance receives a public DNS name that you can use to contact the instance from the Internet.

Select the  box next to your Web Server. The Details tab displays detailed information about your instance. To view more information in the Details tab, drag the window divider upward.

**Task 2: Update Your Security Group and Access the Web Server**

When you launched the EC2 instance, you provided a script that installed a web server and created a simple web page. In this task, you will access content from the web server.

20. Select the instance by checking the box and select the Details tab.

21. Copy the Public IPv4 address of your instance to your clipboard.

    <img width="1115" height="377" alt="image" src="https://github.com/user-attachments/assets/36772b14-8c60-459b-b692-22deccdd2362" />


23. Open a new tab in your web browser, paste the IP address you just copied, then press Enter.

**Question:** Are you able to access your web server? Why not?

You are not currently able to access your web server because the security group is not permitting inbound traffic on port 80, which is used for HTTP web requests. This is a demonstration of using a security group as a firewall to restrict the network traffic that is allowed in and out of an instance.

<img width="1146" height="637" alt="image" src="https://github.com/user-attachments/assets/3df27aed-18e3-485e-8296-2386eb0d9d1f" />


To correct this, you will now update the security group to permit web traffic on port 80.

23. Keep the browser tab open, but return to the EC2 Management Console tab.

24. In the left navigation pane, select Security Groups located under Network & Security.

25. Select  Web Server security group.

26. Select the Inbound rules tab.
The security group currently has no rules.

<img width="1108" height="443" alt="image" src="https://github.com/user-attachments/assets/64ffba0d-55c6-4251-a58b-8d0ee51d52a7" />


28. Select Edit inbound rules then select Add rule and configure the rule with the following settings:

- Type: HTTP
- Source: Anywhere-IPv4
- Select Save rules
<img width="1304" height="374" alt="image" src="https://github.com/user-attachments/assets/9f845be3-0bce-43e3-a286-b6080c6ba4a2" />

29. Return to the web server tab that you previously opened and refresh  the page.
You should see the message Hello From Your Web Server!

**Task 3: Resize Your Instance: Instance Type**
As your needs change, you might find that your instance is over-utilized (too small) or under-utilized (too large). If so, you can change the instance type. For example, if a t3.micro instance is too small for its workload, you can change it to an m5.medium instance. 

**Stop Your Instance**
Before you can resize an instance, you must stop it.

 When you stop an instance, it is shut down. There is no charge for a stopped EC2 instance, but the storage charge for attached Amazon EBS volumes remains.

30. On the EC2 Management Console, in the left navigation pane, select Instances.

 Web Server should already be selected.

31. Select Instance state > Stop instance.

33. Select Stop

Your instance will perform a normal shutdown and then will stop running.

34. Wait for the Instance State to display: stopped

**Change The Instance Type**
35. In the Actions  menu, select Instance Settings  Change Instance Type, then configure:

- Instance Type: t3.small
- Choose Change instance type
<img width="1006" height="595" alt="image" src="https://github.com/user-attachments/assets/28fcd631-ad3a-4664-ab3c-66eefb15c0ea" />


**Start the Resized Instance**
You will now start the instance again, which will now have more memory and more disk space.

36. In left navigation pane, select Instances.

37. Select the Web Server instance by checking the box, then navigate to Instance state > Start instance.

**Task 4: Test Termination Protection**
You can delete your instance when you no longer need it. This is referred to as terminating your instance. You cannot connect to or restart an instance after it has been terminated.

In this task, you will learn how to use termination protection.

38. In left navigation pane, select Instances.

39. Select the Web Server instance by checking the box and navigate to the top and select Instance state  menu, select  Terminate (delete) instance.

40. In the Actions  menu, select Instance settings  Change termination protection.

41. Uncheck  Enable followed by Save

   <img width="1147" height="451" alt="image" src="https://github.com/user-attachments/assets/1be13a8e-39b6-4d4d-a0da-56f776308d70" />


43. You can now terminate the instance.

44. In the Actions  menu, select Instance State  Terminate instance.

45. Select Terminate

    <img width="1141" height="457" alt="image" src="https://github.com/user-attachments/assets/adb47cf0-c43d-4cd2-aab5-12ce2b6b5994" />

