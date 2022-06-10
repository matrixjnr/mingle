module models.user;

import std.experimental.logger;

import hunt.entity;

// User Table

@Table("user")
class User: Model
{
    mixin MakeModel;

    @PrimaryKey
    @AutoIncrement
    int id;

    string name;
    string phone;
    string email;
    string img;
    bool status;
}
