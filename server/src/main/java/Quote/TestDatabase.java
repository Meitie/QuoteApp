package Quote;

import database.DbInsert;
import database.DbRestore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TestDatabase implements QuoteDB {
    private Map<Integer, Quote> quotes;

    public TestDatabase() {
        quotes = new HashMap<>();
//        this.add(Quote.create("There is no snooze button on a cat who wants breakfast.", "Unknown"));
//        this.add(Quote.create("Never try to outstubborn a cat.","Robert A. Heinlein"));
//        this.add(Quote.create("To err is human, to purr is feline.", "Robert Byrne"));
    }

    @Override
    public List<Quote> all() {
        DbRestore dbRestore = new DbRestore("quotesdb.sqlite");
        quotes.clear();
        for (int i = 0; i < dbRestore.getQuotes().size(); i++) {
            this.add(Quote.create(dbRestore.getQuotes().get(i).getQuote(), dbRestore.getQuotes().get(i).getAuthor()));
        }
        return new ArrayList<>(quotes.values());
    }

    @Override
    public Quote add(Quote quote) {
        Integer index = quotes.size() + 1;
        quote.setId(index);
        quotes.put(index, quote);
        return quote;
    }
}