package Quote;

import database.DbConnect;
import io.javalin.Javalin;

public class QuoteServer {
    private final Javalin server;

    public QuoteServer() {
        server = Javalin.create(config -> {
            config.defaultContentType = "application/json";
        });
        DbConnect dbConnect = new DbConnect("quotesdb.sqlite");
        dbConnect.startDB();

        this.server.get("/fetchQuotes", context -> QuoteApiHandler.getAll(context));
        this.server.post("/create%20quote/", context -> QuoteApiHandler.create(context));
    }

    public static void main(String[] args) {
        QuoteServer server = new QuoteServer();
        server.start(5000);
    }

    public void start(int port) {
        this.server.start(port);
    }

    public void stop() {
        this.server.stop();
    }
}
