package ch.kup.widlflydocker;


import javax.annotation.PostConstruct;
import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Arrays;

@javax.ejb.Startup
@Singleton
public class Startup {

    @PersistenceContext
    EntityManager em;

    @PostConstruct
    public void init() {
        Arrays.asList(new Contact("Aaa"), new Contact("Bbb"))
                .forEach(c -> em.persist(c));
    }
}
