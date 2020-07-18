
package servelet;

import Controlador.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RegistrarTipoTelefono extends HttpServlet {

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
        String nombretipotelefono = request.getParameter("nombretipotelefono");
        if(nombretipotelefono != null && !nombretipotelefono.isEmpty()){ //valida campo no este vacio
        Consultas co=new Consultas();
            boolean pr = co.registrar_tipotelefono(nombretipotelefono);
            if(pr){
               request.setAttribute("error", false);
               RequestDispatcher rd = request.getRequestDispatcher("formsRegistrarTipoTelefono.jsp");
               rd.forward(request, response);
            }else{
               request.setAttribute("error", true);
               request.setAttribute("msg", "No se pudo registrar los datos");
               RequestDispatcher rd = request.getRequestDispatcher("formsRegistrarTipoTelefono.jsp");
               rd.forward(request, response);
            }
        }else{
            request.setAttribute("error", true);
            request.setAttribute("msg", "Ingresa todos los campos");
            RequestDispatcher rd = request.getRequestDispatcher("formsRegistrarTipoTelefono.jsp");
            rd.forward(request, response);
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

