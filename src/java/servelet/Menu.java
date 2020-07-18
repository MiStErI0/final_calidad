
package servelet;

import Controlador.ConsultasMenu;
import Controlador.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Menu extends HttpServlet {

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
        
        HttpSession session = request.getSession(true);
        //session.setAttribute("usuario", request.getParameter("usuario"));
        
        String usuario = (String)session.getAttribute("usuario");
        
        Consultas co1=new Consultas();
        int idusuario = 1;//co1.datosUsuario(usuario);
        
        ConsultasMenu co=new ConsultasMenu();
        
        //String nombreMenu = co.listaMenu(idusuario);
        
        
        //response.sendRedirect("index_1.html", nombreMenu);
        /*if(nombreMen != ''){
              response.sendRedirect("index_1.html");
        }else{
              response.sendRedirect("index.jsp");  
        }*/
        
        
        /*if(nombreMenu.length() > 0){
            request.setAttribute("nombre","si hay datos");
            RequestDispatcher rd = request.getRequestDispatcher("iniciomenu.jsp");
            rd.forward(request, response);
        }else{
            request.setAttribute("nombre","no hay datos");
            //out.println("no hay datos");
            RequestDispatcher rd = request.getRequestDispatcher("iniciomenu.jsp");
            rd.forward(request, response);
        }*/
        //String t = "nadaaaa";
        //String n = request.getParameter(t);
        request.setAttribute("nombre","inicio");
        RequestDispatcher rd = request.getRequestDispatcher("iniciomenu.jsp");
        rd.forward(request, response);
        //out.print("erroreeeeee");
        //response.sendRedirect("iniciomenu.jsp");
        
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
        processRequest(request, response);
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

