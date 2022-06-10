module utils.dbutils;

import hunt.entity;

auto entityManager(){
    auto option = new EntityOption;

    option.database.driver = "mysql";
    option.database.host = "localhost";
    option.database.port = 3306;

    option.database.database = "test";
    option.database.username = "root";
    option.database.password = "";
    option.database.charset = "utf8mb4";
    option.database.prefix = "mng_";

    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default", option);
    EntityManager em = entityManagerFactory.createEntityManager();

    // begin transaction
    //auto x = em.getTransaction().begin();

    return em;
}
