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
public class Usuario {
    public static final String CLIENTE = "cliente";
    public static final String ADMINISTRADOR = "administrador";
    public static final String EMPLEADO = "empleado";
    private String nombre;
    private String apellido;
    private String cedula;
    private String clave;
    private String correo;
    private String rol;
    private int id;

    public Usuario() {
    }

    public Usuario(String nombre, String apellido, String cedula, String clave, String correo, int id) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.cedula = cedula;
        this.clave = clave;
        this.correo = correo;
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public void setId(int id){
        this.id = id;
    }

    public int getId(){
        return id;
    }

}
