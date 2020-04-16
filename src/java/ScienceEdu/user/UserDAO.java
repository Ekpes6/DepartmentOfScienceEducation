/*
    Document   : UserDAO
    Created on : Jul 18, 2019, 4:22:14 PM
    Author     : EKPES
 */
package ScienceEdu.user;

import ScienceEdu.database.DBConfiguration;
import ScienceEdu.security.DigestMatcher;
import ScienceEdu.utility.DateTimeUtility;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author EKPES
 * @since Jul 20, 2019 1:34:17 PM
 */
public class UserDAO
{
    public static User authenticateUser(String emailAddress, String password)
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        String sql = "SELECT * FROM `users` WHERE `email` = ?";
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, emailAddress);
            ResultSet rs = pst.executeQuery();
            DigestMatcher matcher;
            if(rs.next())
            {
                matcher = new DigestMatcher();
                String salt = matcher.getSalt(rs.getString("password"));
                boolean matched = matcher.doMatch(password, salt);
                if(matched)
                    return getUser(rs);
                return null;
            }
            else
                return null;
        }

    }

    private static User getUser(ResultSet rs) throws SQLException
    {
        User user = new User();
        user.setRole(rs.getString("role"));
        return user;
    }

    public static boolean registerLecturer(User user, String encPassword) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "INSERT INTO `science_education`.`general_info`(`first_name`, `last_name`, `other_name`, `email`, `role`, `date_time` ) VALUES(?, ?, ?, ?, ?, ?)";

            String sql2 = "SELECT id FROM `science_education`.`general_info` WHERE  `email` = ?";
            String sql3 = "INSERT INTO `correspondence_address`(`general_infoId`, `gender`, `marital_status`, `date_of_birth`, `address`, `city`, `phone_no` ) VALUES(?, ?, ?, ?, ?, ?, ?)";

            String sql4 = "INSERT INTO `lecturer_info`(`general_infoId`, `password`, `designation` ) VALUES(?, ?, ?)";
            String sql5 = "INSERT INTO `academic_info_two`(`general_infoId`, `highest_level_of_education`, `major_field_of_study`, `institution_attended`, `all_academic_certificates`, `rank_one`, `rank_two` ) VALUES(?, ?, ?, ?, ?, ?, ?)";
            String sql6 = "INSERT INTO `image_info`(`general_infoId`, `image_name`, `date_created` ) VALUES(?, ?, ?)";
            PreparedStatement pst1 = conn.prepareStatement(sql);
            pst1.setString(1, user.getFirst_name());
            pst1.setString(2, user.getLast_name());
            pst1.setString(3, user.getOther_name());
            pst1.setString(4, user.getEmail());
            pst1.setString(5, user.getRole());
            pst1.setTimestamp(6, timestamp, cal);
            int update1 = pst1.executeUpdate();
            PreparedStatement pst4;
            if(update1 == 1)
            {
                pst4 = conn.prepareStatement(sql2);
                pst4.setString(1, user.getEmail());
                ResultSet result2 = pst4.executeQuery();
                int Idn;
                if(result2.next())
                {
                    Idn = result2.getInt("id");
                    PreparedStatement pst5;
                    if(Idn != 0)
                    {
                        pst5 = conn.prepareStatement(sql3);
                        pst5.setInt(1, Idn);
                        pst5.setString(2, user.getGender());
                        pst5.setString(3, user.getMarital_status());
                        pst5.setString(4, user.getDate_of_birth());
                        pst5.setString(5, user.getAddress());
                        pst5.setString(6, user.getCity());
                        pst5.setString(7, user.getPhone());
                        int update2 = pst5.executeUpdate();
                        PreparedStatement pst6;
                        if(update2 == 1)
                        {
                            pst6 = conn.prepareStatement(sql4);
                            pst6.setInt(1, Idn);
                            pst6.setString(2, encPassword);
                            pst6.setString(3, user.getDesignation());
                            int update3 = pst6.executeUpdate();
                            PreparedStatement pst7;
                            if(update3 == 1)
                            {
                                pst7 = conn.prepareStatement(sql5);
                                pst7.setInt(1, Idn);
                                pst7.setString(2, user.getHighest_level_education());
                                pst7.setString(3, user.getMajor_field_of_study());
                                pst7.setString(4, user.getInstitution_attended());
                                pst7.setString(5, user.getAll_academic_certificates());
                                pst7.setString(6, user.getRank_one());
                                pst7.setString(7, user.getRank_two());
                                int update4 = pst7.executeUpdate();
                                PreparedStatement pst8;
                                if(update4 == 1)
                                {
                                    pst8 = conn.prepareStatement(sql6);
                                    pst8.setInt(1, Idn);
                                    pst8.setString(2, user.getImage_name());
                                    pst8.setTimestamp(3, timestamp, cal);
                                    int update5 = pst8.executeUpdate();
                                    return update5 == 1;
                                }
                                else
                                    return false;
                            }
                            return false;
                        }
                        else
                            return false;
                    }
                    else
                        return false;
                }
                else
                    return false;
            }
            else
                return false;
        }

    }

    public static User authenticateUser2(String emailAddress) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        String sql = "SELECT `role` FROM `general_info` WHERE `email` = ?";
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, emailAddress);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
                return getUser1(rs);
            return null;
        }
    }

    private static User getUser1(ResultSet rs) throws SQLException
    {
        User user = new User();
        user.setRole(rs.getString("role"));
        return user;
    }

    private static User getId(ResultSet rs) throws SQLException
    {
        User user = new User();
        user.setId(rs.getInt("id"));
        return user;
    }

    public static User GetId(String emailAddress) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        String sql = "SELECT `id` FROM `general_info` WHERE `email` = ?";
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, emailAddress);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
                return getId(rs);
            return null;
        }
    }

    public static User authenticateUserAdmin(String emailAddress, String password, String admin) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        String sql = "SELECT `general_info`.`id`,`first_name`, `last_name`, `other_name`, `email`,`role`, `date_time`, `password`, `designation`, "
                + "`correspondence_address`.`gender`, `correspondence_address`.`marital_status`, `correspondence_address`.`date_of_birth`,"
                + "`correspondence_address`.`address`, `correspondence_address`.`city`, `correspondence_address`.`phone_no`,"
                + "`academic_info_two`.`highest_level_of_education`, `academic_info_two`.`major_field_of_study`, `academic_info_two`.`institution_attended`, "
                + "`academic_info_two`.`all_academic_certificates`, `academic_info_two`.`rank_one`, `academic_info_two`.`rank_two`, `image_info`.`image_name`, "
                + "`image_info`.`date_created`"
                + "FROM `general_info` "
                + "INNER JOIN `lecturer_info` on `general_info`.`id` = `lecturer_info`.`general_infoId` "
                + "INNER JOIN `correspondence_address`  on `general_info`.`id`= `correspondence_address`.`general_infoId` "
                + "INNER JOIN `academic_info_two` ON `academic_info_two`.`general_infoId`= `general_info`.`id`"
                + "INNER JOIN `image_info` ON `image_info`.`general_infoId`= `general_info`.`id` "
                + "WHERE `email`=? AND `role`=?";

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, emailAddress);
            pst.setString(2, admin);
            ResultSet rs = pst.executeQuery();
            DigestMatcher matcher;
            if(rs.next())
            {
                matcher = new DigestMatcher();
                String salt = matcher.getSalt(rs.getString("password"));
                boolean matched = matcher.doMatch(password, salt);
                if(matched)
                    return getUserAdmin(rs);
                return null;
            }

            return null;
        }

    }

    private static User getUserAdmin(ResultSet rs) throws SQLException
    {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setFirst_name(rs.getString("first_name"));
        user.setLast_name(rs.getString("last_name"));
        user.setOther_name(rs.getString("other_name"));
        user.setGender(rs.getString("gender"));
        user.setMarital_status(rs.getString("marital_status"));
        user.setEmail(rs.getString("email"));
        user.setRole(rs.getString("role"));
        user.setDesignation(rs.getString("designation"));

        user.setDate_created(rs.getString("date_time"));
        user.setDate_of_birth(rs.getString("date_of_birth"));
        user.setAddress(rs.getString("address"));
        user.setCity(rs.getString("city"));
        user.setPhone(rs.getString("phone_no"));
        user.setHighest_level_education(rs.getString("highest_level_of_education"));
        user.setMajor_field_of_study(rs.getString("major_field_of_study"));
        user.setInstitution_attended(rs.getString("institution_attended"));
        user.setAll_academic_certificates(rs.getString("all_academic_certificates"));
        user.setRank_one(rs.getString("rank_one"));
        user.setRank_two(rs.getString("rank_two"));
        user.setImage_name(rs.getString("image_name"));
        user.setGen_info_id(rs.getInt("id"));

        return user;
    }

    public static User authenticateStudent(String matric_no, String pin, String student) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        User user = new User();
        String sql = "SELECT  `general_info`.`id`,`general_info`.`first_name`,`general_info`.`last_name`,`general_info`.`other_name`,`general_info`.`email`,"
                + "`general_info`.`role`,`general_info`.`date_time`,`correspondence_address`.`gender`,`correspondence_address`.`marital_status`,"
                + "`correspondence_address`.`date_of_birth`,`correspondence_address`.`address`,`correspondence_address`.`city`,`correspondence_address`.`phone_no`, `image_info`.`image_name`,`image_info`.`date_created` "
                + "`academic_info`.`academic_session`, `academic_info`.`unit`,`academic_info`.`current_level`, `academic_info`.`department`, `academic_info`.`faculty`, `academic_info`.`matric_no`"
                + "FROM `general_info` "
                + "INNER JOIN `correspondence_address` "
                + "ON `general_info`.`id`= `correspondence_address`.`general_infoId` "
                + "INNER JOIN `image_info` "
                + "ON `image_info`.`general_infoId`= `general_info`.`id`"
                + "INNER JOIN `academic_info` "
                + "ON `general_info`.`id`= `academic_info`.`general_infoId` "
                + "WHERE `general_info`.`id`=? ";

        String sql2 = "SELECT * FROM `academic_info` WHERE `matric_no`=? ";
        String sql3 = "SELECT `pin_code` FROM `pin` WHERE `pin_code`=? ";
        String sql4 = "UPDATE `pin` SET `status`='Used' WHERE `pin_code`=?";

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            PreparedStatement pst = conn.prepareStatement(sql2);
            pst.setString(1, matric_no);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
                int id = rs.getInt("general_infoId");
                String academic_session = rs.getString("academic_session");
                String current_level = rs.getString("current_level");

                PreparedStatement pst1 = conn.prepareStatement(sql3);
                pst1.setString(1, pin);
                ResultSet rs1 = pst1.executeQuery();
                if(rs1.next())
                {
                    PreparedStatement pst2 = conn.prepareStatement(sql);
                    pst2.setInt(1, id);
                    ResultSet rs2 = pst2.executeQuery();
                    if(rs2.next())
                    {
                        PreparedStatement pst3 = conn.prepareStatement(sql4);
                        pst3.setString(1, pin);
                        int update = pst3.executeUpdate();
                        if(update == 1)
                        {

                            String first_name = rs2.getString("first_name");
                            String last_name = rs2.getString("last_name");
                            String other_name = rs2.getString("other_name");
                            String email = rs2.getString("email");
                            String role = student;
                            String date_time = rs2.getString("date_time");
                            String gender = rs2.getString("gender");
                            String marital_status = rs2.getString("marital_status");
                            String date_of_birth = rs2.getString("date_of_birth");
                            String address = rs2.getString("address");
                            String city = rs2.getString("city");
                            String phone_no = rs2.getString("phone_no");
                            String image_name = rs2.getString("image_name");

                            String unit = rs2.getString("unit");
                            String faculty = rs2.getString("faculty");
                            String department = rs2.getString("department");

                            user.setId(id);
                            user.setFirst_name(first_name);
                            user.setLast_name(last_name);
                            user.setOther_name(other_name);
                            user.setEmail(email);
                            user.setRole(role);
                            user.setDate_created(date_time);
                            user.setGender(gender);
                            user.setMarital_status(marital_status);
                            user.setDate_of_birth(date_of_birth);
                            user.setAddress(address);
                            user.setCity(city);
                            user.setUnit(unit);
                            user.setDepartment(department);
                            user.setFaculty(faculty);
                            user.setPhone(phone_no);
                            user.setImage_name(image_name);
                            user.setAcademic_session(academic_session);
                            user.setCurrent_level(current_level);
                            user.setMatric_no(matric_no);
                        }
                    }
                }
            }
        }
        return user;
    }

    public static boolean insertPins(int Id, List<String> generatedPins)
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();
        int noOfInserts = 0;
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `status` FROM `pin` WHERE `status`= ?";
            String sqlR = "INSERT INTO `science_education`.`pin` (`pin_code`, `general_infoId`, `status`,`date_generated`) VALUES (?, ?, ?, ?);";
            String status = "Unused";
            PreparedStatement pst2 = conn.prepareStatement(sql);
            pst2.setString(1, status);
            ResultSet result = pst2.executeQuery();
            int count = 0;
            result.last();
            count = result.getRow();
            result.beforeFirst();

            if(count >= 20)
                return false;

            PreparedStatement pst1 = conn.prepareStatement(sqlR);
            for(String pin : generatedPins)
            {
                pst1.setString(1, pin);
                pst1.setInt(2, Id);
                pst1.setString(3, status);
                pst1.setTimestamp(4, timestamp, cal);
                noOfInserts += pst1.executeUpdate();
            }
            return noOfInserts > 0;
        }
    }

    public static List<User> getAllGeneratedPins()
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `general_info`.`first_name`, `pin`.`general_infoId`,`pin`.`pin_code` , `pin`.`status`, `pin`.`date_generated` FROM `general_info` INNER JOIN `pin` ON `general_info`.`id` = `pin`.`general_infoId`";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<User> allPinids = new ArrayList<>();
            while(rs.next())
                allPinids.add(getAllPins(rs));
            return allPinids;
        }
    }

    public static List<User> getAllCourseInfo()
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT * FROM `course_info`";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<User> allcourseinfo = new ArrayList<>();
            while(rs.next())
                allcourseinfo.add(getAllCourse(rs));
            return allcourseinfo;
        }
    }

    public static List<User> getAllStudent()
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `general_info`.`id`,`first_name`,`last_name`,`other_name`,`email`,`role`,`date_time`,"
                    + " `correspondence_address`.`gender`, `correspondence_address`.`marital_status`, `correspondence_address`.`date_of_birth`,"
                    + " `correspondence_address`.`address`, `correspondence_address`.`city`, `correspondence_address`.`phone_no`, "
                    + "`academic_info`.`academic_session`, `academic_info`.`unit`, `academic_info`.`current_level`, `academic_info`.`department`, `academic_info`.`faculty`, "
                    + "`academic_info`.`matric_no`, `image_info`.`image_name`, `image_info`.`date_created`"
                    + "FROM `general_info`"
                    + "Inner JOIN `correspondence_address` on `general_info`.`id`= `correspondence_address`.`general_infoId`"
                    + "INNER JOIN `academic_info` ON `academic_info`.`general_infoId`= `general_info`.`id`"
                    + "INNER JOIN `image_info` ON `image_info`.`general_infoId`= `general_info`.`id`"
                    + "WHERE`general_info`.`role`='student'";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<User> allstudents = new ArrayList<>();
            while(rs.next())
                allstudents.add(getAllStudents(rs));
            return allstudents;
        }
    }

    public static List<User> getAllExamScore()
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT * FROM `academic_exams_result`";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<User> allExamScore = new ArrayList<>();
            while(rs.next())
                allExamScore.add(getAllExamScore0(rs));
            return allExamScore;
        }
    }

    public static List<User> getAllStudent2(String id, String first_name, String last_name, String other_name, String imageName, String academic_session, String unit, String current_level, String matric_no, String date_of_birth, String email, String role, String gender, String marital_status,
            String address, String city, String phone, String department, String faculty, String genId)
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `general_info`.`id`,`first_name`,`last_name`,`other_name`,`email`,`role`,`date_time`,"
                    + " `correspondence_address`.`gender`, `correspondence_address`.`marital_status`, `correspondence_address`.`date_of_birth`,"
                    + " `correspondence_address`.`address`, `correspondence_address`.`city`, `correspondence_address`.`phone_no`, "
                    + "`academic_info`.`academic_session`, `academic_info`.`unit`, `academic_info`.`current_level`, `academic_info`.`department`, `academic_info`.`faculty`, "
                    + "`academic_info`.`matric_no`, `image_info`.`image_name`, `image_info`.`date_created`"
                    + "FROM `general_info`"
                    + "INNER JOIN `correspondence_address` on `general_info`.`id`= `correspondence_address`.`general_infoId`"
                    + "INNER JOIN `academic_info` ON `academic_info`.`general_infoId`= `general_info`.`id`"
                    + "INNER JOIN `image_info` ON `image_info`.`general_infoId`= `general_info`.`id`"
                    + "WHERE`general_info`.`role`='student' AND `general_info`.`id` LIKE '" + id + "%' AND `general_info`.`first_name` LIKE '" + first_name + "%' AND `general_info`.`last_name` LIKE '" + last_name + "%'  "
                    + "AND `general_info`.`other_name` LIKE '" + other_name + "%'  AND `academic_info`.`academic_session` LIKE '" + academic_session + "%' AND `academic_info`.`unit` LIKE '" + unit + "%' AND `academic_info`.`current_level` LIKE '" + current_level + "%' "
                    + "AND `academic_info`.`matric_no` LIKE '" + matric_no + "%' AND `correspondence_address`.`date_of_birth` LIKE '" + date_of_birth + "%' AND `general_info`.`email` LIKE '" + email + "%'"
                    + " AND `general_info`.`role` LIKE '" + role + "%' AND `correspondence_address`.`gender` LIKE '" + gender + "%' "
                    + "AND `correspondence_address`.`marital_status` LIKE '" + marital_status + "%' AND `correspondence_address`.`address` LIKE '" + address + "%' AND `correspondence_address`.`city` LIKE '" + city + "%' "
                    + "AND `correspondence_address`.`phone_no` LIKE '" + phone + "%'  AND `academic_info`.`department` LIKE '" + department + "%' AND `academic_info`.`faculty` LIKE '" + faculty + "%' "
                    + "AND `image_info`.`image_name` LIKE '" + imageName + "%' AND `correspondence_address`.`general_infoId` LIKE '" + genId + "%' ORDER BY `general_info`.`last_name` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<User> allstudents = new ArrayList<>();
            while(rs.next())
                allstudents.add(getAllStudents(rs));
            return allstudents;
        }
    }

    public static List<User> getAllExamScore3(String full_name, String matric_no, String ca, String exam, String total, String grade, String remark)
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `sn`, `full_name`, `matric_no`, `session`, `semester`, `course_code`, `course_title`, `credit_hrs`, `continous_assesment`, "
                    + "`exam_score`, `total_score`, `grade`, `remark`, `date_entered` "
                    + "FROM `academic_exams_result` "
                    + "WHERE `full_name` LIKE '" + full_name + "%' AND `matric_no`LIKE '" + matric_no + "%' "
                    + "AND `continous_assesment` LIKE '" + ca + "%' AND `exam_score` LIKE '" + exam + "%' "
                    + "AND `total_score` LIKE '" + total + "%' AND `grade` LIKE '" + grade + "%' "
                    + "AND `remark` LIKE '" + remark + "%' ORDER BY `academic_exams_result`.`full_name` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<User> allExamScores = new ArrayList<>();
            while(rs.next())
                allExamScores.add(getAllExamScore0(rs));
            return allExamScores;
        }
    }

    //delete exceptions log from the database
    public static boolean DeleteStudentRedcord(int id) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        //Calendar cal = DateTimeUtility.getTodayTimeZone();
        //Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection())
        {
            String sql = "DELETE FROM `general_info` WHERE `id`= ?";
            String sql2 = "DELETE FROM `correspondence_address` WHERE `general_infoId`= ?";
            String sql3 = "DELETE FROM `academic_info` WHERE `general_infoId`= ?";
            String sql4 = "DELETE FROM `image_info` WHERE `general_infoId`= ?";

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            int update1 = pst.executeUpdate();
            PreparedStatement pst2 = conn.prepareStatement(sql2);
            if(update1 == 1)
                pst2.setInt(1, id);
            int update2 = pst2.executeUpdate();
            PreparedStatement pst3 = conn.prepareStatement(sql3);
            if(update2 == 1)
                pst3.setInt(1, id);
            int update3 = pst3.executeUpdate();
            PreparedStatement pst4 = conn.prepareStatement(sql4);
            if(update3 == 1)
                pst4.setInt(1, id);
            int update4 = pst4.executeUpdate();
            if(update4 == 1)
                return update4 == 1;
            else
                return false;

        }

    }

    //delete exceptions log from the database
    public static boolean DeleteCourseInfo(int id) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        //Calendar cal = DateTimeUtility.getTodayTimeZone();
        //Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection())
        {
            String sql = "DELETE FROM `course_info` WHERE `sn`= ?";

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            int update1 = pst.executeUpdate();
            if(update1 == 1)
                return update1 == 1;
            else
                return false;

        }

    }

    //delete exceptions log from the database
    public static boolean DeleteExamInfo(int id) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        //Calendar cal = DateTimeUtility.getTodayTimeZone();
        //Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection())
        {
            String sql = "DELETE FROM `academic_exams_result` WHERE `sn`=?";

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            int update1 = pst.executeUpdate();
            if(update1 == 1)
                return update1 == 1;
            else
                return false;

        }

    }

    public static List<User> getAllStudentsNames() throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `other_name`,`last_name`,`first_name` FROM `general_info` WHERE `role`='student' ORDER BY `general_info`.`last_name` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<User> allNamesOFStudent = new ArrayList<>();
            while(rs.next())
                allNamesOFStudent.add(getAllNamesOfStudentRec(rs));
            return allNamesOFStudent;
        }

    }

    private static User getAllNamesOfStudentRec(ResultSet rs) throws SQLException
    {
        User user = new User();
        user.setFirst_name(rs.getString("first_name"));
        user.setLast_name(rs.getString("last_name"));
        user.setOther_name(rs.getString("other_name"));

        return user;
    }

    public static List<User> getAllLecturerStaff()
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `general_info`.`id`,`first_name`,`last_name`,`other_name`,`email`,`role`,`date_time`, `designation`,"
                    + " `correspondence_address`.`gender`, `correspondence_address`.`marital_status`, `correspondence_address`.`date_of_birth`,"
                    + " `correspondence_address`.`address`, `correspondence_address`.`city`, `correspondence_address`.`phone_no`, "
                    + "`academic_info_two`.`highest_level_of_education`, `academic_info_two`.`major_field_of_study`, `academic_info_two`.`institution_attended`, `academic_info_two`.`all_academic_certificates`, "
                    + "`academic_info_two`.`rank_one`, `academic_info_two`.`rank_two`, `image_info`.`image_name`, `image_info`.`date_created`"
                    + "FROM `general_info`"
                    + "INNER JOIN `lecturer_info` on `general_info`.`id`= `lecturer_info`.`general_infoId`"
                    + "INNER JOIN `correspondence_address` on `general_info`.`id`= `correspondence_address`.`general_infoId`"
                    + "INNER JOIN `academic_info_two` ON `academic_info_two`.`general_infoId`= `general_info`.`id`"
                    + "INNER JOIN `image_info` ON `image_info`.`general_infoId`= `general_info`.`id`"
                    + "WHERE `general_info`.`role`='HOD' OR `general_info`.`role`='Lecturer' OR `general_info`.`role`='Staff' OR `general_info`.`role`='Exam Officer'";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<User> allstudents = new ArrayList<>();
            while(rs.next())
                allstudents.add(getAllLecturerStaff(rs));
            return allstudents;
        }
    }

    private static User getAllPins(ResultSet rs) throws SQLException
    {
        User user = new User();
        user.setFirst_name(rs.getString("first_name"));
        user.setGen_info_id(rs.getInt("general_infoId"));
        user.setPin(rs.getString("pin_code"));
        user.setStatus(rs.getString("status"));
        user.setDate_generated(rs.getString("date_generated"));

        return user;
    }

    private static User getAllCourse(ResultSet rs) throws SQLException
    {
        User user = new User();
        user.setCourse_infoId(rs.getInt("sn"));
        user.setCourse_code(rs.getString("course_code"));
        user.setCourse_title(rs.getString("course_title"));
        user.setCredit_hrs(rs.getString("credit_hrs"));
        user.setCourse_date(rs.getString("course_date"));

        return user;
    }

    private static User getAllLecturerStaff(ResultSet rs) throws SQLException
    {
        User user = new User();
        user.setFirst_name(rs.getString("first_name"));
        user.setLast_name(rs.getString("last_name"));
        user.setOther_name(rs.getString("other_name"));
        user.setEmail(rs.getString("email"));
        user.setRole(rs.getString("role"));
        user.setDate_created(rs.getString("date_time"));
        user.setGender(rs.getString("gender"));
        user.setMarital_status(rs.getString("marital_status"));
        user.setDate_of_birth(rs.getString("date_of_birth"));
        user.setAddress(rs.getString("address"));
        user.setCity(rs.getString("city"));
        user.setPhone(rs.getString("phone_no"));
        user.setDesignation(rs.getString("designation"));
        user.setHighest_level_education(rs.getString("highest_level_of_education"));
        user.setMajor_field_of_study(rs.getString("major_field_of_study"));
        user.setInstitution_attended(rs.getString("institution_attended"));
        user.setAll_academic_certificates(rs.getString("all_academic_certificates"));
        user.setRank_one(rs.getString("rank_one"));
        user.setRank_two(rs.getString("rank_two"));
        user.setImage_name(rs.getString("image_name"));
        user.setGen_info_id(rs.getInt("id"));

        return user;
    }

    private static User getAllStudents(ResultSet rs) throws SQLException
    {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setFirst_name(rs.getString("first_name"));
        user.setLast_name(rs.getString("last_name"));
        user.setOther_name(rs.getString("other_name"));
        user.setImage_name(rs.getString("image_name"));
        user.setEmail(rs.getString("email"));
        user.setRole(rs.getString("role"));
        user.setDate_created(rs.getString("date_time"));
        user.setGender(rs.getString("gender"));
        user.setMarital_status(rs.getString("marital_status"));
        user.setDate_of_birth(rs.getString("date_of_birth"));
        user.setAddress(rs.getString("address"));
        user.setCity(rs.getString("city"));
        user.setPhone(rs.getString("phone_no"));
        user.setAcademic_session(rs.getString("academic_session"));
        user.setUnit(rs.getString("unit"));
        user.setCurrent_level(rs.getString("current_level"));
        user.setDepartment(rs.getString("department"));
        user.setFaculty(rs.getString("faculty"));
        user.setMatric_no(rs.getString("matric_no"));
        user.setGen_info_id(rs.getInt("id"));

        return user;
    }

    private static User getAllExamScore0(ResultSet rs) throws SQLException
    {
        User user = new User();
        user.setExamId(rs.getInt("sn"));
        user.setFull_name(rs.getString("full_name"));
        user.setMatric_no(rs.getString("matric_no"));
        user.setAcademic_session(rs.getString("session"));
        user.setSemester(rs.getString("semester"));
        user.setCourse_code(rs.getString("course_code"));
        user.setCourse_title(rs.getString("course_title"));
        user.setCredit_hrs(rs.getString("credit_hrs"));
        user.setContinous_assesment(rs.getInt("continous_assesment"));
        user.setExam_score(rs.getInt("exam_score"));
        user.setTotal_score(rs.getInt("total_score"));
        user.setGrade(rs.getString("grade"));
        user.setRemark(rs.getString("remark"));
        user.setDate_created(rs.getString("date_entered"));

        return user;
    }

    public static boolean SaveImageName(int id, List<String> fileNames) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String fileName = fileNames.get(0);
            String sqlR = "INSERT INTO `science_education`.`image_info` (`general_infoId`, `image_name`, `date_created`) VALUES (?, ?, ?);";

            PreparedStatement pst9 = conn.prepareStatement(sqlR);
            pst9.setInt(1, id);
            pst9.setString(2, fileName);
            pst9.setTimestamp(3, timestamp, cal);
            int update7 = pst9.executeUpdate();
            if(update7 == 1)
                return update7 == 1;
            return false;
        }
    }

    public static boolean UpdateImageName(int id, List<String> fileNames) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String fileName = fileNames.get(0);
            String sql = "UPDATE `image_info` SET `image_name`=?,`date_created`=? WHERE `general_infoId`=?";

            PreparedStatement pst9 = conn.prepareStatement(sql);
            pst9.setString(1, fileName);
            pst9.setTimestamp(2, timestamp, cal);
            pst9.setInt(3, id);
            int update7 = pst9.executeUpdate();
            if(update7 == 1)
                return update7 == 1;
            return false;
        }
    }

    public static boolean SaveResultImageName(int id, List<String> fileNames) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String fileName = fileNames.get(0);
            String sqlR = "INSERT INTO `science_education`.`result_images_temp` (`result_listId`, `image_name_temp`, `dates_temp`) VALUES (?, ?, ?);";

            PreparedStatement pst9 = conn.prepareStatement(sqlR);
            pst9.setInt(1, id);
            pst9.setString(2, fileName);
            pst9.setTimestamp(3, timestamp, cal);
            int update7 = pst9.executeUpdate();
            if(update7 == 1)
                return update7 == 1;
            return false;
        }
    }

    public static boolean SaveCredentialImageName(int id, String description, List<String> fileNames) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String fileName = fileNames.get(0);
            String sqlR = "INSERT INTO `science_education`.`credential_images` (`general_infoId`,`image_name`, `description_name`, `dates`) VALUES (?, ?, ?, ?);";

            PreparedStatement pst9 = conn.prepareStatement(sqlR);
            pst9.setInt(1, id);
            pst9.setString(2, fileName);
            pst9.setString(3, description);
            pst9.setTimestamp(4, timestamp, cal);
            int update7 = pst9.executeUpdate();
            if(update7 == 1)
                return update7 == 1;
            return false;
        }
    }

    public static String getSavedImageName(int id) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `image_name` FROM `image_info` WHERE `id`= ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet result2 = pst.executeQuery();
            if(result2.next())
            {
                String imgname = result2.getString("image_name");
                if(imgname != null)
                    return imgname;
            }
            return null;
        }
    }

    public static boolean insertStudentData(String first_name, String last_name, String other_name, String email, String date_of_birth,
            String role, String gender, String marital_status, String address, String city, String phone, String current_level, String matric_no, String academic_session, String unit, String department, String faculty)
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql1 = "INSERT INTO `science_education`.`general_info` (`first_name`, `last_name`, `other_name`,`email`,`role`,`date_time`) VALUES (?, ?, ?, ?, ?, ?);";
            String sql2 = "SELECT `id` FROM `general_info` WHERE `email`= ?";
            String sql3 = "INSERT INTO `science_education`.`correspondence_address` (`general_infoId`, `gender`, `marital_status`,`date_of_birth`,`address`,`city`,`phone_no`) VALUES (?, ?, ?, ?, ?, ?, ?);";
            String sql4 = "INSERT INTO `science_education`.`academic_info` (`general_infoId`, `academic_session`, `unit`,`current_level`,`department`,`faculty`,`matric_no`) VALUES (?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement pst1 = conn.prepareStatement(sql1);
            pst1.setString(1, first_name);
            pst1.setString(2, last_name);
            pst1.setString(3, other_name);
            pst1.setString(4, email);
            pst1.setString(5, role);
            pst1.setTimestamp(6, timestamp, cal);
            int update1 = pst1.executeUpdate();
            PreparedStatement pst2;
            if(update1 == 1)
            {
                pst2 = conn.prepareStatement(sql2);
                pst2.setString(1, email);
                ResultSet result = pst2.executeQuery();
                int Idn;
                if(result.next())
                {
                    Idn = result.getInt("id");
                    PreparedStatement pst3;
                    if(Idn != 0)
                    {
                        pst3 = conn.prepareStatement(sql3);
                        pst3.setInt(1, Idn);
                        pst3.setString(2, gender);
                        pst3.setString(3, marital_status);
                        pst3.setString(4, date_of_birth);
                        pst3.setString(5, address);
                        pst3.setString(6, city);
                        pst3.setString(7, phone);
                        int update2 = pst3.executeUpdate();
                        PreparedStatement pst4;
                        if(update2 == 1)
                        {
                            pst4 = conn.prepareStatement(sql4);
                            pst4.setInt(1, Idn);
                            pst4.setString(2, academic_session);
                            pst4.setString(3, unit);
                            pst4.setString(4, current_level);
                            pst4.setString(5, department);
                            pst4.setString(6, faculty);
                            pst4.setString(7, matric_no);
                            int update3 = pst4.executeUpdate();
                            if(update3 == 1)
                                return update3 == 1;
                            return false;
                        }
                        else
                            return false;
                    }
                    else
                        return false;
                }
                else
                    return false;
            }
            else
                return false;
        }

    }

    public static boolean insertExamScoreData(String name_of_student, String matric_no, String session, String semester, String course_code, String course_title, String credit_hrs, int ca, int exam, int total, String grade, String remark)
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql1 = "INSERT INTO `academic_exams_result`(`full_name`, `matric_no`, `session`, `semester`, `course_code`,  `course_title`, `credit_hrs`,`continous_assesment`, `exam_score`, `total_score`, `grade`, `remark`, `date_entered`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement pst1 = conn.prepareStatement(sql1);
            pst1.setString(1, name_of_student);
            pst1.setString(2, matric_no);
            pst1.setString(3, session);
            pst1.setString(4, semester);
            pst1.setString(5, course_code);
            pst1.setString(6, course_title);
            pst1.setString(7, credit_hrs);
            pst1.setInt(8, ca);
            pst1.setInt(9, exam);
            pst1.setInt(10, total);
            pst1.setString(11, grade);
            pst1.setString(12, remark);
            pst1.setTimestamp(13, timestamp, cal);
            int update1 = pst1.executeUpdate();
            if(update1 == 1)
                return update1 == 1;
            else
                return false;
        }

    }

    public static boolean insertLecturerStaffData(String first_name, String last_name, String other_name, String email, String date_of_birth,
            String role, String gender, String marital_status, String address, String city, String phone, String designation, String highest_level_of_education,
            String major_field_of_study, String institution_attended, String all_academic_certificates, String rank_one, String rank_two, String password)
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql1 = "INSERT INTO `science_education`.`general_info` (`first_name`, `last_name`, `other_name`,`email`,`role`,`date_time`) VALUES (?, ?, ?, ?, ?, ?);";
            String sql2 = "SELECT `id` FROM `general_info` WHERE `email`= ?";
            String sql3 = "INSERT INTO `science_education`.`correspondence_address` (`general_infoId`, `gender`, `marital_status`,`date_of_birth`,`address`,`city`,`phone_no`) VALUES (?, ?, ?, ?, ?, ?, ?);";
            String sql4 = "INSERT INTO `science_education`.`academic_info_two` (`general_infoId`, `highest_level_of_education`, `major_field_of_study`,`institution_attended`,`all_academic_certificates`,`rank_one`,`rank_two`) VALUES (?, ?, ?, ?, ?, ?, ?);";
            String sql5 = "INSERT INTO `science_education`.`lecturer_info` (`general_infoId`, `password`, `designation`) VALUES (?, ?, ?);";

            PreparedStatement pst1 = conn.prepareStatement(sql1);
            pst1.setString(1, first_name);
            pst1.setString(2, last_name);
            pst1.setString(3, other_name);
            pst1.setString(4, email);
            pst1.setString(5, role);
            pst1.setTimestamp(6, timestamp, cal);
            int update1 = pst1.executeUpdate();
            PreparedStatement pst2;
            if(update1 == 1)
            {
                pst2 = conn.prepareStatement(sql2);
                pst2.setString(1, email);
                ResultSet result = pst2.executeQuery();
                int Idn;
                if(result.next())
                {
                    Idn = result.getInt("id");
                    PreparedStatement pst3;
                    if(Idn != 0)
                    {
                        pst3 = conn.prepareStatement(sql3);
                        pst3.setInt(1, Idn);
                        pst3.setString(2, gender);
                        pst3.setString(3, marital_status);
                        pst3.setString(4, date_of_birth);
                        pst3.setString(5, address);
                        pst3.setString(6, city);
                        pst3.setString(7, phone);
                        int update2 = pst3.executeUpdate();
                        PreparedStatement pst4;
                        if(update2 == 1)
                        {
                            pst4 = conn.prepareStatement(sql4);
                            pst4.setInt(1, Idn);
                            pst4.setString(2, highest_level_of_education);
                            pst4.setString(3, major_field_of_study);
                            pst4.setString(4, institution_attended);
                            pst4.setString(5, all_academic_certificates);
                            pst4.setString(6, rank_one);
                            pst4.setString(7, rank_two);
                            int update3 = pst4.executeUpdate();
                            PreparedStatement pst5;
                            if(update3 == 1)
                            {
                                pst5 = conn.prepareStatement(sql5);
                                pst5.setInt(1, Idn);
                                pst5.setString(2, password);
                                pst5.setString(3, designation);
                                int update4 = pst5.executeUpdate();
                                return update4 == 1;

                            }
                            else

                                return false;
                        }
                        else
                            return false;
                    }
                    else
                        return false;
                }
                else
                    return false;
            }
            else
                return false;
        }

    }

    public static boolean UpdateLecturerStaffData(String first_name, String last_name, String other_name, String email, String date_of_birth,
            String role, String gender, String marital_status, String address, String city, String phone, String designation, String highest_level_of_education,
            String major_field_of_study, String institution_attended, String all_academic_certificates, String rank_one, String rank_two, int genInfoId)
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql1 = "UPDATE `general_info` SET `first_name`=?,`last_name`=?,`other_name`=?,`email`=?,`role`=?,`date_time`=? WHERE `id`=?";

            String sql3 = "UPDATE `correspondence_address` SET `gender`=?,`marital_status`=?,`date_of_birth`=?,`address`=?,`city`=?,`phone_no`=? WHERE `general_infoId`=?";
            String sql4 = "UPDATE `academic_info_two` SET `highest_level_of_education`=?,`major_field_of_study`=?,`institution_attended`=?,`all_academic_certificates`=?,`rank_one`=?,`rank_two`=? WHERE `general_infoId`=?";
            String sql5 = "UPDATE `lecturer_info` SET `designation`=? WHERE `general_infoId`=?";

            PreparedStatement pst1;
            pst1 = conn.prepareStatement(sql1);
            pst1.setString(1, first_name);
            pst1.setString(2, last_name);
            pst1.setString(3, other_name);
            pst1.setString(4, email);
            pst1.setString(5, role);
            pst1.setTimestamp(6, timestamp, cal);
            pst1.setInt(7, genInfoId);
            int update1 = pst1.executeUpdate();
            PreparedStatement pst3;
            if(update1 == 1)
            {
                pst3 = conn.prepareStatement(sql3);

                pst3.setString(1, gender);
                pst3.setString(2, marital_status);
                pst3.setString(3, date_of_birth);
                pst3.setString(4, address);
                pst3.setString(5, city);
                pst3.setString(6, phone);
                pst3.setInt(7, genInfoId);
                int update2 = pst3.executeUpdate();
                PreparedStatement pst4;
                if(update2 == 1)
                {
                    pst4 = conn.prepareStatement(sql4);
                    pst4.setString(1, highest_level_of_education);
                    pst4.setString(2, major_field_of_study);
                    pst4.setString(3, institution_attended);
                    pst4.setString(4, all_academic_certificates);
                    pst4.setString(5, rank_one);
                    pst4.setString(6, rank_two);
                    pst4.setInt(7, genInfoId);
                    int update3 = pst4.executeUpdate();
                    PreparedStatement pst5;
                    if(update3 == 1)
                    {
                        pst5 = conn.prepareStatement(sql5);

                        pst5.setString(1, designation);
                        pst5.setInt(2, genInfoId);
                        int update4 = pst5.executeUpdate();
                        return update4 == 1;
                    }
                    else
                        return false;

                }
                else
                    return false;

            }
            else
                return false;

        }

    }

    public static boolean UpdateStudentData(String first_name, String last_name, String other_name, String email, String date_of_birth,
            String role, String gender, String marital_status, String address, String city, String phone, String current_level, String academic_session,
            String unit, String department, String faculty, String matric_no, int genInfoId)
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql1 = "UPDATE `general_info` SET `first_name`=?,`last_name`=?,`other_name`=?,`email`=?,`role`=?,`date_time`=? WHERE `id`=?";

            String sql3 = "UPDATE `correspondence_address` SET `gender`=?,`marital_status`=?,`date_of_birth`=?,`address`=?,`city`=?,`phone_no`=? WHERE `general_infoId`=?";
            String sql4 = "UPDATE `academic_info` SET `current_level`=?,`academic_session`=?, `unit`=?,`department`=?,`faculty`=?,`matric_no`=? WHERE `general_infoId`=?";

            PreparedStatement pst1;
            pst1 = conn.prepareStatement(sql1);
            pst1.setString(1, first_name);
            pst1.setString(2, last_name);
            pst1.setString(3, other_name);
            pst1.setString(4, email);
            pst1.setString(5, role);
            pst1.setTimestamp(6, timestamp, cal);
            pst1.setInt(7, genInfoId);
            int update1 = pst1.executeUpdate();
            PreparedStatement pst3;
            if(update1 == 1)
            {
                pst3 = conn.prepareStatement(sql3);

                pst3.setString(1, gender);
                pst3.setString(2, marital_status);
                pst3.setString(3, date_of_birth);
                pst3.setString(4, address);
                pst3.setString(5, city);
                pst3.setString(6, phone);
                pst3.setInt(7, genInfoId);
                int update2 = pst3.executeUpdate();
                PreparedStatement pst4;
                if(update2 == 1)
                {
                    pst4 = conn.prepareStatement(sql4);
                    pst4.setString(1, current_level);
                    pst4.setString(2, academic_session);
                    pst4.setString(3, unit);
                    pst4.setString(4, department);
                    pst4.setString(5, faculty);
                    pst4.setString(6, matric_no);
                    pst4.setInt(7, genInfoId);
                    int update3 = pst4.executeUpdate();
                    return update3 == 1;

                }
                else
                    return false;

            }
            else
                return false;

        }

    }

    public static boolean UpdateExamData(String fuul_name, String matric_no, String course_code, String course_title, String credit_hrs, int ca,
            int exam_score, int total_score, String semester, String academic_session, String grade, String remark, int genInfoId)
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql1 = "UPDATE `academic_exams_result` SET `full_name`=?,`matric_no`=?,`session`=?,`semester`=?,"
                    + "`course_code`=?,`course_title`=? ,`credit_hrs`=?,`continous_assesment`=?,`exam_score`=?,`total_score`=?,"
                    + "`grade`=?,`remark`=?,`date_entered`=? WHERE `sn`=?";

            PreparedStatement pst1;
            pst1 = conn.prepareStatement(sql1);
            pst1.setString(1, fuul_name);
            pst1.setString(2, matric_no);
            pst1.setString(3, academic_session);
            pst1.setString(4, semester);
            pst1.setString(5, course_code);
            pst1.setString(6, course_title);
            pst1.setString(7, credit_hrs);
            pst1.setInt(8, ca);
            pst1.setInt(9, exam_score);
            pst1.setInt(10, total_score);
            pst1.setString(11, grade);
            pst1.setString(12, remark);
            pst1.setTimestamp(13, timestamp, cal);
            pst1.setInt(14, genInfoId);
            int update1 = pst1.executeUpdate();

            if(update1 == 1)
                return update1 == 1;
            else
                return false;

        }

    }

    public static boolean UpdateCourseData(String course_code, String course_title, String credit_hrs, int genInfoId)
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql1 = "UPDATE `course_info` SET `course_code`=?,`course_title`=?,`credit_hrs`=?,`course_date`=? WHERE `sn`=?";

            PreparedStatement pst1;
            pst1 = conn.prepareStatement(sql1);
            pst1.setString(1, course_code);
            pst1.setString(2, course_title);
            pst1.setString(3, credit_hrs);
            pst1.setTimestamp(4, timestamp, cal);
            pst1.setInt(5, genInfoId);
            int update1 = pst1.executeUpdate();

            if(update1 == 1)
                return update1 == 1;
            else
                return false;

        }

    }

    public static boolean insertResultData(String sessionv, String semester, String course_code, String course_title, String credit_hours,
            String result_released)
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql1 = "INSERT INTO `science_education`.`result_list` (`session`, `semester`, `course_code`,`credit_hours`,`course_title`, `result_to_be_released`, `date_time`) VALUES (?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement pst1 = conn.prepareStatement(sql1);
            pst1.setString(1, sessionv);
            pst1.setString(2, semester);
            pst1.setString(3, course_code);
            pst1.setString(4, credit_hours);
            pst1.setString(5, course_title);
            // pst1.setString(6, year_of_study);
            pst1.setString(6, result_released);
            pst1.setTimestamp(7, timestamp, cal);
            int update1 = pst1.executeUpdate();
            if(update1 == 1)
                return update1 == 1;
            else
                return false;
        }

    }

    public static boolean insertCourseInfoData(String course_code, String course_title, String credit_hours)
            throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        Calendar cal = DateTimeUtility.getTodayTimeZone();
        Timestamp timestamp = new Timestamp(cal.getTime().getTime());
        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql1 = "INSERT INTO `science_education`.`course_info` (`course_code`, `course_title`,`credit_hrs`, `course_date`) VALUES (?, ?, ?, ?);";
            PreparedStatement pst1 = conn.prepareStatement(sql1);
            pst1.setString(1, course_code);
            pst1.setString(2, course_title);
            pst1.setString(3, credit_hours);
            pst1.setTimestamp(4, timestamp, cal);
            int update1 = pst1.executeUpdate();
            if(update1 == 1)
                return update1 == 1;
            else
                return false;
        }

    }

    public static int getStudentId(String email) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `id` FROM `general_info` WHERE `email`=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet result2 = pst.executeQuery();
            if(result2.next())
            {
                int id = result2.getInt("id");
                if(id != 0)
                    return id;
            }
            return 0;
        }
    }

    public static String getMatricNo(int id) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `matric_no` FROM `academic_info` WHERE `general_infoId`=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet result2 = pst.executeQuery();
            if(result2.next())
            {
                String matric_no = result2.getString("matric_no");
                if(matric_no != null)
                    return matric_no;
            }
            return null;
        }
    }

    public static String getCourseTitle(String courseCode) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `course_title`, `credit_hrs` FROM `course_info` WHERE `course_code`=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, courseCode);
            ResultSet result2 = pst.executeQuery();
            if(result2.next())
            {
                String course_title = result2.getString("course_title");
                String credit_hrs = result2.getString("credit_hrs");
                if(course_title != null)
                    return course_title + ":" + credit_hrs;
            }
            return null;
        }
    }

    public static int getIdNo(String fname, String lname, String oname) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `id` FROM `general_info` WHERE `first_name`=? AND `last_name`=? AND `other_name`=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setString(3, oname);
            ResultSet result2 = pst.executeQuery();
            if(result2.next())
            {
                int id = result2.getInt("id");
                if(id != 0)
                    return id;
            }
            return 0;
        }
    }

    public static int getGenId0(String matric_no) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `general_infoId` FROM `academic_info` WHERE `matric_no`=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, matric_no);
            ResultSet result2 = pst.executeQuery();
            if(result2.next())
            {
                int id = result2.getInt("general_infoId");
                if(id != 0)
                    return id;
            }
            return 0;
        }
    }

    public static String getFullNamesOfStudents(int id) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `other_name`, `last_name`, `first_name` FROM `general_info` WHERE `id`=''";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet result2 = pst.executeQuery();
            if(result2.next())
            {
                String names0 = result2.getString("other_name");
                String names1 = result2.getString("last_name");
                String names2 = result2.getString("first_name");
                String fullnames = names0 + " " + names1 + " " + names2;
                if(fullnames != null)
                    return fullnames;
            }
            return null;
        }
    }

    public static int getCourseCodeId(String course_code) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `sn` FROM `course_info` WHERE `course_code`=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, course_code);
            ResultSet result2 = pst.executeQuery();
            if(result2.next())
            {
                int id = result2.getInt("sn");
                if(id != 0)
                    return id;
            }
            return 0;
        }
    }

    public static int getLecturerStaffId(String email) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `id` FROM `general_info` WHERE `email`= ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet result2 = pst.executeQuery();
            if(result2.next())
            {
                int id = result2.getInt("id");
                if(id != 0)
                    return id;
            }
            return 0;
        }
    }

    public static User CheckStudent(String pin, String matric_no) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        String sql0 = "SELECT `pin_code` FROM `pin` WHERE `pin_code`=? AND `status`=?";
        String sql1 = "SELECT `general_info`.`id`,`first_name`,`last_name`,`other_name`,`email`,`role`,`date_time`,"
                + " `correspondence_address`.`gender`, `correspondence_address`.`marital_status`, `correspondence_address`.`date_of_birth`,"
                + " `correspondence_address`.`address`, `correspondence_address`.`city`, `correspondence_address`.`phone_no`, "
                + "`academic_info`.`academic_session`, `academic_info`.`unit`,`academic_info`.`current_level`, `academic_info`.`department`, `academic_info`.`faculty`, "
                + "`academic_info`.`matric_no`, `image_info`.`image_name`, `image_info`.`date_created`"
                + "FROM `general_info`"
                + "Inner JOIN `correspondence_address` on `general_info`.`id`= `correspondence_address`.`general_infoId`"
                + "INNER JOIN `academic_info` ON `academic_info`.`general_infoId`= `general_info`.`id`"
                + "INNER JOIN `image_info` ON `image_info`.`general_infoId`= `general_info`.`id`"
                + "WHERE `academic_info`.`matric_no`=?";
        String sql2 = "UPDATE `pin` SET `status`='Used' WHERE `pin_code`=?";
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            PreparedStatement pst = conn.prepareStatement(sql0);
            pst.setString(1, pin);
            pst.setString(2, "Unused");
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
                String pinN = rs.getString("pin_code");
                if(pinN.equals(""))
                    return null;
                else
                {
                    PreparedStatement pst1 = conn.prepareStatement(sql1);
                    pst1.setString(1, matric_no);
                    ResultSet rs1 = pst1.executeQuery();
                    if(rs1.next())
                    {
                        PreparedStatement pst2 = conn.prepareStatement(sql2);
                        pst2.setString(1, pin);
                        pst2.executeUpdate();
                        return getAllStudents(rs1);
                    }
                    else
                        return null;
                }

            }
            else
                return null;
        }
    }

    public static boolean ConfirmMatricNo(String matric_no) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        String sql0 = "SELECT `matric_no` FROM `academic_info` WHERE `matric_no`=?";

        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            PreparedStatement pst = conn.prepareStatement(sql0);
            pst.setString(1, matric_no);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
                String confirm = rs.getString("matric_no");
                return confirm.equals(matric_no);
            }
            else
                return false;
        }
    }

    public static List<Result> getAllSessions() throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT DISTINCT `session` FROM `result_list` ORDER BY `result_list`.`session` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Result> allSessionNames = new ArrayList<>();
            while(rs.next())
                allSessionNames.add(getSessionNames(rs));
            return allSessionNames;
        }

    }

    public static List<User> getAllEmailsFromLecturerStaff() throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT DISTINCT `email` FROM `general_info` WHERE `role`='HOD' OR `role` = 'Lecturer' OR `role` ='Staff' Or `role` = 'Exam Officer' ORDER BY `general_info`.`email` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<User> allEmailAddresses = new ArrayList<>();
            while(rs.next())
                allEmailAddresses.add(getEmailAddresses(rs));
            return allEmailAddresses;
        }

    }

    public static List<Result> getSpecificImages(String sessions, String semester, String course_code, String course_title) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `result_images_temp`.`image_name_temp` FROM `result_list`INNER JOIN "
                    + "`result_images_temp` on `result_list`.`id`= `result_images_temp`.`result_listId`"
                    + "WHERE `session`='" + sessions + "' AND `semester`='" + semester + "' AND `course_code`='" + course_code + "' AND "
                    + "`course_title`='" + course_title + "' ORDER BY `result_list`.`course_code` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Result> allSpecificImages = new ArrayList<>();
            while(rs.next())
                allSpecificImages.add(getSpecificImages(rs));
            return allSpecificImages;
        }

    }

    public static List<User> getSpecificCredentialImages(int ids) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `credential_images`.`image_name`, `credential_images`.`description_name` FROM `credential_images`"
                    + "WHERE `general_infoId`='" + ids + "'  ORDER BY `credential_images`.`description_name` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<User> allSpecificCredentials = new ArrayList<>();
            while(rs.next())
                allSpecificCredentials.add(getSpecificCredentialImage(rs));
            return allSpecificCredentials;
        }

    }

    private static Result getSessionNames(ResultSet rs) throws SQLException
    {
        Result rst = new Result();
        rst.setSession(rs.getString("session"));

        return rst;

    }

    private static User getEmailAddresses(ResultSet rs) throws SQLException
    {
        User rst = new User();
        rst.setEmail(rs.getString("email"));

        return rst;

    }

    private static Result getSpecificImages(ResultSet rs) throws SQLException
    {
        Result rst = new Result();
        rst.setReult_image(rs.getString("image_name_temp"));

        return rst;

    }

    private static User getSpecificCredentialImage(ResultSet rs) throws SQLException
    {
        User rst = new User();
        rst.setCredential_image(rs.getString("image_name"));
        rst.setDescription_of_credential(rs.getString("description_name"));

        return rst;

    }

    private static Result getSemesterNames(ResultSet rs) throws SQLException
    {
        Result rst = new Result();
        rst.setSemester(rs.getString("semester"));

        return rst;

    }

    private static User getSemesters(ResultSet rs) throws SQLException
    {
        User rst = new User();
        rst.setSemester(rs.getString("semester"));

        return rst;

    }

    private static User getMyResults(ResultSet rs) throws SQLException
    {
        User user = new User();
        user.setExamId(rs.getInt("sn"));
        user.setFull_name(rs.getString("full_name"));
        user.setMatric_no(rs.getString("matric_no"));
        user.setAcademic_session(rs.getString("session"));
        user.setSemester(rs.getString("semester"));
        user.setCourse_code(rs.getString("course_code"));
        user.setCourse_title(rs.getString("course_title"));
        user.setCredit_hrs(rs.getString("credit_hrs"));
        user.setContinous_assesment(rs.getInt("continous_assesment"));
        user.setExam_score(rs.getInt("exam_score"));
        user.setTotal_score(rs.getInt("total_score"));
        user.setGrade(rs.getString("grade"));
        user.setRemark(rs.getString("remark"));
        user.setDate_created(rs.getString("date_entered"));

        return user;

    }

    private static Result getCourseCodeNames(ResultSet rs) throws SQLException
    {
        Result rst = new Result();
        rst.setCourse_code(rs.getString("course_code"));

        return rst;

    }

    private static User getCourseCodeNames2(ResultSet rs) throws SQLException
    {
        User rst = new User();
        rst.setCourse_code(rs.getString("course_code"));

        return rst;

    }

    private static Result getCourseTitleNames(ResultSet rs) throws SQLException
    {
        Result rst = new Result();
        rst.setCourse_tittle(rs.getString("course_title"));

        return rst;

    }

    private static Result getYearOfStudyNames(ResultSet rs) throws SQLException
    {
        Result rst = new Result();
        rst.setYear_of_study(rs.getString("year_of_study"));

        return rst;

    }

    public static List<Result> getAllResults() throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT DISTINCT `session` FROM `result_list` ORDER BY `result_list`.`session` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Result> allSessionNames = new ArrayList<>();
            while(rs.next())
                allSessionNames.add(getSessionNames(rs));
            return allSessionNames;
        }

    }

    public static List<Result> getAllSemester() throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT DISTINCT `semester` FROM `result_list` ORDER BY `result_list`.`semester` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Result> allSessionNames = new ArrayList<>();
            while(rs.next())
                allSessionNames.add(getSemesterNames(rs));
            return allSessionNames;
        }

    }

    public static List<User> getMySemester(String matric_no) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT DISTINCT `semester` FROM `academic_exams_result` WHERE `matric_no`='" + matric_no + "' ORDER BY `academic_exams_result`.`semester` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<User> allSessionNames = new ArrayList<>();
            while(rs.next())
                allSessionNames.add(getSemesters(rs));
            return allSessionNames;
        }

    }

    public static List<User> getMyResults(String matric_no, String semester) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT * FROM `academic_exams_result` WHERE `matric_no`='" + matric_no + "' AND `semester`='" + semester + "'";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<User> allSessionNames = new ArrayList<>();
            while(rs.next())
                allSessionNames.add(getMyResults(rs));
            return allSessionNames;
        }

    }

    public static List<Result> getAllCourseCodes() throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT DISTINCT `course_code` FROM `result_list` ORDER BY `result_list`.`course_code` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Result> allCouseCodeNames = new ArrayList<>();
            while(rs.next())
                allCouseCodeNames.add(getCourseCodeNames(rs));
            return allCouseCodeNames;
        }

    }

    public static List<User> getAllCourseCodes2() throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT DISTINCT `course_code` FROM `course_info` ORDER BY `course_info`.`course_code` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<User> allCouseCodeNames = new ArrayList<>();
            while(rs.next())
                allCouseCodeNames.add(getCourseCodeNames2(rs));
            return allCouseCodeNames;
        }

    }

    public static List<Result> getAllCourseTitle() throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT DISTINCT `course_title` FROM `result_list` ORDER BY `result_list`.`course_title` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Result> allCouseTitleNames = new ArrayList<>();
            while(rs.next())
                allCouseTitleNames.add(getCourseTitleNames(rs));
            return allCouseTitleNames;
        }

    }

    public static List<Result> getAllYearOfStudy() throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT DISTINCT `year_of_study` FROM `result_list` ORDER BY `result_list`.`year_of_study` ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Result> allYearOfStudyNames = new ArrayList<>();
            while(rs.next())
                allYearOfStudyNames.add(getYearOfStudyNames(rs));
            return allYearOfStudyNames;
        }

    }

    public static int getId(String course_code) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `id` FROM `result_list` WHERE `course_code`= ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, course_code);
            ResultSet result2 = pst.executeQuery();
            if(result2.next())
            {
                int id = result2.getInt("id");
                if(id != 0)
                    return id;
            }
            return 0;
        }
    }

    public static String getImageName(int id) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        DBConfiguration dbConfig = new DBConfiguration();

        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT `image_name` FROM `image_info` WHERE `general_infoId`=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet result2 = pst.executeQuery();
            if(result2.next())
            {
                String imageName = result2.getString("image_name");
                if(imageName != null)
                    return imageName;
            }
            return null;
        }
    }
}
