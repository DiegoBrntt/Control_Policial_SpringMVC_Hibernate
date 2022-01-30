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
import prog2.brunetti.entities.Juzgado;

/**
 *
 * @author Grandalf
 */
@Repository
public class RepoJuzgados {

    private final String dbFullURL;
    private final String dbUser;
    private final String dbPswd;

    @Autowired
    public RepoJuzgados(
            @Qualifier("dbName") String dbName,
            @Qualifier("dbURL") String dbURL,
            @Qualifier("dbUser") String dbUser,
            @Qualifier("dbPswd") String dbPswd) {
        dbFullURL = "jdbc:mysql://" + dbURL + "/" + dbName;
        this.dbUser = dbUser;
        this.dbPswd = dbPswd;
    }
    
    public String altaJuzgado(Integer numero_juzgado){
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Juzgado juz = Juzgado.getInstance();
            juz.setNumero_juzgado(numero_juzgado);

            session.save(juz);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Juzgado ya existente";
        }

    }
    public Juzgado buscarJuzgado(Integer juzgado_id) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Juzgado juz = session.get(Juzgado.class, juzgado_id);
            session.close();
            return juz;
        } catch (Exception e) {
            return null;
        }
    }
    public String modificarJuzgado(Integer juzgado_id, Integer numero_juzgado) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Juzgado juz = buscarJuzgado(juzgado_id);
            juz.setNumero_juzgado(numero_juzgado);

            session.update(juz);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Banda ya existente";
        }
    }
    public String bajaJuzgado(Integer juzgado_id) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            
            Juzgado juz = buscarJuzgado(juzgado_id);
            session.delete(juz);
            
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Banda ya existente";
        }
    }
    
    public List<Juzgado> getJuzgados() {
        List<Juzgado> juzgados;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Juzgado j order by j.numero_juzgado asc");
        juzgados = query.getResultList();
        session.close();
        return juzgados;
    }
}
