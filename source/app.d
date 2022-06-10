import vibe.vibe;

//import modules
import utils;
import routes;



void main()
{

	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];
	auto listener = listenHTTP(settings, &index);
	scope (exit)
	{
		listener.stopListening();
	}

	logInfo("Please open http://127.0.0.1:8080/ in your browser.");
	runApplication();
}
