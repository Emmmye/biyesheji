package root.model;


import java.util.List;
import java.util.Vector;

public class Project {

    private String id;

    private String project_name;
    private List<String> question_name = new Vector<>();
    private String statu;
    private int questionSize;

    public int getQuestionSize() {
        return questionSize;
    }

    public void setQuestionSize(int questionSize) {
        this.questionSize = questionSize;
    }

    public String getId() {
        return id;
    }

    public List<String> getQuestion_name() {
        return question_name;
    }

    public void setQuestion_name(List<String> question_name) {
        this.question_name = question_name;
    }

    public String getStatu() {
        return statu;
    }

    public void setStatu(String statu) {
        this.statu = statu;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }
}

