package Quote;

import java.util.List;

public interface QuoteDB {

    /**
     * Get all quotes in the database
     * @return A list of quotes
     */
    List<Quote> all();

    /**
     * Add a single quote to the database.
     * @param quote the quote to add
     * @return the newly added Quote
     */
    Quote add(Quote quote);
}
