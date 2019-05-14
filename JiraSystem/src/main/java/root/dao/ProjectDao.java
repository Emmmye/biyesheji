package root.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import root.Util.StringAndListUtil;
import root.model.Project;
import root.model.Question;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ProjectDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 新建项目信息
     */
    public boolean UpdateProject(Project pro){
        String sql = "UPDATE jira_system.project SET statu=? , question_name=? WHERE project_name=?";
        String statu = pro.getStatu();
        String question_name = StringAndListUtil.listToStr(pro.getQuestion_name());
        String project_name = pro.getProject_name();
        jdbcTemplate.update(sql,statu,question_name,project_name);
        return true;
    }

    /**
     * 获取问题
     * @param pro
     * @return
     */
    public List<String> getQuestion(Project pro) {
        String sql = "SELECT question_name FROM jira_system.project WHERE project_name=?";
        String project_name = pro.getProject_name();
        String result = jdbcTemplate.queryForObject(sql, new Object[]{ project_name }, String.class);
        if (result == null) {
            return null;
        }
        List<String> question = StringAndListUtil.strToList(result);
        return question;
    }

    /**
     * 更新问题
     */
    public boolean UpdateQuestion(Project pro){
        String sql = "UPDATE jira_system.project SET question_name=? WHERE project_name=?";
        String question_name = StringAndListUtil.listToStr(pro.getQuestion_name());
        String project_name = pro.getProject_name();
        jdbcTemplate.update(sql,question_name,project_name);
        return true;
    }


    /**
     * 获取状态
     */
    public String getStatu(Project pro) {
        String sql = "SELECT statu FROM jira_system.project WHERE project_name=?";
        String statu = pro.getProject_name();
        String result = jdbcTemplate.queryForObject(sql, new Object[]{ statu }, String.class);
        if (result == null) {
            return null;
        }
        List<String> question = StringAndListUtil.strToList(result);
        return statu;
    }

    /**
     * 更新状态
     */
    public boolean UpdateStatu(Project pro){
        String sql = "UPDATE jira_system.project SET statu=? WHERE project_name=?";
        String statu = pro.getStatu();
        String project_name = pro.getProject_name();
        jdbcTemplate.update(sql,statu,project_name);
        return true;
    }


    /**
     * 获取 SELECT subjects 后的 List<String>
     */
    public static class SubjectsRowMapper implements RowMapper<String> {
        @Override
        public String mapRow(ResultSet rs, int rowNum) throws SQLException {
            String subject = rs.getString("subject");
            return subject;
        }
    }

}
