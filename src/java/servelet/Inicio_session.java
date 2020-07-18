
package servelet;

import Controlador.Consultas;
import Controlador.ConsultasMenu;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
import javax.servlet.RequestDispatcher;

public class Inicio_session extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //String[] menus; //= (String[])request.getAttibute("");
        String usuario = request.getParameter("usuario");
        String psw = request.getParameter("password");
        Consultas co=new Consultas();
        String msg = "";
        
        if(co.autentificacion(usuario, psw)){
              //obtener ultima sesion e invalidar
              HttpSession oldSession = request.getSession(false);
              if (oldSession != null) {
                oldSession.invalidate();
              }
              HttpSession session = request.getSession(true);
              session.setAttribute("usuario", usuario);
              //getServletContext().setAttribute("usuario",usuario);
              int idcargo = co.datosUsuario(usuario);//obtiene idusuario
              int idusuario = co.idUsuario(usuario);//obtiene idusuario
              session.setAttribute("idcargo",idcargo);
              session.setAttribute("idusuario",idusuario);
              session.setMaxInactiveInterval(10*60);//tiempo de expiracion - 10 min
                           
              //Cookie message = new Cookie("welcome", "Bienvenido");
              //response.addCookie(message);
			  System.out.println("holaaaa");
              RequestDispatcher rd = request.getRequestDispatcher("inicio.jsp");
              rd.forward(request, response);
        }else{
              msg = "Datos incorrectos";
			  System.out.println("datos incorrectos");
              request.setAttribute("msg", msg);
              //out.print("Datos incorrectos!");
              //request.getRequestDispatcher("index.jsp").include(request, response);
              RequestDispatcher rd = request.getRequestDispatcher("login.jsp");         
              rd.include(request, response);
              //response.sendRedirect("index.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //me llega la url "proyecto/login/out"
        String action=(request.getPathInfo()!=null?request.getPathInfo():"");
        HttpSession session = request.getSession();
        /*if(action.equals("/out")){
            sesion.invalidate();
            response.sendRedirect("index.jsp");
        }else{
           
        }*/
        //processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
