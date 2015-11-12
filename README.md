# Setup Instructions

1. Login to your Salesforce Org using a System Administrator account or create a new Salesforce Org.

2. Install the HR Demo package (*<-link coming*) in your Salesforce Org.

3. Go to **Administer > Manage Users > Profiles**, click the **System Administrator** link (typically on the second page), scroll down and click **New** in the Login IP Ranges section: Enter **0.0.0.0** for the Start IP Address and **255.255.255.255** for the End IP Address. Click **Save**.

4. Click this [![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/gabesumner/salesforce-hr-demo) button to clone this Heroku project. If you do not already have a Heroku account then sign up for a new free Heroku account, otherwise click **Log In** to use your existing account.

5. Give your new app a name (*this name will become part of the URL, example http://my-app-name.herokuapp.com*). Then use the **SALESFORCE_USERNAME** and **SALESFORCE_PASSWORD** Config Variables to enter the login credentials for your Salesforce Org (the same credentials used in Step 1).

6. Click the **Deploy for Free** button, wait for the deployment process to finish, then click **Manage App**.

7. Click **Heroku Connect** then click **Setup Connection** to connect Heroku to your Salesforce Org. Click **Next** then select **Production** and click **Authorize**. Login to your Salesforce Org and authorize Heroku Connect to access your org's data.

8. Click the **Create Mapping** then select (or search for) **HR_Position__c**. Select the following fields:
   - CreatedDate
   - HR_Description__c
   - HR_Location__c
   - HR_Status__c
   - Name

   Check the **Streaming API** checkbox and click the **Save** button.

9. You're finished and can now access your website using the URL: http://your-app-name.herokuapp.com/ *(Replace "your-app-name" with your app name. If you don't know your app name then go to http://heroku.com/ and look at your Dashboard.)*
