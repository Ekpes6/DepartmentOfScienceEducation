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
public class DeleteCourseInfoServlet extends HttpServlet
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
        response.setContentType("text/html;charset=UTF-8");
        try
        {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(false);

            if(session != null)
            {

                int course_infoId = Integer.parseInt(request.getParameter("genInfoId"));

                boolean update = UserDAO.DeleteCourseInfo(course_infoId);
                if(update)
                {
                    Gson gson = new GsonBuilder().setPrettyPrinting().create();
                    String json = gson.toJson("This record has been successfully deleted.");
                    try(PrintWriter out = response.getWriter())
                    {
                        out.print(json);
                    }
                }
                else
                {
                    Gson gson = new GsonBuilder().setPrettyPrinting().create();
                    String json = gson.toJson("The record has not been deleted");
                    try(PrintWriter out = response.getWriter())
                    {
                        out.print(json);
                    }

                }

            }
            else
                response.sendRedirect("main_home?login=0");
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
