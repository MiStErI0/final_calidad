
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

public class ModificarProducto extends HttpServlet {

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
        String p = request.getParameter("fnproducto");
        if(p.equals("modificarProducto")){
            int idproducto = Integer.parseInt(request.getParameter("idproducto"));
            int idmarca = Integer.parseInt(request.getParameter("idmarca"));
            float costopro = Float.parseFloat(request.getParameter("costopro"));
            float preciopro = Float.parseFloat(request.getParameter("preciopro"));
            int cantidadpro = Integer.parseInt(request.getParameter("cantidadpro")); 
            String fechaven = request.getParameter("fechaven");
            String fechareg = request.getParameter("fechareg");
            int idtipocat = Integer.parseInt(request.getParameter("idtipocat"));   

            ConsultasModificar co = new ConsultasModificar();
            boolean mu = co.modificarProducto(idproducto, idmarca, costopro, preciopro, cantidadpro, fechaven, fechareg, 
                    idtipocat);
            if(mu){
               request.setAttribute("error", false);
               //request.setAttribute("idpersona", idpersona);
               RequestDispatcher rd = request.getRequestDispatcher("formsModificarProducto.jsp");
               rd.forward(request, response);
            }else{
               request.setAttribute("error", true);
               //request.setAttribute("idpersona", idpersona);
               RequestDispatcher rd = request.getRequestDispatcher("formsModificarProducto.jsp");
               rd.forward(request, response);
            }  
        }else if(p.equals("camposModificar")){
            int idproducto = Integer.parseInt(request.getParameter("idproducto"));
            int idmarca = Integer.parseInt(request.getParameter("idmarca"));
            float costopro = Float.parseFloat(request.getParameter("costopro"));
            float preciopro = Float.parseFloat(request.getParameter("preciopro"));
            int cantidadpro = Integer.parseInt(request.getParameter("cantidadpro")); 
            String fechaven = request.getParameter("fechaven");
            String fechareg = request.getParameter("fechareg");
            int idtipocat = Integer.parseInt(request.getParameter("idtipocat"));   

            request.setAttribute("idproducto", idproducto);
            request.setAttribute("idmarca", idmarca);
            request.setAttribute("costopro", costopro);
            request.setAttribute("preciopro", preciopro);
            request.setAttribute("cantidadpro", cantidadpro);
            request.setAttribute("fechaven", fechaven);
            request.setAttribute("fecharef", fechareg);
            request.setAttribute("idtipocat", idtipocat);
            
            RequestDispatcher rd = request.getRequestDispatcher("formsModificarProducto.jsp");
            rd.forward(request, response);
        }else if( p.equals("eliminarProducto")){
            int idproducto = Integer.parseInt(request.getParameter("idproducto"));
            ConsultasEliminar co = new ConsultasEliminar();
            boolean eu = co.eliminarProducto(idproducto);
            if(eu){
               request.setAttribute("error", false);
               //request.setAttribute("idpersona", idpersona);
               RequestDispatcher rd = request.getRequestDispatcher("formsMantenerProducto.jsp");
               rd.forward(request, response);
            }else{
               request.setAttribute("error", true);
               //request.setAttribute("idpersona", idpersona);
               RequestDispatcher rd = request.getRequestDispatcher("formsMantenerProducto.jsp");
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
