import vibe.vibe;

//import modules
import appinfo.appcontroller;



void main()
{

	// create router
	URLRouter router = new URLRouter();

	AppController appController = new AppController();
	router.registerWebInterface(appController);

	router.any("*", (HTTPServerRequest req, HTTPServerResponse res) {
		res.headers["Access-Control-Allow-Origin"] = "*";
		res.headers["Access-Control-Allow-Headers"] = "*";
		res.writeBody("");
	});

	HTTPServerRequestDelegate handleCORS()
	{
		return (HTTPServerRequest req, HTTPServerResponse res) {
			res.headers["Access-Control-Allow-Origin"] = "*";
			res.headers["Access-Control-Allow-Headers"] = "*";
			router.handleRequest(req, res);
		};
	}


	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];
	auto listener = listenHTTP(settings, router);
	scope (exit)
	{
		listener.stopListening();
	}

	logInfo("Please open http://127.0.0.1:8080/ in your browser.");
	runApplication();
}
