module users.authdto;

import vibe.data.json;
import vibe.vibe;

class LoginResponseDto
{
    string accessToken;
    long id;
    string name;

    this(string accessToken, long id, string name)
    {
        this.id = id;
        this.accessToken = accessToken;
        this.name = name;
    }
}

class LoginRequestDto
{
    string accessToken;

    this(Json body)
    {
        if (body["accessToken"].type == Json.Type.string)
        {
            this.accessToken = body["accessToken"].to!string;
        }
        else
        {
            throw new HTTPStatusException(HTTPStatus.BadRequest, "\"accessToken\" missing");
        }
    }
}

class AuthRequestDto
{
    string email;
    string password;

    this(string email, string password)
    {
        this.email = email;
        this.password = password;
    }
}