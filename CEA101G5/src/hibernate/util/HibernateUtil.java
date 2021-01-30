/*
 * This class not only produces the global org.hibernate.SessionFactory reference in its static initializer;
 * it also hides the fact that it uses a static singleton
*/

package hibernate.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.productqa.model.ProductQAVO;

public class HibernateUtil {

    private static final SessionFactory sessionFactory;

    static {
    	// ���U�A��
    	final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
        try {
        	// �Ы�SessionFactory
        	sessionFactory = new MetadataSources( registry ).buildMetadata().buildSessionFactory();
        } catch (Throwable ex) {
        	// The registry would be destroyed by the SessionFactory, but we had trouble building the SessionFactory
    		// so destroy it manually.
        	StandardServiceRegistryBuilder.destroy(registry);
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

}