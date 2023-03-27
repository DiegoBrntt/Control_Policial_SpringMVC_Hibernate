/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.repositories;

import java.util.ArrayList;

/**
 *
 * @author Grandalf
 */
public class FactoriaArrayList {
    public static <E> ArrayList<E> getInstance(){
        return new ArrayList<E>();
    }
}
