package Quote;

public class Quote {
    private Integer id;
    private String quote;
    private String author;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuote() {
        return quote;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    /**
     * Use this convenient factory method to create a new quote.
     * Warning the ID will be null!
     * @param text the text of the quote
     * @param name the name of the person that said the text
     * @return a Quote object
     */
    public static Quote create(String text, String name) {
        Quote quote = new Quote();
        quote.setQuote(text);
        quote.setAuthor(name);
        return quote;
    }
}
