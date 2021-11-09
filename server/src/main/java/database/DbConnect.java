package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
    private final String database;

    public DbConnect(String database) {
        this.database = database;
        startDB();
    }

    public void startDB() {
        try( final Connection connection = DriverManager.getConnection( "jdbc:sqlite:" + database)){
            System.out.println( "Connected to database " );
            runTest( connection );
        }catch( SQLException e ){
            System.err.println( e.getMessage() );
        }
    }

    private void runTest( Connection connection ) {
        try( final Statement stmt = connection.createStatement() ){
            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS quotes(" +
                    "quote_id   INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "author     TEXT NOT NULL, " +
                    "text       TEXT NOT NULL)");
            System.out.println( "Success creating quotes table!" );
        }catch( SQLException e ){
            System.err.println( e.getMessage() );
        }
    }

    public void dropTables() {
        try( final Connection connection = DriverManager.getConnection( "jdbc:sqlite:" + database)){
            System.out.println( "Connected to database " );
            try( final Statement stmt = connection.createStatement() ){
                stmt.execute("DROP TABLE quotes");
                System.out.println( "Dropped world table!" );
            }catch( SQLException e ){
                System.err.println( e.getMessage() );
            }
        }catch( SQLException e ){
            System.err.println( e.getMessage() );
        }
        try( final Connection connection = DriverManager.getConnection( "jdbc:sqlite:robotworldTest.sqlite") ){
            System.out.println( "Connected to database " );

        }catch( SQLException e ){
            System.err.println( e.getMessage() );
        }
    }
}
