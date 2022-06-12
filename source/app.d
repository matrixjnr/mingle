import vibe.vibe;

//import modules
import utils;
import routes;



void main()
{

	// create router
	auto router = new URLRouter;

	router.get("/", &index);
	router.get("/a", &indexe);
	
	// router.get("/users/:username", &name);


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
