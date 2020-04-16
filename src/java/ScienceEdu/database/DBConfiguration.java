/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ScienceEdu.database;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author Jevison7x
 */
public final class DBConfiguration
{

    private Properties prop;

    private String driverName;

    private String dbUser;

    private String dbPass;

    private Properties loadRemoteDBProperties() throws IOException, IllegalArgumentException
    {
        try(InputStream dbPropInputStream = DBConfiguration.class.getResourceAsStream("Config.remote.properties");)
        {
            this.prop = new Properties();
            this.prop.load(dbPropInputStream);
            return this.prop;
        }
        catch(IOException | IllegalArgumentException xcp)
        {
            throw xcp;
        }
    }

    private Properties loadLocalDBProperties() throws IOException, IllegalArgumentException
    {
        try(InputStream dbPropInputStream = DBConfiguration.class.getResourceAsStream("Config.local.properties");)
        {
            this.prop = new Properties();
            this.prop.load(dbPropInputStream);
            return this.prop;
        }
        catch(IOException | IllegalArgumentException xcp)
        {
            throw xcp;
        }
    }

    public void loadDatabaseDriver() throws ClassNotFoundException, IOException, IllegalArgumentException
    {
        try
        {
            this.driverName = this.prop.getProperty("driverName");
            Class.forName(this.driverName);
        }
        catch(ClassNotFoundException | IllegalArgumentException xcp)
        {
            throw xcp;
        }
    }

    private Connection getConnection() throws ClassNotFoundException, IllegalArgumentException, IOException, SQLException
    {
        this.dbUser = this.prop.getProperty("db.user");
        this.dbPass = this.prop.getProperty("db.pass");
        this.loadDatabaseDriver();
        return DriverManager.getConnection(this.prop.getProperty("science_education_db.url"), this.dbUser, this.dbPass);
    }

    public Connection getDatabaseConnection() throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        try
        {
            try
            {
                this.prop = loadRemoteDBProperties();
                return this.getConnection();
            }
            catch(SQLException xcp)
            {
                this.prop = loadLocalDBProperties();
                return this.getConnection();
            }
        }
        catch(SQLException | IOException | IllegalArgumentException xcp)
        {
            throw xcp;
        }
    }
}
