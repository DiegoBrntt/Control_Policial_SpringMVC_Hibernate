/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.repositories;

import java.time.LocalDate;
import java.util.List;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import prog2.brunetti.controlPolicialSpringMVC.HibernateUtil;
import prog2.brunetti.entities.Caso;
import prog2.brunetti.entities.CondenaDetalle;
import prog2.brunetti.entities.Detenido;
import prog2.brunetti.entities.Juez;
import prog2.brunetti.entities.Sucursal;

/**
 *
 * @author Grandalf
 */
@Repository
public class RepoCasos {

    private final String dbFullURL;
    private final String dbUser;
    private final String dbPswd;

    @Autowired
    public RepoCasos(
            @Qualifier("dbName") String dbName,
            @Qualifier("dbURL") String dbURL,
            @Qualifier("dbUser") String dbUser,
            @Qualifier("dbPswd") String dbPswd) {
        dbFullURL = "jdbc:mysql://" + dbURL + "/" + dbName;
        this.dbUser = dbUser;
        this.dbPswd = dbPswd;
    }

    public List<Caso> getCasos() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Caso c order by c.codigo_caso asc");
        List<Caso> casos = query.getResultList();
        session.close();
        return casos;
    }

    public List<List> getCondenados() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query;
        List<List> condenas = FactoriaArrayList.getInstance();
        for (Caso caso : getCasos()) {
            query = session.createQuery("Select c.codigo_det from CondenaDetalle as c "
                    + "where c.codigo_caso like '" + caso.getCodigo_caso() + "'");

            List<Detenido> condenados = query.getResultList();
            condenas.add(condenados);
        }
        session.close();

        return condenas;
    }

    public String altaCaso(Integer codigo_suc, LocalDate fecha_caso, Integer tiempo_condena, Integer condenaB, Integer juez_id, List<Integer> condenados) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            if (condenaB == 1) {
                Caso caso = Caso.getInstance();
                caso.setCodigo_suc(session.get(Sucursal.class, codigo_suc));
                caso.setCondena(condenaB);
                caso.setFecha_caso(fecha_caso);
                for (Caso casoAux : getCasos()) {
                    if (casoAux.getFecha_caso().isEqual(fecha_caso)) {
                        for (CondenaDetalle cond : casoAux.getCondenados()) {
                            for (Integer condenado : condenados) {
                                if (cond.getCodigo_det().getCodigo_det().equals(condenado)) {
                                    session.close();
                                    return "Uno o mas condenados ya tenian un delito la misma fecha";
                                }
                            }
                        }
                    }
                }
                caso.setTiempo_condena(tiempo_condena);
                caso.setJuez_id(session.get(Juez.class, juez_id));
                session.save(caso);

                for (Integer condenado : condenados) {
                    CondenaDetalle detalle = CondenaDetalle.getInstance();
                    detalle.setCodigo_caso(caso);
                    detalle.setCodigo_det(session.get(Detenido.class, condenado));
                    session.save(detalle);
                }
            } else {
                Caso caso = Caso.getInstance();
                caso.setCodigo_suc(session.get(Sucursal.class, codigo_suc));
                caso.setCondena(condenaB);
                caso.setFecha_caso(fecha_caso);
                caso.setTiempo_condena(0);
                caso.setJuez_id(session.get(Juez.class, juez_id));
                session.save(caso);
            }

            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    public Caso buscarCaso(Integer codigo_caso) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Caso ent = session.get(Caso.class, codigo_caso);
            session.getTransaction().commit();
            session.close();
            return ent;
        } catch (Exception e) {
            return null;
        }
    }

    public String bajaCaso(Integer codigo_caso) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Caso caso = buscarCaso(codigo_caso);
            session.delete(caso);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Caso inexistente";
        }
    }

    public String modificarCaso(Integer codigo_caso, Integer codigo_suc, LocalDate fecha_caso, Integer tiempo_condena, Integer condenaB, Integer juez_id, List<Integer> condenados) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Caso caso = buscarCaso(codigo_caso);
            if (condenaB == 1) {

                caso.setCodigo_suc(session.get(Sucursal.class, codigo_suc));
                caso.setCondena(condenaB);
                caso.setFecha_caso(fecha_caso);
                for (Caso casoAux : getCasos()) {
                    if (casoAux.getFecha_caso().isEqual(fecha_caso) && !caso.getFecha_caso().isEqual(fecha_caso)) {
                        for (CondenaDetalle cond : casoAux.getCondenados()) {
                            for (Integer condenado : condenados) {
                                if (cond.getCodigo_det().getCodigo_det().equals(condenado)) {
                                    session.close();
                                    return "Uno o mas condenados ya tenian un delito la misma fecha";
                                }
                            }
                        }
                    }
                }
                caso.setTiempo_condena(tiempo_condena);
                caso.setJuez_id(session.get(Juez.class, juez_id));
                caso.getCondenados().clear();

                for (Integer condenado : condenados) {
                    CondenaDetalle detalle = CondenaDetalle.getInstance();
                    detalle.setCodigo_caso(caso);
                    detalle.setCodigo_det(session.get(Detenido.class, condenado));
                    session.saveOrUpdate(detalle);
                }
                session.update(caso);

            } else {
                caso.setCodigo_suc(session.get(Sucursal.class, codigo_suc));
                caso.setCondena(condenaB);
                caso.setFecha_caso(fecha_caso);
                caso.setTiempo_condena(0);
                caso.setJuez_id(session.get(Juez.class, juez_id));
                caso.getCondenados().clear();
                session.update(caso);
            }

            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return e.getMessage();
        }
    }

}
