import java.net.URI;
import java.sql.*;
import java.util.ArrayList;
import com.heroku.sdk.jdbc.DatabaseUrl;

public class Jobs {

    public static ArrayList<Job> GetJobs() {
        ArrayList<Job> jobs = new ArrayList<Job>();
        Connection connection = null;

        try {
            connection = getDBConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM salesforce.hr_position__c WHERE hr_status__c = 'Open - Approved'");

            while (rs.next()) {
                Job job = convertResultSetToJob(rs);
                jobs.add(job);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
            return new ArrayList<>();
        } finally {
            if (connection != null) try {
                connection.close();
            } catch (SQLException e) {
            }
            return jobs;
        }
    }

    public static Job GetJob(String sfid) {
        Job job = new Job();
        Connection connection = null;

        try {
            connection = getDBConnection();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM salesforce.hr_position__c WHERE sfid = ?");
            stmt.setString(1, sfid);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                job = convertResultSetToJob(rs);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
            return job;
        } finally {
            if (connection != null) try {
                connection.close();
            } catch (SQLException e) {
            }
            return job;
        }
    }

    private static Connection getDBConnection() {
        Connection connection = null;
        try {
            URI dbUri = new URI(System.getenv("DATABASE_URL"));
            String username = dbUri.getUserInfo().split(":")[0];
            String password = dbUri.getUserInfo().split(":")[1];
            String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath() + "?user=" + username + "&password=" + password + "&ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory";
            connection = DriverManager.getConnection(dbUrl);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return connection;
    }

    private static Job convertResultSetToJob(ResultSet rs) {
        Job job = new Job();
        try {
            job.setSFid(rs.getString("sfid"));
            job.setName(rs.getString("name"));
            job.setLocation(rs.getString("hr_location__c"));
            job.setDescription(rs.getString("hr_description__c"));
        } catch (Exception e) {
            System.out.println(e.toString());
            return job;
        }
        return job;
    }
}
