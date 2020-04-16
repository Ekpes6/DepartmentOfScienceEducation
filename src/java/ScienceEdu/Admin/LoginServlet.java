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

import ScienceEdu.user.User;
import ScienceEdu.user.UserDAO;
import java.io.IOException;
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
public class LoginServlet extends HttpServlet
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
            String emailAddress = request.getParameter("email").trim();
            String password = request.getParameter("password").trim();
            User user = UserDAO.authenticateUser2(emailAddress);
            HttpSession session = request.getSession(true);
            if((user != null) && (user.getRole().equals(User.LECTURER) || user.getRole().equals(User.HOD)
                    || user.getRole().equals(User.EXAM_OFFICER) || user.getRole().equals(User.STAFF)))
            {

                if(request.getParameter("stayLoggedIn") != null)
                    session.setMaxInactiveInterval(3600);
                String admin = user.getRole();
                User user_admin = UserDAO.authenticateUserAdmin(emailAddress, password, admin);
                if(user_admin != null)
                {
                    session.setAttribute("user", user_admin);
                    response.sendRedirect("scienceEduPage");
                }
                else
                    response.sendRedirect("main_home?login_role=0");
            }
            else if(request.getParameter("pin") != null)
            {
                if(request.getParameter("stayLoggedIn") != null)
                    session.setMaxInactiveInterval(3600);
                String matric_no = request.getParameter("matric_no").trim();
                String pin = request.getParameter("pin").trim();
                String student = "Student";
                User user_student = UserDAO.authenticateStudent(matric_no, pin, student);
                if(user_student != null)
                {
                    session.setAttribute("user", user_student);
                    response.sendRedirect("scienceEduPage");
                }
                else
                    response.sendRedirect("main_home?login=0");
            }
            else
                response.sendRedirect("main_home?login=0");
        }
        catch(SQLException | IOException | IllegalArgumentException | ClassNotFoundException xcp)
        {
            throw new RuntimeException(xcp);
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
