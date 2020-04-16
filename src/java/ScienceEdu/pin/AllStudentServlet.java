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
package ScienceEdu.pin;

import ScienceEdu.user.User;
import ScienceEdu.user.UserDAO;
import ScienceEdu.utility.ZaapMartException;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author EKPES
 */
public class AllStudentServlet extends HttpServlet
{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        try
        {
            response.setContentType("application/json");
            // String sSearch = request.getParameter("search[value]");

            int colIndex = Integer.parseInt(request.getParameter("order[0][column]"));
            int length = Integer.parseInt(request.getParameter("length"));
            int start = Integer.parseInt(request.getParameter("start"));
            int echo = Integer.parseInt(request.getParameter("draw"));
            String colDir = request.getParameter("order[0][dir]");
            List nuArr = new ArrayList();
            for(int i = 0; i < 20; i++)
            {
                String sSearch = request.getParameter("columns[" + i + "][search][value]");
                nuArr.add(sSearch);
            }

            String Id = (String)nuArr.get(0);
            String first_name = (String)nuArr.get(1);
            String last_name = (String)nuArr.get(2);
            String other_name = (String)nuArr.get(3);
            String imageName = (String)nuArr.get(4);
            String academic_session = (String)nuArr.get(5);
            String unit = (String)nuArr.get(6);
            String current_level = (String)nuArr.get(7);
            String matric_no = (String)nuArr.get(8);
            String date_of_birth = (String)nuArr.get(9);

            String email = (String)nuArr.get(10);
            String role = (String)nuArr.get(11);
            String gender = (String)nuArr.get(12);
            String maritalStatus = (String)nuArr.get(13);
            String address = (String)nuArr.get(14);
            String city = (String)nuArr.get(15);
            String phone = (String)nuArr.get(16);

            String department = (String)nuArr.get(17);
            String faculty = (String)nuArr.get(18);

            String genId = (String)nuArr.get(19);
            // int genId = Integer.parseInt(genIds);
            int iTotalRecords = UserDAO.getAllStudent().size();

            List<User> user = UserDAO.getAllStudent2(Id, first_name, last_name, other_name, imageName, academic_session, unit, current_level, matric_no, date_of_birth, email, role, gender, maritalStatus, address, city, phone, department, faculty, genId);
            int iTotalDisplayRecords = user.size();// number of sales that match search criterion should be returned
            final int sortColumnIndex = colIndex;
            final int sortDirection = colDir.equals("asc") ? -1 : 1;

            /* Collections.sort(user, (User t, User t1)
                    ->
            {
                switch(sortColumnIndex)
                {
                    case 0:
                        return t.getFirst_name().compareTo(t1.getFirst_name()) * sortDirection;
                    case 1:
                        return t.getLast_name().compareTo(t1.getLast_name()) * sortDirection;
                    case 2:
                        return t.getMatric_no().compareTo(t1.getMatric_no()) * sortDirection;
                    case 3:
                        return t.getCurrent_level().compareTo(t1.getCurrent_level()) * sortDirection;
                    case 4:
                        return t.getAcademic_session().compareTo(t1.getAcademic_session()) * sortDirection;
                    case 5:
                        return t.getOther_name().compareTo(t1.getOther_name()) * sortDirection;
                }
                return 0; //To change body of generated methods, choose Tools | Templates.
            });*/
            if(user.size() < start + length)
                user = user.subList(start, user.size());
            else
                user = user.subList(start, start + length);
            try
            {
                JsonObject jsonResponse = new JsonObject();
                jsonResponse.addProperty("sEcho", echo);
                jsonResponse.addProperty("iTotalRecords", iTotalRecords);
                jsonResponse.addProperty("iTotalDisplayRecords", iTotalDisplayRecords);
                Gson gson = new GsonBuilder().setPrettyPrinting().create();

                jsonResponse.add("aaData", gson.toJsonTree(user));

                response.setContentType("application/Json");
                response.getWriter().print(jsonResponse.toString());

            }
            catch(JsonIOException e)
            {
                response.setContentType("text/html");
                response.getWriter().print(e.getMessage());
            }

            /* List<User> allStudents = UserDAO.getAllStudent();

            DataTableObject dataTableObject = new DataTableObject();
            dataTableObject.setAaData(allStudents);
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            String json = gson.toJson(dataTableObject);
            try(PrintWriter out = response.getWriter())
            {
                out.print(json);
            }*/
        }
        catch(SQLException | IOException | IllegalArgumentException | ClassNotFoundException xcp)
        {
            throw new ZaapMartException(xcp, request);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

}
