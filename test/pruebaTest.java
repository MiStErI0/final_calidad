/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Controlador.ConsultasEliminar;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author UserTBS
 */
public class pruebaTest {

	public pruebaTest() {
	}

	@BeforeClass
	public static void setUpClass() {
	}

	@AfterClass
	public static void tearDownClass() {
	}

	@Before
	public void setUp() {
	}

	@After
	public void tearDown() {
	}

	// TODO add test methods here.
	// The methods must be annotated with annotation @Test. For example:
	//
	@Test
	public void hello() {

		ConsultasEliminar consul = new ConsultasEliminar();

		if (true == consul.eliminarCliente(5)) {
			System.out.println("OK eliminarCliente");
		} else {
			System.out.println("Fail eliminarCliente");
		}

		if (true == consul.eliminarEstadoPedido(5)) {
			System.out.println("OK eliminarEstadoPedido");
		} else {
			System.out.println("Fail eliminarEstadoPedido");
		}

		if (true == consul.eliminarMarca(5)) {
			System.out.println("OK eliminarMarca");
		} else {
			System.out.println("Fail eliminarMarca");
		}

		if (true == consul.eliminarOperador(5)) {
			System.out.println("OK eliminarOperador");
		} else {
			System.out.println("Fail eliminarOperador");
		}

		if (true == consul.eliminarProducto(5)) {
			System.out.println("OK eliminarProducto");
		} else {
			System.out.println("Fail eliminarProducto");
		}
		if (true == consul.eliminarTipoCliente(5)) {
			System.out.println("OK eliminarTipoCliente");
		} else {
			System.out.println("Fail eliminarTipoCliente");
		}
		if (true == consul.eliminarTipoDocumento(5)) {
			System.out.println("OK eliminarTipoDocumento");
		} else {
			System.out.println("Fail eliminarTipoDocumento");
		}
		if (true == consul.eliminarTipoPersona(5)) {
			System.out.println("OK eliminarTipoPersona");
		} else {
			System.out.println("Fail eliminarTipoPersona");
		}
		if (true == consul.eliminarTipoProducto(5)) {
			System.out.println("OK eliminarTipoProducto");
		} else {
			System.out.println("Fail eliminarTipoProducto");
		}
		if (true == consul.eliminarTipoTelefono(5)) {
			System.out.println("OK eliminarTipoTelefono");
		} else {
			System.out.println("Fail eliminarTipoTelefono");
		}
		if (true == consul.eliminarTipoUsuario(5)) {
			System.out.println("OK eliminarTipoUsuario");
		} else {
			System.out.println("Fail eliminarTipoUsuario");
		}

	}
}
