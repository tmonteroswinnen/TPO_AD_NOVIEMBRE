package entities;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import daos.PartidoDAO;
import dtos.ChicoDTO;
import dtos.JugadorDTO;
import dtos.MovimientoDTO;
import dtos.ParejaDTO;
import dtos.PartidoDTO;
import enums.EstadoPartido;
import enums.TipoCategoria;
import enums.TipoEnvite;
import enums.TipoPartido;
import exceptions.BazaException;
import exceptions.ChicoException;
import exceptions.JugadorException;
import exceptions.ManoException;
import exceptions.PartidoException;


/**
 * Partido esta compuesto por varios chicos. 
 * 
 * Va a ser el controladorDelJuego, es decir, quien va a jugar, que cosas se cantaron, conoce todo.
**/

@Entity
@Table (name = "Partidos")
public class Partido {
	@Id 
	@Column (name = "id_partido", nullable = false)
	@GeneratedValue
	private int id;

	@OneToMany (cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn (name = "id_partido")
	private List<Pareja> parejas;
	
//	@OneToOne (cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@OneToOne (fetch = FetchType.EAGER)
	@JoinColumn (name = "id_pareja")
	private Pareja parejaGanadora;

	@Column (name = "fecha_inicio")
	private Timestamp fechaInicio;

	@Column (name = "fecha_fin")
	private Timestamp fechaFin;

	@Column (columnDefinition = "int")
	private TipoPartido tipoPartido;

	@Column (columnDefinition = "int")
	private EstadoPartido estadoPartido;
	
	@OneToMany (cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	@JoinColumn (name = "id_partido")
	private List<Chico> chicos;


	public Partido() {
		
	}

	public Partido(List<Pareja> parejas, Timestamp fechaInicio, TipoPartido tipoPartido) {
		this.chicos = new ArrayList<Chico>();
		this.parejas = parejas;
		this.parejaGanadora = null;
		this.fechaInicio = fechaInicio;
		this.tipoPartido = tipoPartido;
		this.estadoPartido = EstadoPartido.Empezado;
		this.fechaFin = null;
		this.fechaInicio = fechaInicio;

		this.chicos.add(new Chico(this,1, 30, this.parejas));
	}
	
	public PartidoDTO toDTO (){
		
		PartidoDTO dto = new PartidoDTO();
		List<ChicoDTO> chicosDto = new ArrayList<ChicoDTO>();
		for(int i=0; i<chicos.size(); i++){
			chicosDto.add(chicos.get(i).toDto());
			
		}
		
		dto.setEstadoPartido(this.estadoPartido);
		
		dto.setFechaFin(this.fechaFin);
		dto.setFechaInicio(this.fechaInicio);
		dto.setId(this.id);
		if(parejaGanadora != null)
			dto.setParejaGanadora(this.parejaGanadora.toDTO());
		else
			dto.setParejaGanadora(null);
		dto.setTipoPartido(this.tipoPartido);
		List<ParejaDTO> parejasDto = new ArrayList<ParejaDTO>();
		
		for(int i=0; i<parejas.size();i++){
			parejasDto.add(parejas.get(i).toDTO());
		}
		dto.setChicos(chicosDto);
		dto.setParejas(parejasDto);
		
		return dto;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setParejas(List<Pareja> parejas) {
		this.parejas = parejas;
	}

	public void setChicos(List<Chico> chicos) {
		this.chicos = chicos;
	}

	public List<Chico> getChicos() {
		return chicos;
	}

	public void setChicos(ArrayList<Chico> chicos) {
		this.chicos = chicos;
	}

	public List<Pareja> getParejas() {
		return parejas;
	}

	public void setParejas(ArrayList<Pareja> parejas) {
		this.parejas = parejas;
	}

	public Pareja getParejaGanadora() {
		return parejaGanadora;
	}

	public void setParejaGanadora(Pareja parejaGanadora) {
		this.parejaGanadora = parejaGanadora;
	}

	public Timestamp getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Timestamp fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Timestamp getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Timestamp fechaFin) {
		this.fechaFin = fechaFin;
	}

	public TipoPartido getTipoPartido() {
		return tipoPartido;
	}

	public void setTipoPartido(TipoPartido tipoPartido) {
		this.tipoPartido = tipoPartido;
	}

	public EstadoPartido getEstadoPartido() {
		return estadoPartido;
	}

	public void setEstadoPartido(EstadoPartido estadoPartido) {
		this.estadoPartido = estadoPartido;
	}

	
	public boolean sosTipoPartido(TipoPartido tipo) {
		return tipo==this.tipoPartido;
	}
	
	public boolean sosDelPeriodo(Date desde, Date hasta) {
		if(this.fechaInicio.equals(desde))
			return true;
		else
			if(this.fechaInicio.after(desde))
			{
				if(this.fechaInicio.equals(hasta))
					return true;
				else
					if(this.fechaFin.before(hasta))
						return true;
			}
		return false;
	}
	
	public boolean participoJugador(Jugador jugador) {
		for(int i=0; i<parejas.size();i++) {
			if(parejas.get(i).tenesJugador(jugador))
				return true;
		}
		return false;
	}

	public Chico obtenerChicoActivo() {
		Chico aux = null;

		for (int i=0; i<chicos.size(); i++) {
			if (chicos.get(i).isTerminado() == false)
				aux = chicos.get(i);
		}
		return aux;
	}

	public void actualizarRankingJugadores() throws JugadorException {
		Pareja perdedora= null;
		if(parejas.get(0).esPareja(parejaGanadora))
			perdedora = parejas.get(1);
		else
			perdedora= parejas.get(0);
		
		
		if (tipoPartido.equals(TipoPartido.Grupo)) {
			parejaGanadora.getJugador1().actualizarRanking(5, this);
			parejaGanadora.getJugador2().actualizarRanking(5, this);
			
			/*Actualizar Ranking de los MiembrosGrupo*/
			
			parejaGanadora.getJugador1().actualizarRankingMiembro(this, 5);
			parejaGanadora.getJugador2().actualizarRankingMiembro(this, 5);
			
			perdedora.getJugador1().actualizarRankingMiembro(this, 0);
			perdedora.getJugador2().actualizarRankingMiembro(this, 0);

		} else {
			//es libre individual o libre parejas
			TipoCategoria categoriaOponente = perdedora.obtenerCategoriaSuperior();
			
			if(parejaGanadora.getJugador1().getCategoria().ordinal()<categoriaOponente.ordinal()) //el jugador 1 es inferior
				parejaGanadora.getJugador1().actualizarRanking(12, this);
			else
				parejaGanadora.getJugador1().actualizarRanking(10, this);
			
			if(parejaGanadora.getJugador2().getCategoria().ordinal()<categoriaOponente.ordinal()) //el jugador 2 es inferior
				parejaGanadora.getJugador2().actualizarRanking(12, this);
			else
				parejaGanadora.getJugador2().actualizarRanking(10, this);
		}
		
		perdedora.getJugador1().actualizarRanking(0, this);
		perdedora.getJugador2().actualizarRanking(0, this);
		
		//Actualizo las categor�a de cada jugador para comprobar si bajo de categor�a
		
		for(Pareja pareja: parejas){
			pareja.getJugador1().comprobarCambioCategoria();
			pareja.getJugador2().comprobarCambioCategoria();
		}
	}

	public boolean estasTerminado() {		
		return (estadoPartido.equals(EstadoPartido.Terminado));
	}

	public boolean sosPartido(PartidoDTO partido) {
		return partido.getId() == this.id;
	}

	public void cerrarChico () throws PartidoException, JugadorException{
		int  chicosGanadosPareja1 =0;
		int  chicosGanadosPareja2 =0;
		
		if(estadoPartido != EstadoPartido.Terminado){
			Pareja ganadoraChico;
			for(Chico chico: chicos){
				ganadoraChico = chico.obtenerParejaGanadora();
				if(parejas.get(0).esPareja(ganadoraChico))
						chicosGanadosPareja1++;
					else
						chicosGanadosPareja2++;
				}
			}
			
			if(chicosGanadosPareja1 == 2 || chicosGanadosPareja2 == 2) {
//				fechaFin = (Timestamp) new Date();
				fechaFin = new Timestamp (Calendar.getInstance().getTimeInMillis());
				estadoPartido = EstadoPartido.Terminado;

				if(chicosGanadosPareja1 == 2) {
					parejaGanadora = parejas.get(0);
				} else
					parejaGanadora = parejas.get(1);

				actualizarRankingJugadores();

				PartidoDAO.getInstance().update(this);
			} else
			{
				//No se termino el partido, aun faltan chicos por jugar
				chicos.add(new Chico(this, chicos.size()+1, 30, this.parejas));								
			}
	}
	

	public JugadorDTO turnoCartaJugador (){
		if(estadoPartido != EstadoPartido.Terminado) {
			Chico chico = obtenerChicoActivo();

			if(chico.tocaCarta() == true){
				return chico.obtenerTurnoJugador().toDTO();
			}
		}
		
		return null;
	}

	public void nuevoMovimiento(Jugador jugador, Movimiento movimiento) throws PartidoException, BazaException, JugadorException {
		if (!this.estasTerminado()) {
			// deberia haber un Chico activo! 
			Chico chico = obtenerChicoActivo();

			if (!chico.obtenerUltimaMano().getJugadorActual().equals(jugador))
				throw new PartidoException("Error grave: Nunca puede llamar a 'nuevoMovimiento' si no es su turno");

			chico.agregarMovimiento(jugador, movimiento);

			// Se guardan los cambios en el partido 
			PartidoDAO.getInstance().update(this);
		}
	}

	public List<TipoEnvite> obtenerEnvitesPosibles() {
		return obtenerChicoActivo().obtenerUltimaMano().obtenerEnvitesPosibles();
	}

	public void levantar() {
		
		for(Chico chico: chicos){
			chico.levantar(this);
		}
		
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((estadoPartido == null) ? 0 : estadoPartido.hashCode());
		result = prime * result + id;
		result = prime * result + ((tipoPartido == null) ? 0 : tipoPartido.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Partido other = (Partido) obj;
		if (estadoPartido != other.estadoPartido)
			return false;
		if (id != other.id)
			return false;
		if (tipoPartido != other.tipoPartido)
			return false;
		return true;
	}

	public List<Movimiento> obtenerProximoMovimiento (MovimientoDTO ultimoMovimiento) throws ChicoException, ManoException {
	
		//le sumo 1 al movimiento ya que el proximo a analizar ser� el que necesita
		
		
		
		if(ultimoMovimiento == null)
		{//Es el primer Movimiento el que tengo que devolver
			List<Movimiento> movimientos = new ArrayList<Movimiento>();
			
			movimientos.add(chicos.get(0).getManos().get(0).getBazas().get(0).getTurnosBaza().get(0));
			return movimientos;
		}
		else
		{
			//Me dio un movimiento, tengo que conseguir el proximo y devolver los anteriores
			ultimoMovimiento.setId(ultimoMovimiento.getId()+1);
			for(Chico chico: chicos)
			{
				if(chico.tenesMovimiento(ultimoMovimiento))
					return chico.getProximoMovimiento(ultimoMovimiento);
			}
		}
		
		//no hay proximo movimiento, devuelvo una lista vacia para avisar que el partido termino 
		
		return new ArrayList<Movimiento>();
		
	}

	public List<CartaJugador> getCartasJugadores(MovimientoDTO movimiento) throws ChicoException, PartidoException {
		
		
		for(Chico chico: chicos){
			
			if(chico.tenesMovimiento(movimiento))
			{
				return chico.getCartasJugadoresPartido(movimiento);
			}
		}
		
		throw new PartidoException("Error grave: Nunca puede pedir cartas de un movimiento que no Existe");
		
	}
	


}
