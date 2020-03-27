package ch.kup.widlflydocker;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("contacts")
public class ContactResource {

    @PersistenceContext
    EntityManager em;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Contact> getContacts() {
        return em.createQuery("select c from Contact c", Contact.class)
                .getResultList();
    }
}
