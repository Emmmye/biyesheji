package root.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import root.Util.StringAndListUtil;
import root.model.Project;
import root.model.Question;

import java.util.List;

@Repository
public class QuestionDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 添加问题表
     */
    public boolean UpdateQuestion(Question que){
        String sql = "UPDETE jira_system.question SET statu=?, priority=?, accessory_list=?, functionary=?, data_create=?, data_modef=?, id=?, change_record=? WHERE question_name=?";
        String statu = que.getStatu();
        String priority = que.getPriority();
        String accessory_list = StringAndListUtil.listToStr(que.getAccessory_list());
        String functionary = que.getFunctionary();
        String data_create = que.getDate_create();
        String data_modef = que.getDate_modef();
        String id = que.getId();
        String change_record = StringAndListUtil.listToStr(que.getChange_record());
        String question_name = que.getQuestion_name();
        jdbcTemplate.update(sql,statu,priority,accessory_list,functionary,data_create,data_modef,id,change_record,question_name);
        return true;
    }

    /**
     * 获取状态
     */
    public String getStatu(Question que){
        String sql = "SELECT statu FROM jira_system.question WHERE question_name=?";
        String question_name = que.getQuestion_name();
        String result = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result == null) {
            return null;
        }
        return result;
    }

    /**
     * 更新状态
     */
    public boolean UpdateStatu(Question que){
        String sql = "UPDETE jira_system.question SET statu=? WHERE question_name=?";
        String statu = que.getStatu();
        String question_name = que.getQuestion_name();
        jdbcTemplate.update(sql,statu,question_name);
        return true;
    }


    /**
     * 获取优先级
     */
    public String getPriority(Question que){
        String sql = "SELECT priority FROM jira_system.question WHERE question_name=?";
        String question_name = que.getQuestion_name();
        String result = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result == null) {
            return null;
        }
        return result;
    }

    /**
     * 更新优先级
     */
    public boolean UpdatePriority(Question que){
        String sql = "UPDETE jira_system.question SET priority=? WHERE question_name=?";
        String priority = que.getPriority();
        String question_name = que.getQuestion_name();
        jdbcTemplate.update(sql,priority,question_name);
        return true;
    }

    /**
     * 获取附件列表
     */
    public List<String> getAccessoryList(Question que){
        String sql = "SELECT accessory_list FROM jira_system.question WHERE question_name=?";
        String question_name = que.getQuestion_name();
        String result = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result == null) {
            return null;
        }
        return StringAndListUtil.strToList(result);
    }

    /**
     * 更新附件列表
     */
    public boolean UpdateAcccessoryList(Question que){
        String sql = "UPDETE jira_system.question SET accessory_list=? WHERE question_name=?";
        String question_name = que.getQuestion_name();
        String accessory_list = StringAndListUtil.listToStr(que.getAccessory_list());
        jdbcTemplate.update(sql,accessory_list,question_name);
        return true;
    }

    /**
     * 获取经办人
     */
    public String getFunctionary(Question que){
        String sql = "SELECT functionary FROM jira_system.question WHERE question_name=?";
        String question_name = que.getQuestion_name();
        String result = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result == null) {
            return null;
        }
        return result;
    }

    /**
     * 更新经办人
     */
    public boolean UpdateFunctionary(Question que){
        String sql = "UPDETE jira_system.question SET functionary=? WHERE question_name=?";
        String functionary = que.getFunctionary();
        String question_name = que.getQuestion_name();
        jdbcTemplate.update(sql,functionary,question_name);
        return true;
    }

    /**
     * 获取问题创建时间
     */

    public String getDataCreate(Question que){
        String sql = "SELECT data_create FROM jira_system.question WHERE question_name=?";
        String question_name = que.getQuestion_name();
        String result = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result == null) {
            return null;
        }
        return result;
    }

    /**
     * 获取问题修改时间
     */
    public String getDataModef(Question que){
        String sql = "SELECT data_modef FROM jira_system.question WHERE question_name=?";
        String question_name = que.getQuestion_name();
        String result = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result == null) {
            return null;
        }
        return result;
    }

    /**
     * 更新问题修改时间
     */
    public boolean UpdateDataModef(Question que){
        String sql = "UPDETE jira_system.question SET data_modef=? WHERE question_name=?";
        String data_modef = que.getDate_modef();
        String question_name = que.getQuestion_name();
        jdbcTemplate.update(sql,data_modef,question_name);
        return true;
    }

    /**
     * 获取历史记录
     */
    public List<String> getChangeRecord(Question que){
        String sql = "SELECT change_record FROM jira_system.question WHERE question_name=?";
        String question_name = que.getQuestion_name();
        String result = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result == null) {
            return null;
        }
        return StringAndListUtil.strToList(result);
    }

    /**
     * 更新历史记录
     */
     public boolean UpdateChangeRecord(Question que){
     String sql = "UPDETE jira_system.question SET change_record=? WHERE question_name=?";
     String question_name = que.getQuestion_name();
     String change_record = StringAndListUtil.listToStr(que.getChange_record());
     jdbcTemplate.update(sql,change_record,question_name);
     return true;
     }

    /**
     * 获取问题表信息
     * @param naire
     * @return
     */
    public String getQueInfo(Question naire) {
        String sql = "SELECT id FROM jira_system.question WHERE question_name=?";
        String question_name = naire.getQuestion_name();
        String id = naire.getId();
        String result = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if(result == null){
            return null;
        }
        sql = "SELECT statu FROM jira_system.question WHERE question_name=?";
        String result1 = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result1 == null) {
            return result;
        }

        result = result + '\3' + result1;

        sql = "SELECT priority FROM jira_system.question WHERE question_name=?";
        String result2 = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result2 == null) {
            return result;
        }
        result = result + '\3' + result2;

        sql = "SELECT accessory_list FROM jira_system.question WHERE question_name=?";
        String result3 = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result3 == null) {
            return result;
        }
        result = result + '\3' + result3;

        sql = "SELECT functionary FROM jira_system.question WHERE question_name=?";
        String result4 = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result4 == null) {
            return result;
        }
        result = result + '\3' + result4;

        sql = "SELECT date_create FROM jira_system.question WHERE question_name=?";
        String result5 = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result5 == null) {
            return result;
        }
        result = result + '\3' + result5;

        sql = "SELECT date_modef FROM jira_system.question WHERE question_name=?";
        String result6 = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result6 == null) {
            return result;
        }
        result = result + '\3' + result6;


        sql = "SELECT change_record FROM jira_system.question WHERE question_name=?";
        String result7 = jdbcTemplate.queryForObject(sql, new Object[]{ question_name }, String.class);
        if (result7 == null) {
            return result;
        }
        result = result + '\3' + result7;

        return result;
    }

}
