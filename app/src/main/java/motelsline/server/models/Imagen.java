/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package motelsline.server.models;

/**
 *
 * @author MotelsLine
 */
public class Imagen {

    private int id;
    private String nombre;

    public Imagen(){
    }

    public Imagen(int id, String nombre){
        this.id = id;
        this.nombre = nombre;
    }

    public void setId(int id){
        this.id = id;
    }

    public int getId(){
        return id;
    }

    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    public String getNombre(){
        return nombre;
    }
}
