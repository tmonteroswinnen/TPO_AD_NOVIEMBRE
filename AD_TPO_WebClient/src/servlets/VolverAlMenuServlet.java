package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dtos.JugadorDTO;



@WebServlet ("/VolverAlMenu")
public class VolverAlMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VolverAlMenuServlet() {
        super();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}




	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idJugador = Integer.valueOf(request.getParameter("idJugador")).intValue();
		String apodoJugador = request.getParameter("apodoJugador");
		
		JugadorDTO jugador = new JugadorDTO();
		jugador.setApodo(apodoJugador);
		jugador.setId(idJugador);
		
		RequestDispatcher rd = null;		
		request.setAttribute("jugador", jugador);
		rd = getServletContext().getRequestDispatcher("/opciones.jsp");
		rd.forward(request, response);
	}
	
}
