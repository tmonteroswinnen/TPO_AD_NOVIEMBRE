package servlets;


import java.io.IOException;
import java.rmi.RemoteException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import businessDelegate.BusinessDelegate;
import dtos.JugadorDTO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}
	
	
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String apodo = request.getParameter("apodo");
		String contrasena = request.getParameter("contrasena");
		
		JugadorDTO jg = new JugadorDTO();
		jg.setApodo(apodo);
		jg.setPassword(contrasena);
		
		HttpSession session = request.getSession(true); // El metodo 'request.getSession(true)' devuelve la session asociada 
														// a la session http o una nueva session si no hay ningun identificador 
														// en la session http.
		if(session.isNew())
			System.out.println("Nueva session");
		else
			System.out.println("Jugador en sesion - El ID es: " + session.getId());

		session.removeAttribute("resultadoLogin");
		
		try {
			
			
			jg =     BusinessDelegate.getInstancia().login(jg);

			request.setAttribute("jugador", jg);


			RequestDispatcher rd = null;
			rd = request.getRequestDispatcher("/juego.html");

			rd.forward(request, response);
		} catch (Exception e) {
			session.setAttribute("resultadoLogin", false);
		}
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);

	}

}
