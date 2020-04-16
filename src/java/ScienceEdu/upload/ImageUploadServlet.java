/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ScienceEdu.upload;

import ScienceEdu.utility.ZaapMartException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Jevison7x
 */
public class ImageUploadServlet extends HttpServlet
{

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession(true);
        if(session != null)
            if(!ServletFileUpload.isMultipartContent(request))
                throw new IllegalArgumentException("Request is not multipart, please add 'multipart/form-data' enctype for your form.");
            else
            {
                ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
                FileUploadProgressListener fileUploadProgressListener = new FileUploadProgressListener();
                uploadHandler.setProgressListener(fileUploadProgressListener);
                session.setAttribute("fileUploadProgressListener", fileUploadProgressListener);
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                Object obj = session.getAttribute("ifoMap");
                Map<String, ImageFileObject> ifoMap = obj != null ? (Map<String, ImageFileObject>)obj : new Hashtable<>();

                JSONArray jsonArray = new JSONArray();
                try
                {
                    List<FileItem> items = uploadHandler.parseRequest(request);
                    String imageType = this.getImageType(items);
                    for(FileItem item : items)
                        if(!item.isFormField())
                        {
                            ImageFileObject ifo = new ImageFileObject(item);
                            ifoMap.put(imageType, ifo);
                            session.setAttribute("ifoMap", ifoMap);
                            JSONObject jsonObj = new JSONObject();
                            jsonObj.put("name", item.getName());
                            jsonObj.put("size", item.getSize());
                            jsonObj.put("url", "uploaded-image.jpg?getfile=" + item.getName());
                            jsonArray.put(jsonObj);
                        }
                }
                catch(Exception xcp)
                {
                    xcp.printStackTrace(out);
                }
                finally
                {
                    out.write(jsonArray.toString());
                    out.flush();
                    out.close();
                }
            }
        else
        {
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            JSONArray json = new JSONArray();
            JSONObject jsono = new JSONObject();
            try
            {
                jsono.put("ErrorMgs", "There is no session");
                json.put(jsono);
                //System.out.println(json.toString());
            }
            catch(JSONException xcp)
            {
                xcp.printStackTrace(out);
            }
            finally
            {
                out.write(json.toString());
                out.flush();
                out.close();
            }
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            HttpSession session = request.getSession(false);
            if(session != null && session.getAttribute("ifoMap") != null)
            {
                Map<String, ImageFileObject> ifoMap = (Map<String, ImageFileObject>)session.getAttribute("ifoMap");
                String fileName = request.getParameter("getfile");
                for(ImageFileObject ifo : ifoMap.values())
                    if(ifo.getFileName().equals(fileName))
                    {
                        byte[] byteArray = ifo.getByteArray();
                        response.reset();
                        response.setContentType(this.getMimeType(fileName));
                        response.getOutputStream().write(byteArray);
                        break;
                    }
            }
            else
                throw new RuntimeException("The session is invalid!");
        }
        catch(Exception xcp)
        {
            throw new ZaapMartException(xcp, request);
        }
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

    private String getMimeType(String fileName)
    {
        String mimetype = "";
        if(!fileName.isEmpty())
            if(getSuffix(fileName).equalsIgnoreCase("png"))
                mimetype = "image/png";
            else if(getSuffix(fileName).equalsIgnoreCase("jpg"))
                mimetype = "image/jpg";
            else if(getSuffix(fileName).equalsIgnoreCase("jpeg"))
                mimetype = "image/jpeg";
            else if(getSuffix(fileName).equalsIgnoreCase("gif"))
                mimetype = "image/gif";
            else
            {
                MimetypesFileTypeMap mtMap = new MimetypesFileTypeMap();
                mimetype = mtMap.getContentType(fileName);
            }
        return mimetype;
    }

    private String getSuffix(String extension)
    {
        String suffix = "";
        int pos = extension.lastIndexOf('.');
        if(pos > 0 && pos < extension.length() - 1)
            suffix = extension.substring(pos + 1);
        return suffix;
    }

    private String getImageType(List<FileItem> items) throws IOException, IllegalArgumentException
    {
        String itemFieldNames = new String();
        for(FileItem item : items)
        {
            String fieldName = item.getFieldName();
            itemFieldNames += fieldName + ", ";
            if(fieldName.equals("imageType"))
                try(InputStream inputStream = item.getInputStream();)
                {
                    byte[] byteArray = new byte[inputStream.available()];
                    inputStream.read(byteArray);
                    String imageType = new String(byteArray);
                    return imageType;
                }
        }
        throw new IllegalArgumentException("There is no imageType in the list of file items: " + itemFieldNames);
    }
}
