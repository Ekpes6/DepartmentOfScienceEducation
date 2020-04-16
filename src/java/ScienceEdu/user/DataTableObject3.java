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

import java.util.List;

/**
 *
 * @author EKPES
 * @since Jul 27, 2019 3:01:48 PM
 */
public class DataTableObject3
{
    int iTotalRecords;

    int iTotalDisplayRecords;

    String sEcho;

    String sColumns;

    List<Result> aaData;

    public int getiTotalRecords()
    {

        return iTotalRecords;

    }

    public void setiTotalRecords(int iTotalRecords)
    {

        this.iTotalRecords = iTotalRecords;

    }

    public int getiTotalDisplayRecords()
    {

        return iTotalDisplayRecords;

    }

    public void setiTotalDisplayRecords(int iTotalDisplayRecords)
    {

        this.iTotalDisplayRecords = iTotalDisplayRecords;

    }

    public String getsEcho()
    {

        return sEcho;

    }

    public void setsEcho(String sEcho)
    {

        this.sEcho = sEcho;

    }

    public String getsColumns()
    {

        return sColumns;

    }

    public void setsColumns(String sColumns)
    {

        this.sColumns = sColumns;

    }

    public List<Result> getAaData()
    {
        return aaData;
    }

    public void setAaData(List<Result> aaData)
    {
        this.aaData = aaData;
    }

}
