package root.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import root.Util.StringAndListUtil;
import root.service.ProjectService;

import java.util.*;

@Controller("displayController")
public class DispalyController {
    @Autowired
    private ProjectService projectService;


    @RequestMapping(value = {"/"}, method ={RequestMethod.GET})
    public ModelAndView Home() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping(value = {"/login"}, method = {RequestMethod.POST})
    public ModelAndView Login(@RequestParam(value = "id") String id, @RequestParam(value = "password") String password) {
        ModelAndView modelAndView = new ModelAndView();

        System.out.println("##########################################");

        boolean res = projectService.Login(id, password);
        if (res == false) {
            modelAndView.setViewName("loginfailed");
        }
//        else {
//            List<String> project = projectService.getProjectList();
//            List<String> question = projectService.getQuestionList();
//            if (project == null || project.size() == 0 || project.get(0).equals("")) {
//                modelAndView.setViewName("employees");
//            } else {
//                modelAndView.addObject("list", project);
//                modelAndView.addObject("list", question);
//                modelAndView.setViewName("employees");
//            }
//        }
        modelAndView.setViewName("project");
        return modelAndView;
    }


    @RequestMapping(value = "/getinfo", method = RequestMethod.GET, produces="text/html;charset=UTF-8")
    @ResponseBody
    public String GetInfo() {
        List<String> projectList = projectService.getProjectList();
        if (projectList == null || projectList.size() == 0 || projectList.get(0).equals("")) {
            return "nosubjects";
        }

        return StringAndListUtil.listToStr(projectList);
    }


    @RequestMapping(value = "/getqueinfo", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
    @ResponseBody
    public String GetQueInfo(@RequestParam(value = "question") String name){
        String res = name;
        String queInfo = projectService.getQuestionInfo(name);

        res = res + '\3' + queInfo;
        System.out.println(res);
        return res;
    }





    @RequestMapping(value = "/add", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
    @ResponseBody
    public String AddSubject(@RequestParam(value = "project") String project) {

        List<String> question = projectService.getQuestionList(project);
        if (question == null || question.size() == 0 || question.get(0).equals("")) {
            return "nosubjects";
        }
        return StringAndListUtil.listToStr(question);
    }







}



