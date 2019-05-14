package root.model;


import java.util.List;
import java.util.Vector;


public class User {
    private String id;
    private String password;
    private String name;
    private List<String> projects = new Vector<>();
    private int projectSize;

    public int getProjectSize() {
        return projectSize;
    }

    public void setProjectSize(int projectSize) {
        this.projectSize = projectSize;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public List<String> getProjects() {
        return projects;
    }

    public void setProjects(List<String> projects) {
        this.projects = projects;
    }

}
