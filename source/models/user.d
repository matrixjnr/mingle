module models.user;

import hibernated.core;
import models.event;

// User class
class User {
    long id;
    string name;
    string email;
    string phone;
    string address;
    string password;

    // relationships
    Lazy!Event events;
}
