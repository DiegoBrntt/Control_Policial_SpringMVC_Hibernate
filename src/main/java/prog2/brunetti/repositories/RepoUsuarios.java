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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import prog2.brunetti.controlPolicialSpringMVC.HibernateUtil;
import prog2.brunetti.entities.Usuario;

/**
 *
 * @author Grandalf
 */
@Repository
public class RepoUsuarios {

    private final String dbFullURL;
    private final String dbUser;
    private final String dbPswd;

    
    private Usuario usuario;
    private List<Usuario> usuarios;

    @Autowired
    public RepoUsuarios(
            @Qualifier("dbName") String dbName,
            @Qualifier("dbURL") String dbURL,
            @Qualifier("dbUser") String dbUser,
            @Qualifier("dbPswd") String dbPswd) {
        dbFullURL = "jdbc:mysql://" + dbURL + "/" + dbName;
        this.dbUser = dbUser;
        this.dbPswd = dbPswd;
    }

    public String altaUsuario(String clave, String pass, LocalDate fecha_nacimiento, String tipo){
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            Usuario usu = Usuario.getInstance();
            usu.setClave(clave);
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
            String hashPass = encoder.encode(pass);
            usu.setPass(hashPass);
            int i = LocalDate.now().getYear() - fecha_nacimiento.getYear();
            
            if(LocalDate.now().getMonthValue() < fecha_nacimiento.getMonthValue()){
                usu.setEdad(i-1);
            } else {
                if(LocalDate.now().getMonthValue() > fecha_nacimiento.getMonthValue()){
                    usu.setEdad(i);
                } else {
                    if(LocalDate.now().getDayOfMonth() >= fecha_nacimiento.getDayOfMonth()){
                        usu.setEdad(i);
                    } else {
                        usu.setEdad(i-1);
                    }
                }
            }
            
            usu.setTipo(tipo);

            session.save(usu);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Usuario existente";
        }

    }
    public Usuario buscarUsuario(Integer usuario_id) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Usuario usu = session.get(Usuario.class, usuario_id);
            session.close();
            return usu;
        } catch (Exception e) {
            return null;
        }

    }
    public String modificacionUsuario(String clave, String pass, LocalDate fecha_nacimiento, String tipo, Integer usuario_id){
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            
            Usuario usu = session.get(Usuario.class, usuario_id);
            usu.setClave(clave);
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
            String hashPass = encoder.encode(pass);
            usu.setPass(hashPass);
            
            int i = LocalDate.now().getYear() - fecha_nacimiento.getYear();
            
            if(LocalDate.now().getMonthValue() < fecha_nacimiento.getMonthValue()){
                usu.setEdad(i-1);
            } else {
                if(LocalDate.now().getMonthValue() > fecha_nacimiento.getMonthValue()){
                    usu.setEdad(i);
                } else {
                    if(LocalDate.now().getDayOfMonth() >= fecha_nacimiento.getDayOfMonth()){
                        usu.setEdad(i);
                    } else {
                        usu.setEdad(i-1);
                    }
                }
            }
            
            
            usu.setTipo(tipo);
            
            session.update(usu);
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Error al modificar usuario";
        }

    }
    public String bajaUsuario(Integer usuario_id){
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.delete(session.get(Usuario.class, usuario_id));
            session.getTransaction().commit();
            session.close();
            return "OK";
        } catch (Exception e) {
            return "Usuario inexistente";
        }

    }
    

    public void validarUsuario(String clave, String pass) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("from Usuario as usuario where"
                    + " usuario.clave like '" + clave + "'");
            usuario = (Usuario) query.getSingleResult();
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
            if(!encoder.matches(pass, usuario.getPass())){
                usuario.setClave("");
                usuario.setPass("");
                usuario.setTipo("");
            }
            session.close();
        } catch (Exception e) {
            usuario = Usuario.getInstance();
            usuario.setClave("");
            usuario.setPass("");
            usuario.setTipo("");
        }

    }
    public void consultarUsuarios() {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("from Usuario");
            usuarios = query.getResultList();
            session.close();
        } catch (Exception e) {
            e.getMessage();
        }

    }

    public Usuario getUsuarioValido() {
        return usuario;
    }

    public List<Usuario> getUsuarios() {
        return usuarios;
    }

    public List<Usuario> getVigilantes() {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("from Usuario u where"
                    + " u.tipo like 'Vigilante'");
            List<Usuario> vig = query.getResultList();
            session.close();
            return vig;
        } catch (Exception e) {
            return  FactoriaArrayList.getInstance();
        }
    }

}
