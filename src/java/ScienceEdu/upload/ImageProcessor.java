/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ScienceEdu.upload;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Jevison7x
 */
public class ImageProcessor
{
    private static final String ORIGINALS_DIRECTORY = "originals";

    private static final String THUMBNAILS_DIRECTORY = "thumbnails";

    private static final String UPLOADS_PATH = "/ProfileImage";

    /**
     * Compresses a given image in bytes
     *
     * @param original the original image in bytes
     * @return the compressed image in bytes
     * @throws IOException
     */
    private static byte[] compressImage(byte[] original, String fileExt) throws IOException
    {
        BufferedImage bImg = ImageIO.read(new ByteArrayInputStream(original));
        int imgWidth = bImg.getWidth();
        int scaledDownWidth = 600;
        BufferedImage scaledBimg;
        if(imgWidth > scaledDownWidth)
        {
            //Scale the image down to 600 pixels in with
            Image scaledImage = bImg.getScaledInstance(scaledDownWidth, -1, Image.SCALE_FAST);
            //convert image to buffered image
            scaledBimg = toBufferedImage(scaledImage);//Convert buffered image to byte array
        }
        else
            scaledBimg = bImg;
        try(ByteArrayOutputStream baos = new ByteArrayOutputStream();)
        {
            ImageIO.write(scaledBimg, fileExt, baos);
            byte[] imageInByte = baos.toByteArray();
            return imageInByte;
        }
        finally
        {
            bImg.flush();
        }

    }

    /**
     * Converts a given Image into a BufferedImage
     *
     * @param img The Image to be converted
     * @return The converted BufferedImage
     */
    public static BufferedImage toBufferedImage(Image img)
    {
        if(img instanceof BufferedImage)
            return (BufferedImage)img;

        // Create a buffered image without transparency
        BufferedImage bimage = new BufferedImage(img.getWidth(null), img.getHeight(null), BufferedImage.OPAQUE);

        // Draw the image on to the buffered image
        Graphics2D bGr = bimage.createGraphics();
        bGr.drawImage(img, 0, 0, null);
        bGr.dispose();

        // Return the buffered image
        return bimage;
    }

    public static List<String> createImages(String phone, Map<String, ImageFileObject> ifoMap, HttpServletRequest request) throws FileNotFoundException, IOException
    {
        Set<String> keySet = ifoMap.keySet();
        List<String> fileNames = new ArrayList<>();
        for(String key : keySet)
        {

            ImageFileObject ifo = ifoMap.get(key);
            String lastName = ifo.getFileName();
            String fileName = phone + "_" + key + "_" + lastName.replaceAll(" ", "_");
            String fileExt = ifo.getFileNameExtension();
            byte[] imageBytes = ifo.getByteArray();
            byte[] thumbnailBytes = compressImage(imageBytes, fileExt);
            //Where to save the image part
            ServletContext adminContext = request.getServletContext();
            ServletContext uploadsContext = adminContext.getContext(UPLOADS_PATH);
            String absolutePath = uploadsContext.getRealPath("");
            File originalsDirectory = new File(absolutePath + File.separator + ORIGINALS_DIRECTORY);
            if(!originalsDirectory.exists())
                originalsDirectory.mkdir();
            File thumbNailsDirectory = new File(absolutePath + File.separator + THUMBNAILS_DIRECTORY);
            if(!thumbNailsDirectory.exists())
                thumbNailsDirectory.mkdir();
            try(FileOutputStream originalFOS = new FileOutputStream(absolutePath + File.separator + ORIGINALS_DIRECTORY + File.separator + fileName);
                    FileOutputStream thumbnailFOS = new FileOutputStream(absolutePath + File.separator + THUMBNAILS_DIRECTORY + File.separator + fileName);)
            {
                originalFOS.write(imageBytes);
                thumbnailFOS.write(thumbnailBytes);
                fileNames.add(fileName);
            }
        }
        return fileNames;
    }

    public static byte[] getImageBytes(String fileName, HttpServletRequest request, boolean compressed) throws FileNotFoundException, IOException
    {
        String imagesDirectory = compressed ? THUMBNAILS_DIRECTORY : ORIGINALS_DIRECTORY;
        ServletContext servletContext = request.getServletContext();
        ServletContext servletContext2 = servletContext.getContext(UPLOADS_PATH);
        String absolutePath = servletContext2.getRealPath("");
        File file = new File(absolutePath + File.separator + imagesDirectory + File.separator + fileName);
        try(FileInputStream fis = new FileInputStream(file))
        {
            byte fileContent[] = new byte[(int)file.length()];
            fis.read(fileContent);
            return fileContent;
        }
    }
}
