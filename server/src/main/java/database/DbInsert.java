package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class DbInsert {

    public DbInsert(String database, String author, String quote) {
        try( final Connection connection = DriverManager.getConnection( "jdbc:sqlite:" + database) ){
            System.out.println( "Connected to database " );
            insertIntoQuotes(connection, author, quote);
        }catch( SQLException e ){
            System.err.println( e.getMessage() );
        }
    }

    private void insertIntoQuotes( final Connection connection, String author, String quote) throws SQLException {
        try( final PreparedStatement stmt = connection.prepareStatement(
                "INSERT INTO quotes(author, text) VALUES (?, ?)"
        )){
            stmt.setString( 1, author );
            stmt.setString( 2, quote );
            final boolean gotAResultSet = stmt.execute();

            if( gotAResultSet ){
                throw new RuntimeException( "Unexpectedly got a SQL resultset." );
            }else{
                final int updateCount = stmt.getUpdateCount();
                if( updateCount == 1 ){
                    System.out.println( "1 row INSERTED into quotes" );
                }else{
                    throw new RuntimeException( "Expected 1 row to be inserted, but got " + updateCount );
                }
            }
        }
    }
}
