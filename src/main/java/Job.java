public class Job {
    public Job() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        if (description == null) {
            return "";
        } else {
            return description;
        }
    }

    public String getSubDescription() {
        String subDescription = getDescription();
        if (subDescription.length() > 150) {
            return subDescription.substring(0, 150);
        } else {
            return subDescription;
        }
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSFid() {
        return sfid;
    }

    public void setSFid(String sfid) {
        this.sfid = sfid;
    }

    public String getHiringManagerID() {
        return hiringManagerID;
    }

    public void setHiringManagerID(String hiringManagerID) {
        this.hiringManagerID = hiringManagerID;
    }

    public String getLocation() {
        if (location == null) {
            return "";
        } else {
            return location;
        }
    }

    public void setLocation(String location) {
        this.location = location;
    }

    private String sfid;
    private String name;
    private String location;
    private String description;
    private String hiringManagerID;
}
