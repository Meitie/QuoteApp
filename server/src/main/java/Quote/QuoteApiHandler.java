package Quote;

import database.DbInsert;
import io.javalin.http.Context;
import io.javalin.http.HttpCode;

public class QuoteApiHandler {
    private static final QuoteDB database = new TestDatabase();

    /**
     * Get all quotes
     *
     * @param context The Javalin Context for the HTTP GET Request
     */
    public static void getAll(Context context) {
        context.json(database.all());
    }

    /**
     * Create a new quote
     *
     * @param context The Javalin Context for the HTTP POST Request
     */
    public static void create(Context context) {
        Quote quote = context.bodyAsClass(Quote.class);
        Quote newQuote = database.add(quote);
        new DbInsert("quotesdb.sqlite", newQuote.getAuthor(), newQuote.getQuote());
        context.header("Location", "/quote/" + newQuote.getId());
        context.status(HttpCode.CREATED);
        context.json(newQuote);
    }
}
