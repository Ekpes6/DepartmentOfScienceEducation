/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ScienceEdu.upload;

import ScienceEdu.user.UserDAO;
import ScienceEdu.utility.ZaapMartException;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author EKPES
 */
public class SaveImageToDIr extends HttpServlet
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
            HttpSession session = request.getSession(false);
            if(session != null)
            {

                String phone = (String)session.getAttribute("phoneNo");
                String lecphone = (String)session.getAttribute("lecphoneNo");
                if(phone != null)
                {
                    int id = (int)session.getAttribute("onId");
                    Map<String, ImageFileObject> ifoMap = (Map<String, ImageFileObject>)session.getAttribute("ifoMap");
                    List<String> fileNames = ImageProcessor.createImages(phone, ifoMap, request);
                    boolean insert1 = UserDAO.SaveImageName(id, fileNames);
                    //String imagename = UserDAO.getSavedImageName(id);
                    session.removeAttribute("ifoMap");
                    session.removeAttribute("onId");
                    session.removeAttribute("phoneNo");
                    if(insert1)
                    {
                        Gson gson = new GsonBuilder().setPrettyPrinting().create();
                        String json = gson.toJson("Insertion of student data was successfull ");
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
                else if(lecphone != null)
                {
                    int lecid = (int)session.getAttribute("lecId");
                    Map<String, ImageFileObject> ifoMap = (Map<String, ImageFileObject>)session.getAttribute("ifoMap");
                    List<String> fileNames = ImageProcessor.createImages(lecphone, ifoMap, request);
                    boolean insert1 = UserDAO.SaveImageName(lecid, fileNames);
                    //String imagename = UserDAO.getSavedImageName(id);
                    session.removeAttribute("ifoMap");
                    session.removeAttribute("lecId");
                    session.removeAttribute("lecphoneNo");
                    if(insert1)
                    {
                        Gson gson = new GsonBuilder().setPrettyPrinting().create();
                        String json = gson.toJson("Insertion of student data was successfull ");
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

            }

        }
        catch(Exception xcp)
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
