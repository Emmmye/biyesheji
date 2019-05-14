package root.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import root.Util.StringAndListUtil;
import root.model.User;
import root.model.Project;
import root.model.Question;

import java.util.List;

@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 用户是否存在
     * @param employees
     * @return
     */
    public User isExist(User employees) {
        String sql = "SELECT password FROM jira_system.user WHERE id=?";
        String id = employees.getId();
        String password = jdbcTemplate.queryForObject(sql, new Object[]{ id }, String.class);
        if(password == null){
            return null;
        }
        if (password.equals(employees.getPassword())) {
            String sql2 = "SELECT name FROM jira_system.user WHERE id=?";
            User res = new User();
            res.setId(employees.getId());
            res.setPassword(employees.getPassword());
            res.setName(jdbcTemplate.queryForObject(sql2, new Object[]{ id }, String.class));
            return res;
        }
        return null;
    }

    /**
     * 更新当前用户的项目信息（包括添加删除）
     */
    public boolean UpdateUser(User employees){
        String sql = "UPDATE jira_system.user SET project_name=? WHERE id=?";
        String project_name = StringAndListUtil.listToStr(employees.getProjects());
        String id = employees.getId();
        jdbcTemplate.update(sql,  project_name, id);
        return true;
    }

    /**
     * 获取项目
     * @param employees
     * @return
     */
    public List<String> getProjects(User employees) {
        String sql = "SELECT project_name FROM jira_system.user WHERE id=?";
        String id = employees.getId();
        String result = jdbcTemplate.queryForObject(sql, new Object[]{ id }, String.class);
        if (result == null) {
            return null;
        }
        List<String> projects = StringAndListUtil.strToList(result);
        return projects;
    }





}