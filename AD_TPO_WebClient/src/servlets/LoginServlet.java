package servlets;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import businessDelegate.BusinessDelegate;
import dtos.*;
import enums.*;
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
		
		System.out.println("Apodo: " + apodo + " Contrasena: " +contrasena);

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
			RequestDispatcher rd = null;
			
			request.setAttribute("jugador", jg);


			
			rd = getServletContext().getRequestDispatcher("/juego.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			RequestDispatcher rd = null;
			rd = getServletContext().getRequestDispatcher("/index_error.html");
			rd.forward(request, response);
			
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
