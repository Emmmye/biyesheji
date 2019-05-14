package root.model;


import java.util.List;
import java.util.Vector;


public class Question {


    private String id;
    private String question_name;
    private String statu;
    private String priority;
    private String functionary;
    private String date_create;
    private String date_modef;
    private List<String> accessory_list = new Vector<>();
    private List<String> change_record = new Vector<>();



    public String getQuestion_name() {
        return question_name;
    }

    public void setQuestion_name(String name) {
        this.question_name = name;
    }

    public String getStatu() {
        return statu;
    }

    public void setStatu(String statu) {
        this.statu = statu;
    }

    public String getPriority() {
        return priority;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<String> getAccessory_list() {
        return accessory_list;
    }

    public void setAccessory_list(List<String> accessory_list) {
        this.accessory_list = accessory_list;
    }

    public List<String> getChange_record() {
        return change_record;
    }

    public void setChange_record(List<String> change_record) {
        this.change_record = change_record;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }



    public String getFunctionary() {
        return functionary;
    }

    public void setFunctionary(String functionary) {
        this.functionary = functionary;
    }


    public String getDate_create() {
        return date_create;
    }

    public void setDate_create(String date_create) {
        this.date_create = date_create;
    }

    public String getDate_modef() {
        return date_modef;
    }

    public void setDate_modef(String date_modef) {
        this.date_modef = date_modef;
    }

}
