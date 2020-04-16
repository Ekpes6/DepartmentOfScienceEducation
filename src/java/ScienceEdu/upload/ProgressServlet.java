/** ************************************************************** */
/* Copyright 2013 Code Strategies                                */
 /* This code may be freely used and distributed in any project.  */
 /* However, please do not remove this credit if you publish this */
 /* code in paper or electronic form, such as on a web site.      */
/** ************************************************************** */
package ScienceEdu.upload;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProgressServlet extends HttpServlet
{

    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if(session == null)
        {
            out.println("Sorry, session is null"); // just to be safe
            return;
        }

        FileUploadProgressListener fileUploadProgressListener = (FileUploadProgressListener)session.getAttribute("fileUploadProgressListener");
        if(fileUploadProgressListener == null)
        {
            out.println("Progress listener is null");
            return;
        }

        out.println(fileUploadProgressListener.getMessage());

    }
}
