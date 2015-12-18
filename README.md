# Setup Instructions

1. Login to your Salesforce Org using a System Administrator account or create a new Salesforce Org.

1. Install the [HR Demo package](https://platform-harbor-cruise.herokuapp.com/package) in your Salesforce Org.

1. Download the following CSV files, in the prescribed order, and import the data into your Salesforce Org. using [DataLoader.io](https://dataloader.io/).
   - Import the [Position Data](https://platform-harbor-cruise.herokuapp.com/files/position-data.csv) into the **Position** object.
   - Import the [Applicant Data](https://platform-harbor-cruise.herokuapp.com/files/applicant-data.csv) into the **Applicant** object.
   - Import the [CIO Dashboard Data](https://platform-harbor-cruise.herokuapp.com/files/cio-dashboard-data.csv) into the **CIO Dashboard Data** object.

1. Go to **Administer > Manage Users > Profiles**, click the **System Administrator** link (typically on the second page), scroll down and click **New** in the Login IP Ranges section: Enter **0.0.0.0** for the Start IP Address and **255.255.255.255** for the End IP Address. Click **Save**.

1. Click this [![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/gabesumner/salesforce-hr-demo) button to clone this Heroku project. If you do not already have a Heroku account then sign up for a new free Heroku account, otherwise click **Log In** to use your existing account.

1. Give your new app a name (*this name will become part of the URL, example http://my-app-name.herokuapp.com*). Then use the **SALESFORCE_USERNAME** and **SALESFORCE_PASSWORD** Config Variables to enter the login credentials for your Salesforce Org (the same credentials used in Step 1).

1. *Optionally*, set the **COMPANY_NAME** and **COMPANY_LOGO** *(ideally the company logo should have a transparent background and be 40 pixels in height)*.

1. Click the **Deploy for Free** button, wait for the deployment process to finish, then click **Manage App**.

1. Click **Heroku Connect** then click **Setup Connection** to connect Heroku to your Salesforce Org. Click **Next** then select **Production** and click **Authorize**. Login to your Salesforce Org and authorize Heroku Connect to access your org's data.

1. Click the **Create Mapping** then select (or search for) **HR_Position__c**. Select the following fields:
   - CreatedDate
   - HR_Description__c
   - HR_Location__c
   - HR_Status__c
   - Name

   Check the **Streaming API** checkbox and click the **Save** button.

1. You're finished and can now access your website using the URL: http://your-app-name.herokuapp.com/ *(Replace "your-app-name" with your app name. If you don't know your app name then go to http://heroku.com/ and look at your Dashboard.)*
