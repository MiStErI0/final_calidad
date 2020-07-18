
package servelet;

import Controlador.ConsultasModificar;
import Controlador.ConsultasEliminar;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModificarTipoProducto extends HttpServlet {

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
        String p = request.getParameter("fntipoproducto");
        if(p.equals("modificarTipoProducto")){
            int idtipoproducto = Integer.parseInt(request.getParameter("idtipoproducto"));
            String nombretipoproducto = request.getParameter("nombretipoproducto");

            ConsultasModificar co = new ConsultasModificar();
            boolean mu = co.modificarTipoProducto(idtipoproducto, nombretipoproducto);
            if(mu){
               request.setAttribute("error", false);
               RequestDispatcher rd = request.getRequestDispatcher("formsModificarTipoProducto.jsp");
               rd.forward(request, response);
            }else{
               request.setAttribute("error", true);
               RequestDispatcher rd = request.getRequestDispatcher("formsModificarTipoProducto.jsp");
               rd.forward(request, response);
            }  
        }else if(p.equals("camposModificar")){
            int idtipoproducto = Integer.parseInt(request.getParameter("idtipoproducto"));
            String nombretipoproducto = request.getParameter("nombretipoproducto");

            request.setAttribute("idtipoproducto", idtipoproducto);
            request.setAttribute("nombretipoproducto", nombretipoproducto);
            
            RequestDispatcher rd = request.getRequestDispatcher("formsModificarTipoProducto.jsp");
            rd.forward(request, response);
        }else if( p.equals("eliminarTipoProducto")){
            int idtipoproducto = Integer.parseInt(request.getParameter("idtipoproducto"));
            ConsultasEliminar co = new ConsultasEliminar();
            boolean eu = co.eliminarTipoProducto(idtipoproducto);
            if(eu){
               request.setAttribute("error", false);
               RequestDispatcher rd = request.getRequestDispatcher("formsMantenerTipoProducto.jsp");
               rd.forward(request, response);
            }else{
               request.setAttribute("error", true);
               RequestDispatcher rd = request.getRequestDispatcher("formsMantenerTipoProducto.jsp");
               rd.forward(request, response);
            }
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
        
        //int idpersona=Integer.parseInt(request.getParameter("idpersona"));
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

