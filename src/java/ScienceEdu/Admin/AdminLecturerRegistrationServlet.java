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
import ScienceEdu.user.User;
import ScienceEdu.user.UserDAO;
import ScienceEdu.utility.ZaapMartException;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author EKPES
 */
public class AdminLecturerRegistrationServlet extends HttpServlet
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
            String firstname = request.getParameter("firstname").toUpperCase().trim();
            String lastname = request.getParameter("lastname").toUpperCase().trim();
            String othername = request.getParameter("othername").toUpperCase().trim();
            String password = request.getParameter("password").trim();
            String email = request.getParameter("email").trim();
            String gender = request.getParameter("gender").trim();
            String marital_status = request.getParameter("marital_status").trim();
            String designation = request.getParameter("designation").trim();
            String phone_no = request.getParameter("phone").trim();
            String role = request.getParameter("role").trim();
            try
            {
                String signupError = validateUserAdmin(request);
                if(signupError.isEmpty())
                {
                    User user = new User();
                    user.setFirst_name(firstname);
                    user.setLast_name(lastname);
                    user.setOther_name(othername);
                    user.setEmail(email);
                    user.setRole(role);
                    user.setGender(gender);
                    user.setMarital_status(marital_status);
                    user.setDesignation(designation);
                    user.setDate_of_birth("1990-01-01");
                    user.setAddress("Not Available");
                    user.setCity("Not Available");
                    user.setPhone(phone_no);
                    user.setHighest_level_education("Not Available");
                    user.setMajor_field_of_study("Not Available");
                    user.setInstitution_attended("Not Available");
                    user.setAll_academic_certificates("Not Available");
                    user.setRank_one("Not Available");
                    user.setRank_two("Not Available");
                    user.setImage_name("team_pic1.png");
                    Digester digester = new Digester();
                    String encPassword = digester.doDigest(password);
                    boolean insert1 = UserDAO.registerLecturer(user, encPassword);
                    if(insert1)
                        response.sendRedirect("main_home?ok=1");
                    else
                    {
                        request.setAttribute("signupError", "There is a problem inserting record.");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("admin_registration");
                        dispatcher.forward(request, response);
                    }
                }
                else
                {
                    request.setAttribute("signupError", "There is a problem inserting record.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("admin_registration");
                    dispatcher.forward(request, response);
                }
            }
            catch(Exception xcp)
            {
                throw new ZaapMartException(xcp, request);
            }
        }
        catch(Exception xcp)
        {
            throw new ZaapMartException(xcp, request);
        }
    }

    private String validateUserAdmin(HttpServletRequest request)
    {
        String firstname = request.getParameter("firstname").trim();
        String lastname = request.getParameter("lastname").trim();
        String othername = request.getParameter("othername").trim();
        String password = request.getParameter("password").trim();
        String email = request.getParameter("email").trim();
        if(firstname.equals(""))
            return "First Name must not be empty.";
        if(lastname.equals(""))
            return "Last Name must not be empty.";
        if(othername.equals(""))
            return "Other Name must not be empty.";
        if(password.equals(""))
            return "Password must not be empty.";
        if(email.equals(""))
            return "Email must not be empty.";
        else
            return "";
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
