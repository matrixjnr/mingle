module routes;

import std.json;
import std.conv : to;
import vibe.vibe;


void index(HTTPServerRequest req, HTTPServerResponse res)
{
	string msg = `{"message":"welcome to Ming.le API v1.0.0"}`;
	JSONValue json = parseJSON(msg);
	res.writeJsonBody(json);
}