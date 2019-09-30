
#Login to Azure using powershell
$password = ConvertTo-SecureString 'password' -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ('uname', $password)
Login-AzureRmAccount -Credential $Credential

#Setting up location
$location="West Europe"  

#Create a resource group.  
New-AzureRmResourceGroup -Name $(rgname) -Location $location  

#Create an App Service plan in Free tier.  
New-AzureRmAppServicePlan -Name $(asp) -Location $location -ResourceGroupName $(rgname) -Tier Free  


#Create a web app.   
New-AzureRmWebApp -Name $(app) -Location $location -AppServicePlan $(asp) -ResourceGroupName $(rgname)