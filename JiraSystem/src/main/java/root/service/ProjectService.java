package root.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import root.Util.StringAndListUtil;
import root.dao.ProjectDao;
import root.dao.QuestionDao;
import root.dao.UserDao;
import root.model.Question;
import root.model.User;
import root.model.Project;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Vector;

@Service
public class ProjectService {

    private int maxSubject;

    private User employees = new User();
    private Question que = new Question();
    private Project pro = new Project();

    @Autowired
    private UserDao employeesDao;

    @Autowired
    private ProjectDao proDao;

    @Autowired
    private QuestionDao queDao;

    @PostConstruct
    public void init(){
        maxSubject = 5;
    }


    public List<String> getProjectList(){

        List<String> projectList = new Vector<String>();

        projectList = employeesDao.getProjects(employees);
        if (projectList == null || projectList.size() == 0 || projectList.get(0).equals("")) {
            return null;
        }

        return projectList;
    }

    public List<String> getQuestionList(String project){

        List<String> questionList = new Vector<String>();
        pro.setProject_name(project);

        questionList = proDao.getQuestion(pro);
        if (questionList == null || questionList.size() == 0 || questionList.get(0).equals("")) {
            return null;
        }

        return questionList;
    }

    /**
     * 登陆
     */
    public boolean Login(String id, String password){
        employees.setId(id);
        employees.setPassword(password);
        if((employees = employeesDao.isExist(employees)) == null)
            return false;
        return true;
    }

    public String getQuestionInfo(String name) {

        que.setQuestion_name(name);
        String queInfo = queDao.getQueInfo(que);
        if (queInfo == null || queInfo.length() == 0) {
            return null;
        }
        return queInfo;
    }


    public boolean CreateProject(String info){
        List<String> proinfo = StringAndListUtil.strToList(info);
        if(proinfo.size() <= 2){
            return false;
        }
        int i = 0;
        String project_name = "*";
        for(String str:proinfo){
            if(i == 0){
                project_name = str;
                pro.setProject_name(str);
            } else if (i == 1) {
                List<String> queinfo = pro.getQuestion_name();
                queinfo.add(str);
                pro.setQuestion_name(queinfo);
            } else if (i == 2) {
                pro.setStatu(str);
            }
        }
        proDao.UpdateProject(pro);
        List<String> project_name_list = employees.getProjects();
        project_name_list.add(project_name);
        employees.setProjects(project_name_list);
        employeesDao.UpdateUser(employees);
        return true;
    }

    public boolean CreateQuestion(String info){
        List<String> queinfo = StringAndListUtil.strToList(info);
        return true;
    }



    public boolean isExist() { return employees != null;}




}


