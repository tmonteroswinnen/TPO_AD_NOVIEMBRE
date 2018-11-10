package servlets;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import enums.TipoCategoria;


public class Jugador_DTOtest implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String apodo;

	private String mail;
	private String password;
	private TipoCategoria categoria;
	


	public Jugador_DTOtest() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getApodo() {
		return apodo;
	}

	public void setApodo(String apodo) {
		this.apodo = apodo;
	}

	

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public TipoCategoria getCategoria() {
		return categoria;
	}

	public void setCategoria(TipoCategoria categoria) {
		this.categoria = categoria;
	}

	

	@Override
	public String toString() {
		return id + " - " + apodo + " (" + mail + ") - " + categoria;
	}

}
