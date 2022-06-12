module appinfo.appcontroller;

import vibe.http.common : HTTPMethod;
import vibe.web.rest;
import vibe.vibe;
import vibe.web.auth;
import utils.restcontroller : RestController;
import utils.loggeduser;

@path("/")
class AppController : RestController
{
    void index(HTTPServerRequest req, HTTPServerResponse res)
    {
        string msg = `{"message":"welcome to Ming.le API v1.0.0"}`;
        JSONValue json = parseJSON(msg);
        res.writeJsonBody(json);
    }

}