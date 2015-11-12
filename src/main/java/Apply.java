import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public class Apply {

    public static void ToJob(String jobID, Applicant applicant) {
        Apply apply = new Apply();
        apply.JobID = jobID;
        apply.Applicant = applicant;

        System.out.println("Getting authorization token ----");
        apply.getAccessToken();

        System.out.println("Adding the new job applicant ----");
        apply.addApplication();
    }

    private Apply() {
    }

    private String BaseUrl = "https://login.salesforce.com";
    private String JobID;
    private String ContactID;
    private String AccessToken;
    private Applicant Applicant;

    private void getAccessToken() {
        String url = BaseUrl + "/services/oauth2/token";

        // Create the POST variables for authentication.
        HttpPost post = new HttpPost(url);
        List<BasicNameValuePair> urlParameters = new ArrayList<>();
        urlParameters.add(new BasicNameValuePair("grant_type", "password"));
        urlParameters.add(new BasicNameValuePair("client_id", "3MVG9KI2HHAq33RzoM3XM1_ve.BTvmKqWf5LTX4kabKqEnLGZTqsflAw3xjTlkobXgvh8I2Sh44pQFW4tEOfK"));
        urlParameters.add(new BasicNameValuePair("client_secret", "3631296555188794753"));
        urlParameters.add(new BasicNameValuePair("username", System.getenv("SALESFORCE_USERNAME")));
        urlParameters.add(new BasicNameValuePair("password", System.getenv("SALESFORCE_PASSWORD")));

        try {
            post.setEntity(new UrlEncodedFormEntity(urlParameters));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        String responseBody = new String();

        System.out.println("URL: " + url);

        HttpClient client = HttpClientBuilder.create().build();

        try {
            HttpResponse send = client.execute(post);
            System.out.println("Response Code : " + send.getStatusLine().getStatusCode());

            BufferedReader rd = new BufferedReader(new InputStreamReader(send.getEntity().getContent()));

            StringBuffer result = new StringBuffer();
            String line = "";
            while ((line = rd.readLine()) != null) {
                result.append(line);
            }

            System.out.println("AuthResult" + result.toString());

            responseBody = result.toString();

        } catch (IOException e) {
            e.printStackTrace();
        }

        JSONObject json = new JSONObject(responseBody);
        AccessToken = json.getString("access_token");
        BaseUrl = json.getString("instance_url");
        System.out.println("Access Token: " + AccessToken);
    }

    private void addApplication() {

        String url = BaseUrl + "/services/data/v34.0/sobjects/hr_applicant__c";
        HttpPost post = new HttpPost(url);
        post.addHeader("Authorization", "Bearer " + AccessToken);
        post.setHeader("Content-type", "application/json");

        JSONObject json = new JSONObject();
        json.put("name", Applicant.getName());
        json.put("hr_position__c", JobID);
        json.put("hr_email__c", Applicant.getEmail());
        json.put("hr_resume__c", Applicant.getResume());
        json.put("hr_location__c", "US");
        json.put("hr_status__c", "Review Resume");

        System.out.println("JSON:" + json.toString());

        StringEntity params = null;
        try {
            params = new StringEntity(json.toString());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        HttpClient client = HttpClientBuilder.create().build();
        post.setEntity(params);
        try {
            HttpResponse send = client.execute(post);
            System.out.println("Response Code : " + send.getStatusLine().getStatusCode());

            BufferedReader rd = new BufferedReader(
                    new InputStreamReader(send.getEntity().getContent()));

            StringBuffer result = new StringBuffer();
            String line = "";
            while ((line = rd.readLine()) != null) {
                result.append(line);
            }

            System.out.println(result.toString());

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
