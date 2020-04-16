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
 * @since Jul 25, 2019 5:44:40 PM
 */
public class Result
{

    private int id;

    private String session;

    private String credit_hrs;

    private String semester;

    private String course_code;

    private String course_tittle;

    private String year_of_study;

    private String result_to_be_released;

    private String reult_image;
    private String unit;

    private String date;

    //User user = new User();
    public Result()
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

    public String getSession()
    {
        return session;
    }

    public void setSession(String session)
    {
        this.session = session;
    }

    public String getCredit_hrs()
    {
        return credit_hrs;
    }

    public void setCredit_hrs(String credit_hrs)
    {
        this.credit_hrs = credit_hrs;
    }

    public String getSemester()
    {
        return semester;
    }

    public void setSemester(String semester)
    {
        this.semester = semester;
    }

    public String getCourse_code()
    {
        return course_code;
    }

    public void setCourse_code(String course_code)
    {
        this.course_code = course_code;
    }

    public String getCourse_tittle()
    {
        return course_tittle;
    }

    public void setCourse_tittle(String course_tittle)
    {
        this.course_tittle = course_tittle;
    }

    public String getYear_of_study()
    {
        return year_of_study;
    }

    public void setYear_of_study(String year_of_study)
    {
        this.year_of_study = year_of_study;
    }

    public String getResult_to_be_released()
    {
        return result_to_be_released;
    }

    public void setResult_to_be_released(String result_to_be_released)
    {
        this.result_to_be_released = result_to_be_released;
    }

    public String getUnit()
    {
        return unit;
    }

    public void setUnit(String unit)
    {
        this.unit = unit;
    }

    public String getDate()
    {
        return date;
    }

    public void setDate(String date)
    {
        this.date = date;
    }

    public String getReult_image()
    {
        return reult_image;
    }

    public void setReult_image(String reult_image)
    {
        this.reult_image = reult_image;
    }

}
