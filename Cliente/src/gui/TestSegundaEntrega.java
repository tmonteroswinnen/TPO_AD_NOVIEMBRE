package gui;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import businessDelegate.BusinessDelegate;
import dtos.CartaTiradaDTO;
import dtos.ChicoDTO;
import dtos.EnviteDTO;
import dtos.JugadorDTO;
import dtos.MovimientoDTO;
import dtos.ParejaDTO;
import dtos.PartidoDTO;
import enums.TipoEnvite;

public class TestSegundaEntrega {

	private BusinessDelegate businessDelegate = null;
	
	public static void main(String[] args) throws RemoteException {
		new TestSegundaEntrega();
	}
	
	
	public TestSegundaEntrega() throws RemoteException {
		
		businessDelegate = new BusinessDelegate();
		
		/*
		 * Jugador jug = new Jugador("Gaston","Gaston", "123");
		 * 
		 * JugadorDAO.getinstance().guardarJugador(jug);
		 * 
		 * jug = null;
		 * 
		 * JugadorDTO pepe = new JugadorDTO();
		 * pepe.setId(1);
		 * 
		 * jug = JugadorDAO.getinstance().buscarJugador(pepe);
		 * 
		 * Grupo juan = new Grupo("los totora", jug);
		 * 
		 * GrupoDAO.getInstancia().guardarGrupo(juan);
		 * juan=null;
		 * 
		 * GrupoDTO grupo = new GrupoDTO();
		 * grupo.setId(1);
		 * juan = GrupoDAO.getInstancia().buscarGrupo(grupo);
		 * 
		 * System.out.println(juan.getNombre());
		 */


		// ************** registrarJugador ************** //
/*
		JugadorDTO jugador = new JugadorDTO();

		jugador.setApodo("cgodio");
		jugador.setMail("cgodio@uade.edu.ar");
		jugador.setPassword("12345");

		try {
			ServicioCentral.getInstance().registrarJugador(jugador);
		} catch (JugadorException e) {
			System.err.println(e.getMessage());
		}

		jugador.setApodo("cgodio");
		jugador.setMail("cgodio@gmail.com");
		jugador.setPassword("99999");

		try {
			ServicioCentral.getInstance().registrarJugador(jugador);
		} catch (JugadorException e) {
			System.err.println(e.getMessage());
		}
*/

		// ************** iniciarSesion ************** //
/*
		jugador.setApodo("sbraceras");
		jugador.setPassword("TaTObrA");

		try {
			ServicioCentral.getInstance().iniciarSesion(jugador);
		} catch (JugadorException e) {
			System.err.println(e.getMessage());
		}
*/
		
		
		// ************** Crear Grupo ************** //
/*
		jugador.setId(4);
		
		GrupoDTO grupo = new GrupoDTO();
		grupo.setNombre("UADE");
				
		ServicioCentral.getInstance().crearGrupo(grupo, jugador);
*/
		
		// ************** Agregar Miembros a Grupos ************** //
/*
		ArrayList<JugadorDTO> jugadores = ServicioCentral.getInstance().obtenerJugadores();
		List<JugadorDTO> agregar = new ArrayList<JugadorDTO>();
		
		agregar.add(jugadores.get(1));
		agregar.add(jugadores.get(2));
		
		ServicioCentral.getInstance().agregarJugadorGrupo(agregar, grupo , jugador);
*/


		// ************** Jugar Libre Individual ************** //

		JugadorDTO jugador1 = new JugadorDTO();
		JugadorDTO jugador2 = new JugadorDTO();
		JugadorDTO jugador3 = new JugadorDTO();
		JugadorDTO jugador4 = new JugadorDTO();
		
		// hardcodeamos los id porque deberian venir desde la vista cargados
		
//		jugador1.setId(1);
		jugador1.setApodo("jugador1");
		jugador1.setPassword("jugador1");

//		jugador2.setId(4);
		jugador2.setApodo("jugador2");
		jugador2.setPassword("jugador2");

//		jugador3.setId(3);
		jugador3.setApodo("jugador3");	
		jugador3.setPassword("jugador3");
		
//		jugador4.setId(15);
		jugador4.setApodo("jugador4");
		jugador4.setPassword("jugador4");

		try {
			jugador1 = businessDelegate.login(jugador1);
		} catch (RemoteException e) {
			System.err.println(e.getMessage());
		}
		try {
			jugador2 = businessDelegate.login(jugador2);
		} catch (RemoteException e) {
			System.err.println(e.getMessage());
		}
		try {
			jugador3 = businessDelegate.login(jugador3);
		} catch (RemoteException e) {
			System.err.println(e.getMessage());
		}
		try {
			jugador4 = businessDelegate.login(jugador4);
		} catch (RemoteException e) {
			System.err.println(e.getMessage());
		}	

		// ************** Controlamos si se armo Partido ************** //
		System.out.println("");

		PartidoDTO part1 = null;
		PartidoDTO part2 = null;
		PartidoDTO part3 = null;
		PartidoDTO part4 = null;

		try {
			part1 = businessDelegate.jugarLibreIndividual(jugador1);
			part2 = businessDelegate.jugarLibreIndividual(jugador2);
			part3 = businessDelegate.jugarLibreIndividual(jugador3);
			part4 = businessDelegate.jugarLibreIndividual(jugador4);
		}
		catch (RemoteException e) {
			System.err.println("Error al Intentar Jugar Libre Individual: " + e.getMessage());
		}
				
		if (part4 != null) {
			System.out.println("Se armo un partido! Inicio: " + part4.getFechaInicio());
			System.out.println("El partido nuevo es: " + part4.getId());
		}

		if (part3 == null) {
			List<PartidoDTO> partidosPendientes;
			try {
				partidosPendientes = businessDelegate.tengoPartido(jugador3);
				if (!partidosPendientes.isEmpty()){
					part3 = partidosPendientes.get(partidosPendientes.size()-1);
					System.out.println("El partido nuevo es: " + part3.getId());
				}
			} catch (RemoteException e) {
				e.printStackTrace();
			}
		}

		if (part2 == null) {
			List<PartidoDTO> partidosPendientes;
			try {
				partidosPendientes = businessDelegate.tengoPartido(jugador2);
				if (!partidosPendientes.isEmpty()){
					part2 = partidosPendientes.get(partidosPendientes.size()-1);
					System.out.println("El partido nuevo es: " + part2.getId());
				}
			} catch (RemoteException e) {
				e.printStackTrace();
			}
		}

		if (part1 == null) {
			List<PartidoDTO> partidosPendientes;
			try {
				partidosPendientes = businessDelegate.tengoPartido(jugador1);
				if (!partidosPendientes.isEmpty()){
					part1 = partidosPendientes.get(partidosPendientes.size()-1);
					System.out.println("El partido nuevo es: " + part1.getId());
				}
			} catch (RemoteException e) {
				e.printStackTrace();
			}
		}

		// ejecutamos las 4 ventanas de juego
		try {
			VentanaPrueba ventana1 = new VentanaPrueba(part1, jugador1);
			VentanaPrueba ventana2 = new VentanaPrueba(part2, jugador2);
			VentanaPrueba ventana3 = new VentanaPrueba(part3, jugador3);
			VentanaPrueba ventana4 = new VentanaPrueba(part4, jugador4);
		}
		catch(RemoteException e){
			System.out.println("Error al crear las Ventanas de Prueba: " + e.getMessage());
		}
		
		JugadorDTO jugadorBuscar = new JugadorDTO();
		jugadorBuscar.setId(11);
		
		List<PartidoDTO> partidosLevantados = businessDelegate.levantarPartidosTerminadosJugador(jugadorBuscar);
		
		if(partidosLevantados!= null)
		{
			for(PartidoDTO part: partidosLevantados)
				System.out.println("Se levanto el Partido: " + part.getId());
		}
		
		PartidoDTO partidoBuscar = new PartidoDTO();
		MovimientoDTO mov = new MovimientoDTO();
		mov.setId(496);
		partidoBuscar.setId(233);
		
		List<MovimientoDTO> movimientos = new ArrayList<MovimientoDTO>();
		
		movimientos = businessDelegate.obtenerProximoMovimientoPartido(jugadorBuscar, partidoBuscar, mov);
		
		
		System.out.println("Quiero obtener el Proximo Movimiento del Id: " + mov.getId());
		
		
		for(MovimientoDTO movimiento: movimientos)
		{
			if(movimiento instanceof EnviteDTO)
			{
				System.out.println("IdMovimiento: "+ movimiento.getId() +" Del Movimiento es" + movimiento.getId() + " y es el Envite:" + ((EnviteDTO)movimiento).getTipoEnvite());
			}
			else
			{
				System.out.println("IdMovimiento: "+ movimiento.getId()+" Del Jugador" + ((CartaTiradaDTO)movimiento).getCartaJugador().getJugador().toString() + " tiro la Carta " + ((CartaTiradaDTO)movimiento).getCartaJugador().getCarta().toString());
			}
		}
		
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		
		
		ParejaDTO ganadora = businessDelegate.obtenerParejaGanadoraPartido(jugadorBuscar, partidoBuscar);
		
		System.out.println("La Pareja Ganadora es: " + ganadora.getJugador1() + " y " + ganadora.getJugador2());
		
		List<ChicoDTO> puntajes = businessDelegate.obtenerResultadoFinalPartido(jugadorBuscar, partidoBuscar);
		
		for(ChicoDTO chico: puntajes)
		{
			System.out.println("El chico N�" + chico.getNumeroChico() + " Salio: ");
			System.out.println("                  "+ chico.getPuntajes().get(0).getPareja().getJugador1()+ " y " + chico.getPuntajes().get(0).getPareja().getJugador2());
			System.out.println("                  " + chico.getPuntajes().get(0).getPuntaje());
			System.out.println();
			System.out.println();
			System.out.println("                  "+ chico.getPuntajes().get(1).getPareja().getJugador1()+ " y " + chico.getPuntajes().get(1).getPareja().getJugador2());
			System.out.println("                  " + chico.getPuntajes().get(1).getPuntaje());
		}
		
		
	

		
		// ************** Obtenemos las cartas de los Jugadores ************** //
	/*	System.out.println("");

		List<CartaJugadorDTO> cartasJugador1 = new ArrayList<CartaJugadorDTO>();
		List<CartaJugadorDTO> cartasJugador2 = new ArrayList<CartaJugadorDTO>();
		List<CartaJugadorDTO> cartasJugador3 = new ArrayList<CartaJugadorDTO>();
		List<CartaJugadorDTO> cartasJugador4 = new ArrayList<CartaJugadorDTO>();
		try {
			cartasJugador1 = businessDelegate.obtenerCartasJugador(part1, jugador1);
			cartasJugador2 = businessDelegate.obtenerCartasJugador(part2, jugador2);
			cartasJugador3 = businessDelegate.obtenerCartasJugador(part3, jugador3);
			cartasJugador4 = businessDelegate.obtenerCartasJugador(part4, jugador4);

			System.out.println("Cartas del jugador " + jugador1.getApodo());
			for(CartaJugadorDTO cartaJugador: cartasJugador1) {
				System.out.println("  Puede tirar: " + cartaJugador.getCarta().toString());
			}
			System.out.println("");

			System.out.println("Cartas del jugador " + jugador2.getApodo());
			for(CartaJugadorDTO cartaJugador: cartasJugador2) {
				System.out.println("  Puede tirar: " + cartaJugador.getCarta().toString());
			}
			System.out.println("");

			System.out.println("Cartas del jugador " + jugador3.getApodo());
			for(CartaJugadorDTO cartaJugador: cartasJugador3) {
				System.out.println("  Puede tirar: " + cartaJugador.getCarta().toString());
			}
			System.out.println("");

			System.out.println("Cartas del jugador " + jugador4.getApodo());
			for(CartaJugadorDTO cartaJugador: cartasJugador4) {
				System.out.println("  Puede tirar: " + cartaJugador.getCarta().toString());
			}
			System.out.println("");

		} catch (RemoteException e) {
			e.printStackTrace();
		}


		// ************** EMPEZAMOS A JUGAR !!! ************** //
		System.out.println("");

		JugadorDTO turnoJugador = new JugadorDTO();
		try {
			turnoJugador = businessDelegate.obtenerJugadorActual(part1, jugador1);
			System.out.println("Le toca jugar a: " + turnoJugador.getApodo());
		} catch (RemoteException e) {
			e.printStackTrace();
		}

		// ************** Obtenemos los cantos Posibles del jugador actual ************** //
		System.out.println("");

		try {
			List<TipoEnvite> opciones = businessDelegate.obtenerEnvitesDisponibles(part1, turnoJugador);
			if (opciones.isEmpty()) {
				System.out.println("El jugador " + turnoJugador.getApodo() +  " no puede cantar nada!");
			} else {
				for(TipoEnvite envite: opciones) {
					System.out.println("El jugador " + turnoJugador.getApodo() + " puede cantar: " + envite.name());
				}
			}
		} catch (RemoteException e) {
			e.printStackTrace();
		}

		CartaTiradaDTO cartaTirada = new CartaTiradaDTO();
		cartaTirada.setFechaHora(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		if (turnoJugador.getApodo().equals(jugador1.getApodo())) {
			// tiramos la primer carta del jugador1
			cartaTirada.setCartaJugador(cartasJugador1.get(0));
		} else if (turnoJugador.getApodo().equals(jugador2.getApodo())) {
			cartaTirada.setCartaJugador(cartasJugador2.get(0));
		} else if (turnoJugador.getApodo().equals(jugador3.getApodo())) {
			cartaTirada.setCartaJugador(cartasJugador3.get(0));
		} else if (turnoJugador.getApodo().equals(jugador4.getApodo())) {
			cartaTirada.setCartaJugador(cartasJugador4.get(0));
		}
		try {
			System.out.println("");
			System.out.println("Voy a tirar la Carta: " + cartaTirada.getCartaJugador().getCarta().toString());
			businessDelegate.nuevoMovimientoPartido(part3, turnoJugador, cartaTirada);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
				
		// ************** SIMULAMOS EL SEGUNDO MOVIMIENTO DE LA BAZA ************** //
		System.out.println("");
		
		turnoJugador = new JugadorDTO();
		try {
			turnoJugador = businessDelegate.obtenerJugadorActual(part1, jugador1);
			System.out.println("Le toca jugar a: " + turnoJugador.getApodo());
		} catch (RemoteException e) {
			e.printStackTrace();
		}

		// ************** Obtenemos los cantos Posibles del jugador actual ************** //

		try {
			List<TipoEnvite> opciones = businessDelegate.obtenerEnvitesDisponibles(part2, turnoJugador);
			if (opciones.isEmpty()) {
				System.out.println("El jugador " + turnoJugador.getApodo() +  " no puede cantar nada!");
			} else {
				for(TipoEnvite envite: opciones) {
					System.out.println("El jugador " + turnoJugador.getApodo() + " puede cantar: " + envite.name());
				}
			}
		} catch (RemoteException e) {
			e.printStackTrace();
		}

		cartaTirada = new CartaTiradaDTO();
		cartaTirada.setFechaHora(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		if (turnoJugador.getApodo().equals(jugador1.getApodo())) {
			// tiramos la segunda carta del jugador1
			cartaTirada.setCartaJugador(cartasJugador1.get(1));
		} else if (turnoJugador.getApodo().equals(jugador2.getApodo())) {
			cartaTirada.setCartaJugador(cartasJugador2.get(1));
		} else if (turnoJugador.getApodo().equals(jugador3.getApodo())) {
			cartaTirada.setCartaJugador(cartasJugador3.get(1));
		} else if (turnoJugador.getApodo().equals(jugador4.getApodo())) {
			cartaTirada.setCartaJugador(cartasJugador4.get(1));
		}
		try {
			System.out.println("Voy a tirar la Carta: " + cartaTirada.getCartaJugador().getCarta().toString());
			businessDelegate.nuevoMovimientoPartido(part3, turnoJugador, cartaTirada);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		

		// ************** Intentamos tirar una carta y NO es el turno del jugador! ************** //

		cartaTirada.setFechaHora(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		cartaTirada.setCartaJugador(cartasJugador4.get(1));
		try {
			System.out.println("Trata de Tirar el Jugador " + jugador4.getApodo() + " el " + cartaTirada.getCartaJugador().getCarta().toString());
			businessDelegate.nuevoMovimientoPartido(part4, jugador4, cartaTirada);
		} catch (RemoteException e) {
			e.printStackTrace();
		}

		// ************** SIMULAMOS EL TERCER MOVIMIENTO DE LA BAZA ************** //
		turnoJugador = new JugadorDTO();
		try {
			turnoJugador = businessDelegate.obtenerJugadorActual(part1, jugador1);
			System.out.println("Le toca jugar a: " + turnoJugador.getApodo());
		} catch (RemoteException e) {
			e.printStackTrace();
		}

		// ************** Obtenemos los cantos Posibles del jugador actual ************** //

		List<TipoEnvite> opciones;
		try {
			opciones = businessDelegate.obtenerEnvitesDisponibles(part2, turnoJugador);
			if (opciones.isEmpty()) {
				System.out.println("El jugador " + turnoJugador.getApodo() +  " no puede cantar nada!");
			} else {
				for(TipoEnvite envite: opciones) {
					System.out.println("El jugador " + turnoJugador.getApodo() + " puede cantar: " + envite.name());
				}
			}
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		
		// ************** SE TIENE QUE PODER CANTAR ENVIDO ************** //
	
		EnviteDTO envite = new EnviteDTO();
		envite.setTipoEnvite(TipoEnvite.Envido);
		envite.setFechaHora(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		
		try {
			businessDelegate.nuevoMovimientoPartido(part1, turnoJugador, envite);
		} catch (RemoteException e) {
			
			e.printStackTrace();
		}
		
		// ************** TENDRIA QUE PODER CONTESTAR ALGUIEN ************** //
	
		turnoJugador = new JugadorDTO();
		try {
			turnoJugador = businessDelegate.obtenerJugadorActual(part1, jugador1);
			System.out.println("Le toca contestar a: " + turnoJugador.getApodo());
		} catch (RemoteException e) {
			e.printStackTrace();
		}

		
		// ************** Obtenemos los cantos Posibles del jugador actual ************** //

		try {
			opciones = businessDelegate.obtenerEnvitesDisponibles(part2, turnoJugador);
			if (opciones.isEmpty()) {
				System.out.println("El jugador " + turnoJugador.getApodo() +  " no puede cantar nada!");
			} else {
				for(TipoEnvite tipoEnvite: opciones) {
					System.out.println("El jugador " + turnoJugador.getApodo() + " puede cantar: " + tipoEnvite.name());
				}
			}
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		
		
		
		/* PROBAMOS HASTA ACA *//////
		
		

		// ************** Se Prueba Obtener un Partido ************** //
/*

		PartidoDTO partidoObtenido = new PartidoDTO();
		partidoObtenido.setId(46);
	
		try {
			Partido partido = businessDelegate.obtenerPartido(partidoObtenido);
			System.out.println("Se Obtuvo el Partido ID: "+ partido.getId());
		} catch (PartidoException e) {
			e.printStackTrace();

*/


		
		// ************** Se Prueba Obtener Partidos de un Jugador Entre Fechas ************** //
		
		/* DESARROLLAR */
		
		
	}
	
	
}


