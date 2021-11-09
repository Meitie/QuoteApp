package database;

import Quote.Quote;

import java.sql.*;
import java.util.ArrayList;

public class DbRestore {
    private ArrayList<Quote> quotes;
    Quote newQuote = new Quote();
    Quote addQuote;

    public DbRestore(String database) {
        try( final Connection connection = DriverManager.getConnection( "jdbc:sqlite:" + database) ){
            System.out.println( "Connected to database " );
            quotes = readAllQuotes(connection);
        }catch( SQLException e ){
            System.err.println( e.getMessage() );
        }
    }

    public ArrayList<Quote> getQuotes() {
        return quotes;
    }

    private ArrayList<Quote> readAllQuotes (final Connection connection) throws SQLException {
        try( final PreparedStatement stmt = connection.prepareStatement(
                "SELECT * FROM quotes;"
        )){
            final boolean gotAResultSet = stmt.execute();
            ArrayList<Quote> obsLists = new ArrayList<>();
            if( ! gotAResultSet ){
                throw new RuntimeException( "Expected a SQL resultset, but we got an update count instead!" );
            }
            try( ResultSet results = stmt.getResultSet() ){
                while( results.next() ){
                    newQuote.setId(results.getInt("quote_id"));
                    newQuote.setQuote(results.getString("text"));
                    newQuote.setAuthor(results.getString("author"));
                    addQuote = newQuote;
                    newQuote = new Quote();
                    obsLists.add(addQuote);
                }
                return obsLists;
            }
        }
    }

}
