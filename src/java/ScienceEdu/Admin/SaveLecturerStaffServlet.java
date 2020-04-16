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
package ScienceEdu.Admin;

import ScienceEdu.security.Digester;
import ScienceEdu.user.UserDAO;
import ScienceEdu.utility.ZaapMartException;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author EKPES
 */
public class SaveLecturerStaffServlet extends HttpServlet
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
        response.setContentType("application/json");
        try
        {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(false);

            if(session != null)
            {
                //User usr = (User)session.getAttribute("user");
                //String reference_name = usr.getFirst_name();
                String first_name = request.getParameter("first_name").toUpperCase().trim();
                String last_name = request.getParameter("last_name").toUpperCase().trim();
                String other_name = request.getParameter("other_name").toUpperCase().trim();
                String email = request.getParameter("email");
                String date_of_birth = request.getParameter("date_of_birth");
                String role = request.getParameter("role");
                String gender = request.getParameter("gender");
                String marital_status = request.getParameter("marital_status").trim();
                String address = request.getParameter("address");
                String city = request.getParameter("city");
                String phone = request.getParameter("phone");
                String designation = request.getParameter("designation");
                String highest_level_of_education = request.getParameter("highest_level_of_education");
                String major_field_of_study = request.getParameter("major_field_of_study");
                String institution_attended = request.getParameter("institution_attended");
                String all_academic_certificates = request.getParameter("all_academic_certificates");
                String rank_one = request.getParameter("rank_one");
                String rank_two = request.getParameter("rank_two");
                Digester digester = new Digester();
                String encPassword = digester.doDigest(email);

                boolean insert1 = UserDAO.insertLecturerStaffData(first_name, last_name, other_name, email, date_of_birth,
                        role, gender, marital_status, address, city, phone,
                        designation, highest_level_of_education, major_field_of_study, institution_attended, all_academic_certificates,
                        rank_one, rank_two, encPassword);
                if(insert1)
                {

                    int LecturerId = UserDAO.getLecturerStaffId(email);
                    session.setAttribute("lecId", LecturerId);
                    session.setAttribute("lecphoneNo", phone);
                    Gson gson = new GsonBuilder().setPrettyPrinting().create();
                    String json = gson.toJson("Ok!");
                    try(PrintWriter out = response.getWriter())
                    {
                        out.print(json);
                    }

                }
                else
                {
                    Gson gson = new GsonBuilder().setPrettyPrinting().create();
                    String json = gson.toJson("Insertion of student data was not successfull ");
                    try(PrintWriter out = response.getWriter())
                    {
                        out.print(json);
                    }

                }

            }
            else
                response.sendRedirect("main_home?login_role=3");

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
