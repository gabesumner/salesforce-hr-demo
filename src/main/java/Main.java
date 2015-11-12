import java.util.*;
import static spark.Spark.*;
import spark.template.freemarker.FreeMarkerEngine;
import spark.ModelAndView;

import static spark.Spark.get;

public class Main {

    public static void main(String[] args) {

        port(Integer.valueOf(System.getenv("PORT") != null ? Integer.valueOf(System.getenv("PORT")) : 8080));
        staticFileLocation("/public");

        // Default Index page, display open job positions
        get("/", (request, response) -> {
            Map<String, Object> attributes = new HashMap<>();
            attributes.put("jobs", Jobs.GetJobs());
            return new ModelAndView(attributes, "index.ftl");
        }, new FreeMarkerEngine());

        // Display job details for a job posting.
        get("/detail/:id", (request, response) -> {
            Map<String, Object> attributes = new HashMap<>();
            Job job = Jobs.GetJob(request.params(":id"));
            attributes.put("job", job);
            return new ModelAndView(attributes, "detail.ftl");
        }, new FreeMarkerEngine());

        // Application form for a job position.
        get("/apply", (request, response) -> {
            Map<String, Object> attributes = new HashMap<>();
            Job job = Jobs.GetJob(request.queryParams("id"));
            attributes.put("job", job);
            return new ModelAndView(attributes, "apply.ftl");
        }, new FreeMarkerEngine());

        // Thank you message after submitting the application.
        post("/apply", (request, response) -> {
            Applicant applicant = new Applicant();
            String id = request.queryParams("id");
            applicant.setName(request.queryParams("name"));
            applicant.setEmail(request.queryParams("email"));
            applicant.setLocation(request.queryParams("location"));
            applicant.setResume(request.queryParams("resume"));
            Apply.ToJob(id, applicant);
            Map<String, Object> attributes = new HashMap<>();
            return new ModelAndView(attributes, "applied.ftl");
        }, new FreeMarkerEngine());

    }

}

