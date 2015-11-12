
1. Install the HR Demo package (<-link coming) in your Salesforce Org.

2. In your Salesforce Org, go to Administer > Manage Users > Profiles, click the System Administrator link (typically on the second page), scroll down and click New in the Login IP Ranges section: Enter 0.0.0.0 for the Start IP Address and 255.255.255.255 for the End IP Address. Click Save.

3. Click this [![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/gabesumner/salesforce-hr-demo) button to clone this Heroku project.

4. Configure Heroku Connect to connect to your Salesforce Org.

5. Create a Heroku Connect mapping for the "HR_Positions" object. Check the following fields:
** CreatedDate
** HR_Description__c
** HR_Location__c
** HR_Status__c
** Name.

Check the "Streaming API" checkbox.

6. Click Settings for your Heroku app, create 2 new environment variables (SALESFORCE_USERNAME, SALESFORCE_PASSWORD). These variables should contain your Salesforce Org login credentials.

