# The Littlest JupyterHub deploy to Azure button

![NEW](https://img.shields.io/badge/-NEW-gray.svg?colorB=12CBC4) :sparkles: :sparkles: Now you can install plugins and customise your JupyterHub deployment as per the [instructions in the main TLJH documentation](http://tljh.jupyter.org/en/latest/topic/customizing-installer.html) :sparkles::sparkles:

<table>
 <tr>
 <td align='center' width='100%'>
 <a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Ftrallard%2FTLJH-azure-button%2Fmaster%2Fazuredeploy.json" target="_blank">
 <img src="http://azuredeploy.net/deploybutton.png" alt="Deploy to azure button"/>
 </a>
 </br>
 </br>
 Deploy your own Littlest JupyterHub using the blue button above 👆🏼.
 </td>
 </tr>
 <tr>
 <td align='center' width='100%'>
 This project is licensed under the <a href="https://opensource.org/licenses/MIT" target="_blank"> MIT OSI license. </a>
 <br>
 <a target="_blank" href='https://opensource.org/licenses/MIT'>
 <img src='https://img.shields.io/badge/License-MIT-gray.svg?colorA=2D2A56&colorB=7A76C2&style=flat' width='100' alt="MIT license badge"/>
 </a>
 </td>
 </tr>
</table>

- [The Littlest JupyterHub deploy to Azure button](#the-littlest-jupyterhub-deploy-to-azure-button)
  - [📝 Prerequisites](#%f0%9f%93%9d-prerequisites)
  - [:thinking: What is the Littlest JupyterHub?](#thinking-what-is-the-littlest-jupyterhub)
  - [🔍 What is in this repo?](#%f0%9f%94%8d-what-is-in-this-repo)
  - [💻 How does the Deploy on Azure button work?](#%f0%9f%92%bb-how-does-the-deploy-on-azure-button-work)
  - [✨ Customising the installer](#%e2%9c%a8-customising-the-installer)
  - [🚧 Architecture](#%f0%9f%9a%a7-architecture)
  - [:book: Additional resources](#book-additional-resources)
  - [🖖🏼 Issues and contributing](#%f0%9f%96%96%f0%9f%8f%bc-issues-and-contributing)

## 📝 Prerequisites

You need an Azure account to be able to spin your JupyterHub.

:star: If you do not have an Azure subscription you can get started with a [free Azure subscription with 150 USD](https://azure.microsoft.com/free/?WT.mc_id=TLJHbutton-github-taallard)

## :thinking: What is the Littlest JupyterHub?

A simple JupyterHub distribution for a small (1-100) number of users on a single server. You can find more info about it in the [official docs][TLJH-docs].

## 🔍 What is in this repo?

This repository contains the ARM (Azure Resource Manager) template for the Littlest JupyterHub deployment. This template was created to help you deploy a vanilla Littlest JupyterHub by clicking on the deploy to Azure blue button at the top of this document.

It follows the recommended configuration in the official [The Littlest JupyterHub docs][TLJH-docs] but eliminates the deployment friction by predefining some standard settings.

## 💻 How does the Deploy on Azure button work?

The ARM template contains all the necessary configuration needed to deploy your own Littlest JupyterHub on Azure.

This template follows the configuration detailed in [https://the-littlest-jupyterhub.readthedocs.io/en/latest/install/azure.html](https://the-littlest-jupyterhub.readthedocs.io/en/latest/install/azure.html). But it reduces some of the friction by eliminating the need to create resources manually using the Azure portal.

🚨 Note that you still need to remove your resources manually when you are done using them.

🚧 To deploy your TLJH follow these steps:

1. Create an Azure account (if you need a free one go to 👉🏼 [this link](https://azure.microsoft.com/free/?WT.mc_id=TLJHbutton-github-taallard) 👈🏼)
2. Click on the `Deploy to Azure` button at the top of the Readme. This will redirect you to the Azure portal login page.
3. Login to your account.
4. Fill in the details in the next screen:

![custom template](assets/Custom_deployment_-_Microsoft_Azure.png)

- **Subscription**: choose the subscription you want to use (e.g. Free Trial)
- **Resource group**: this will keep all of our resources together. If you have never created a resource group click on `Create new` and give it a meaningful name (e.g. jupyter-resources)
- **Location**: this is the Azure region where you want all your resources to be (e.g. WestEurope, you can check all the available regions [here](https://azure.microsoft.com/global-infrastructure/services/?products=virtual-machines&WT.mc_id=TLJHbutton-github-taallard))
- **Virtual Machine Name**: the name for your virtual machine
- **Virtual Machine Size**: the workload will determine this. You can check the list of available VM sizes [here](https://docs.microsoft.com/azure/virtual-machines/linux/sizes-general?WT.mc_id=TLJHbutton-github-taallard)
- **Admin UserName**: this will be the root user and is needed for the management of your TLJH
- **Admin password**: choose a secure password for your root user
- **OS Disk Type**: you have the options Standard HDD (LRS), Standard SSD and Premium SSD (for more details see [the docs](https://docs.microsoft.com/azure/virtual-machines/windows/disks-types?WT.mc_id=TLJHbutton-github-taallard))
- **Data Disk Size**: the size of your Data disk size (for more information [visit the docs](https://docs.microsoft.com/azure/virtual-machines/windows/disks-types?WT.mc_id=TLJHbutton-github-taallard))
- **Extra parameters**: additional parameters needed if you want to customise the installer (i.e. adding plugins or installing packages in the user environment). For more details, visit TLJH [documentation on customising the installer](http://tljh.jupyter.org/en/latest/topic/customizing-installer.html). If you are not looking to customise anything leave this blank.

By default, the template allows network traffic through `HTTP` and `https`, do not modify the `network and security group rules`.

5. Once completed, read the terms and conditions and if you are happy with them, go ahead and tick the `I agree to the terms and conditions stated above` box and click on the **Purchase button**.

The deployment will take around 10 minutes - first, all your resources will be deployed, and then THLJ will be installed on your VM.

6. To check your new Virtual Machine Expand the left-hand panel by clicking on the “>>” button on the top left corner of your dashboard. Find the Virtual Machines tab and click on it.

![azure portal vm](https://the-littlest-jupyterhub.readthedocs.io/en/latest/_images/azure-vms.png)

7. Click on your Virtual Machine, copy the **Public IP address** and access it on the web browser.

![ip](https://the-littlest-jupyterhub.readthedocs.io/en/latest/_images/ip-vm.png)

🚨 Note this page will be unavailable during installation. If this happens, give it a bit longer and refresh the page.

Once the installation is complete, you will get a login page like the one below:

<div align="center">
<img src="https://the-littlest-jupyterhub.readthedocs.io/en/latest/_images/first-login.png" alt="login screen"/>
</div>

8. Login using the **admin username and password** you created before
9. Congratulations you have a running working JupyterHub 🎉

👩🏿‍💻✨ You are now ready to add users, install packages and start using your JupyterHub. For instructions on how to do this visit 👉🏼 [the official documentation](https://the-littlest-jupyterhub.readthedocs.io/en/latest/install/azure.html#step-2-adding-more-users)\

## ✨ Customising the installer

You can customise the installer by adding command line parameters. From v1.1.0 you can now add these parameters in the **Extra Parameters** section of the ARM template.

For example, if you want to install Python packages in the user environment from a `requirements.txt` file you can pass the parameter `--user-requirements-txt-URL <url-to-requirements.txt>` where `URL-to-requirements.txt` must be a valid URL:

```sh
--user-requirements-txt-URL https://raw.githubusercontent.com/data-8/materials-sp18/master/requirements.txt
```

⚠️ **Note**

When pointing to a file on GitHub, make sure to use the ‘Raw’ version. It should point to raw.githubusercontent.com, not github.com.

Similarly, if you wanted, for example, to install the [PANGEO stack](https://github.com/yuvipanda/tljh-pangeo) plugin, you can do it by passing the following parameter:

```sh
 --plugin git+https://github.com/yuvipanda/tljh-pangeo@v0.1
```

For more details, visit the [official TLJH documentation](http://tljh.jupyter.org/en/latest/topic/customizing-installer.html).

## 🚧 Architecture
When you deploy a JupyterHub on Azure (either using the Deploy to Azure button or follow the steps from the docs) the following resources are created:

![vms](assets/schematic_hires.png)

They are all grouped in the same region defined for your Resource group.
Also, note that the storage disk created with this template will be of the same type of the `OS disk type` you provide on the template.

If you want to learn more about VM types and sizes, including compatibility between the VMS and storage (standard or premium) you can visit the [official Azure Linux VM documentation](https://docs.microsoft.com/azure/virtual-machines/linux/sizes?WT.mc_id=TLJHbutton-github-taallard).

Details on how to delete and stop your virtual machine can be found at [https://the-littlest-jupyterhub.readthedocs.io/en/latest/howto/providers/azure.html](https://the-littlest-jupyterhub.readthedocs.io/en/latest/howto/providers/azure.html).

If you want to get rid of all the associated resources after you are done with your JupyterHub the easiest way to do it is deleting the resource group altogether (providing you do not have other resources in this group that you might need later).

To delete a resource group:

1. Go to "Resource groups” on the left-hand panel of your Azure Portal.
2. Click on the resource group that contains your JupyterHub resources.
3. Click on “Delete resource group” you will then be asked to confirm the operation. This operation will take between 5 and 10 minutes.

## :book: Additional resources

Here are some links that you might find useful when using the contents in this repo.

:book: [Azure Resource Manger templates docs](https://docs.microsoft.com/azure/azure-resource-manager/template-deployment-overview?WT.mc_id=TLJHbutton-github-taallard)

:book: [The Littlest JupyterHub docs](https://the-littlest-jupyterhub.readthedocs.io/en/latest/index.html)

:book: [VM available regions - Azure docs](https://azure.microsoft.com/global-infrastructure/services/?products=virtual-machines&WT.mc_id=TLJHbutton-github-taallard)

:book: [Azure VM sizes documentation](https://docs.microsoft.com/azure/virtual-machines/linux/sizes-general?WT.mc_id=TLJHbutton-github-taallard)

:book: [Azure VMs disks documentation](https://docs.microsoft.com/azure/virtual-machines/windows/disks-types?WT.mc_id=TLJHbutton-github-taallard)

## 🖖🏼 Issues and contributing

Contributions are welcome. Also, if you encounter any issues, please go ahead and create an issue in this repo.

The detailed contribution guidelines can be found at [CONTRIBUTING](./CONTRIBUTING.md), make sure to have a look first :eyes:

<!-- Links -->

[TLJH-docs]: https://the-littlest-jupyterhub.readthedocs.io/en/latest/index.html
