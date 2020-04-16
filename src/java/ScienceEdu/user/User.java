/*
 * Copyright (c) 2018, Xyneex Technologies. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * You are not meant to edit or modify this source code unless you are
 * authorized to do so.
 *
 * Please contact Xyneex Technologies, #1 Orok Orok Street, Calabar, Nigeria.
 * or visit www.xyneex.com if you need additional information or have any
 * questions.
 */
package ScienceEdu.user;

/**
 *
 * @author EKPES
 * @since Jul 20, 2019 1:33:26 PM
 */
public class User
{
    private int id;

    private int gen_info_id;

    private String pin;
    private String unit;

    private String status;

    private String date_generated;

    private String full_name;
    private String semester;
    private int examId;
    private int total_score;

    private String first_name;

    private String last_name;

    private String other_name;

    private String gender;

    private String marital_status;

    private String image_name;

    private String description_of_credential;

    private String credential_image;

    private String password;

    private String address;

    private String city;
    private String department;
    private String faculty;

    private String email;

    private String phone;

    private String designation;

    private String academic_session;

    private String current_level;

    private String matric_no;

    private String role;

    private String course;

    private String date_of_birth;

    private String date_created;

    private String highest_level_education;

    private String major_field_of_study;

    private String institution_attended;

    private String all_academic_certificates;

    private String rank_one;

    private String rank_two;

    private String grade;

    private String remark;

    private String course_code;

    private String course_title;
    private String credit_hrs;
    private String course_date;

    private int course_infoId;

    private int continous_assesment;

    private int exam_score;

    public static final String LECTURER = "Lecturer";

    public static final String STUDENT = "Student";

    public static final String HOD = "HOD";

    public static final String EXAM_OFFICER = "Exam Officer";

    public static final String STAFF = "Staff";

    public User()
    {
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public int getGen_info_id()
    {
        return gen_info_id;
    }

    public void setGen_info_id(int gen_info_id)
    {
        this.gen_info_id = gen_info_id;
    }

    public String getPin()
    {
        return pin;
    }

    public void setPin(String pin)
    {
        this.pin = pin;
    }

    public String getUnit()
    {
        return unit;
    }

    public void setUnit(String unit)
    {
        this.unit = unit;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getDate_generated()
    {
        return date_generated;
    }

    public void setDate_generated(String date_generated)
    {
        this.date_generated = date_generated;
    }

    public String getFirst_name()
    {
        return first_name;
    }

    public void setFirst_name(String first_name)
    {
        this.first_name = first_name;
    }

    public String getFull_name()
    {
        return full_name;
    }

    public void setFull_name(String full_name)
    {
        this.full_name = full_name;
    }

    public String getSemester()
    {
        return semester;
    }

    public void setSemester(String semester)
    {
        this.semester = semester;
    }

    public int getExamId()
    {
        return examId;
    }

    public void setExamId(int examId)
    {
        this.examId = examId;
    }

    public int getTotal_score()
    {
        return total_score;
    }

    public void setTotal_score(int total_score)
    {
        this.total_score = total_score;
    }

    public String getLast_name()
    {
        return last_name;
    }

    public void setLast_name(String last_name)
    {
        this.last_name = last_name;
    }

    public String getOther_name()
    {
        return other_name;
    }

    public void setOther_name(String other_name)
    {
        this.other_name = other_name;
    }

    public String getGender()
    {
        return gender;
    }

    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public String getMarital_status()
    {
        return marital_status;
    }

    public void setMarital_status(String marital_status)
    {
        this.marital_status = marital_status;
    }

    public String getImage_name()
    {
        return image_name;
    }

    public void setImage_name(String image_name)
    {
        this.image_name = image_name;
    }

    public String getDescription_of_credential()
    {
        return description_of_credential;
    }

    public void setDescription_of_credential(String description_of_credential)
    {
        this.description_of_credential = description_of_credential;
    }

    public String getCredential_image()
    {
        return credential_image;
    }

    public void setCredential_image(String credential_image)
    {
        this.credential_image = credential_image;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getCity()
    {
        return city;
    }

    public void setCity(String city)
    {
        this.city = city;
    }

    public String getDepartment()
    {
        return department;
    }

    public void setDepartment(String department)
    {
        this.department = department;
    }

    public String getFaculty()
    {
        return faculty;
    }

    public void setFaculty(String faculty)
    {
        this.faculty = faculty;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getDesignation()
    {
        return designation;
    }

    public void setDesignation(String designation)
    {
        this.designation = designation;
    }

    public String getAcademic_session()
    {
        return academic_session;
    }

    public void setAcademic_session(String academic_session)
    {
        this.academic_session = academic_session;
    }

    public String getCurrent_level()
    {
        return current_level;
    }

    public void setCurrent_level(String current_level)
    {
        this.current_level = current_level;
    }

    public String getMatric_no()
    {
        return matric_no;
    }

    public void setMatric_no(String matric_no)
    {
        this.matric_no = matric_no;
    }

    public String getRole()
    {
        return role;
    }

    public void setRole(String role)
    {
        this.role = role;
    }

    public String getCourse()
    {
        return course;
    }

    public void setCourse(String course)
    {
        this.course = course;
    }

    public String getDate_of_birth()
    {
        return date_of_birth;
    }

    public void setDate_of_birth(String date_of_birth)
    {
        this.date_of_birth = date_of_birth;
    }

    public String getDate_created()
    {
        return date_created;
    }

    public void setDate_created(String date_created)
    {
        this.date_created = date_created;
    }

    public String getHighest_level_education()
    {
        return highest_level_education;
    }

    public void setHighest_level_education(String highest_level_education)
    {
        this.highest_level_education = highest_level_education;
    }

    public String getMajor_field_of_study()
    {
        return major_field_of_study;
    }

    public void setMajor_field_of_study(String major_field_of_study)
    {
        this.major_field_of_study = major_field_of_study;
    }

    public String getInstitution_attended()
    {
        return institution_attended;
    }

    public void setInstitution_attended(String institution_attended)
    {
        this.institution_attended = institution_attended;
    }

    public String getAll_academic_certificates()
    {
        return all_academic_certificates;
    }

    public void setAll_academic_certificates(String all_academic_certificates)
    {
        this.all_academic_certificates = all_academic_certificates;
    }

    public String getRank_one()
    {
        return rank_one;
    }

    public void setRank_one(String rank_one)
    {
        this.rank_one = rank_one;
    }

    public String getRank_two()
    {
        return rank_two;
    }

    public void setRank_two(String rank_two)
    {
        this.rank_two = rank_two;
    }

    public String getGrade()
    {
        return grade;
    }

    public void setGrade(String grade)
    {
        this.grade = grade;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    public String getCourse_code()
    {
        return course_code;
    }

    public void setCourse_code(String course_code)
    {
        this.course_code = course_code;
    }

    public String getCourse_title()
    {
        return course_title;
    }

    public void setCourse_title(String course_title)
    {
        this.course_title = course_title;
    }

    public String getCredit_hrs()
    {
        return credit_hrs;
    }

    public void setCredit_hrs(String credit_hrs)
    {
        this.credit_hrs = credit_hrs;
    }

    public String getCourse_date()
    {
        return course_date;
    }

    public void setCourse_date(String course_date)
    {
        this.course_date = course_date;
    }

    public int getCourse_infoId()
    {
        return course_infoId;
    }

    public void setCourse_infoId(int course_infoId)
    {
        this.course_infoId = course_infoId;
    }

    public int getContinous_assesment()
    {
        return continous_assesment;
    }

    public void setContinous_assesment(int continous_assesment)
    {
        this.continous_assesment = continous_assesment;
    }

    public int getExam_score()
    {
        return exam_score;
    }

    public void setExam_score(int exam_score)
    {
        this.exam_score = exam_score;
    }

}
