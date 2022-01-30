/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.repositories;

import java.util.List;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import prog2.brunetti.controlPolicialSpringMVC.HibernateUtil;
import prog2.brunetti.entities.Juez;
import prog2.brunetti.entities.Juzgado;

/**
 *
 * @author Grandalf
 */
@Repository
public class RepoJueces {

    private final String dbFullURL;
    private final String dbUser;
    private final String dbPswd;

    @Autowired
    public RepoJueces(
            @Qualifier("dbName") String dbName,
            @Qualifier("dbURL") String dbURL,
            @Qualifier("dbUser") String dbUser,
            @Qualifier("dbPswd") String dbPswd) {
        dbFullURL = "jdbc:mysql://" + dbURL + "/" + dbName;
        this.dbUser = dbUser;
        this.dbPswd = dbPswd;
    }
    
    public List<Juez> getJueces() {
        List<Juez> jueces;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Juez j order by j.numero_juzgado asc");
        jueces = query.getResultList();
        session.close();
        return jueces;
    }

    public String altaJuez(Integer numero_juzgado, String nombre_ape, Integer tiempo_servicio) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Juez juez = Juez.getInstance();
            juez.setAños_serv(tiempo_servicio);
            juez.setNombre_ape(nombre_ape);
            juez.setNumero_juzgado(session.get(Juzgado.class, numero_juzgado));

            session.save(juez);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Juez ya existente";
        }
    }
    public Juez buscarJuez(Integer juez_id) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Juez juez = session.get(Juez.class, juez_id);
            session.getTransaction().commit();
            session.close();
            return juez;
        } catch (Exception e) {
            return null;
        }
    }
    public String bajaJuez(Integer juez_id) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Juez juez = buscarJuez(juez_id);
            session.delete(juez);
            
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Juez ya existente";
        }
    }

    public String modificarJuez(Integer juez_id, String nombre_ape, Integer tiempo_servicio, Integer numero_juzgado) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Juez juez = buscarJuez(juez_id);
            juez.setAños_serv(tiempo_servicio);
            juez.setNombre_ape(nombre_ape);
            juez.setNumero_juzgado(session.get(Juzgado.class, numero_juzgado));

            session.update(juez);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Juez ya existente";
        }
    }
    
}
