module utils.myutils;

import hibernated.core;

import models.user;
import models.event;

//class for db connection
class DBCon{

    auto dbconnection(){
        EntityMetaData schema = new SchemaInfoImpl!(User, Event);

        // setup DB connection factory
        import ddbc.drivers.sqliteddbc;
            SQLITEDriver driver = new SQLITEDriver();
            string url = "mingle.db"; // file with DB
            static import std.file;
            if (std.file.exists(url))
                std.file.remove(url); // remove old DB file
            string[string] params;
            Dialect dialect = new SQLiteDialect();

        DataSource ds = new ConnectionPoolDataSourceImpl(driver, url, params);
        

        // create session factory
        SessionFactory factory = new SessionFactoryImpl(schema, dialect, ds);
        scope(exit) factory.close();

        // Create schema if necessary
        {
        // get connection
        Connection conn = ds.getConnection();
        scope(exit) conn.close();
        // create tables if not exist
        factory.getDBMetaData().updateDBSchema(conn, false, true);
        }

        // Now you can use HibernateD

        // create session
        Session sess = factory.openSession();
        scope(exit) sess.close();

        return sess;
    }

}