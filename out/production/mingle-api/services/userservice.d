module services.userservice;

import models.user;
import utils.dbutils;

import std.stdio;

import hunt.entity;

class UserService{



    public:
        // insert new user to database
        void insertUser(User user){
            //auto user = new User();
            //user.name = "Brian";
            //user.email = "brian@huntlabs.cn";
            //user.money = 99.9;

            // initialize entity manager
            EntityManager em = entityManager;

            em.getTransaction().begin();

            // insert user
            em.persist(user);
            writeln("User id is: ", user.id);
        }
}


