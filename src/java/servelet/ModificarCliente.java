
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

public class ModificarCliente extends HttpServlet {

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
        String p = request.getParameter("fncliente");
        if(p.equals("modificarCliente")){
            int idcliente = Integer.parseInt(request.getParameter("idcliente"));
            int idpersona = Integer.parseInt(request.getParameter("idpersona"));
            String nombre = request.getParameter("nomUser");
            String apepat = request.getParameter("apePatUser");
            String apemat = request.getParameter("apeMatUser"); 
            String email = request.getParameter("correoElectro");
            int idtipoper = Integer.parseInt(request.getParameter("tipper"));   
            int idtipodoc = Integer.parseInt(request.getParameter("tipdoc"));
            String numident = request.getParameter("numident");
            int tipcli = Integer.parseInt(request.getParameter("tipcli"));
            int tiptel = Integer.parseInt(request.getParameter("tiptel"));
            int operadortel = Integer.parseInt(request.getParameter("operadortel"));
            int numtel = Integer.parseInt(request.getParameter("numtel"));
            int departamento = Integer.parseInt(request.getParameter("seldepartamentos"));
            int provincia = Integer.parseInt(request.getParameter("selprovincias"));
            int distrito = Integer.parseInt(request.getParameter("seldistritos"));

            ConsultasModificar co = new ConsultasModificar();
            boolean mu = co.modificarCliente(idpersona, nombre, apepat, apemat, tipcli, email, tiptel, 
                    operadortel, departamento, provincia, distrito, numident, numtel, idtipoper, idtipodoc);
            if(mu){
               request.setAttribute("error", false);
               //request.setAttribute("idpersona", idpersona);
               RequestDispatcher rd = request.getRequestDispatcher("formsModificarCliente.jsp");
               rd.forward(request, response);
            }else{
               request.setAttribute("error", true);
               //request.setAttribute("idpersona", idpersona);
               RequestDispatcher rd = request.getRequestDispatcher("formsModificarCliente.jsp");
               rd.forward(request, response);
            }  
        }else if(p.equals("camposModificar")){
            int idcliente = Integer.parseInt(request.getParameter("idcliente"));
            int idpersona = Integer.parseInt(request.getParameter("idpersona"));
            String nombre = request.getParameter("nomUser");
            String apepat = request.getParameter("apePatUser");
            String apemat = request.getParameter("apeMatUser"); 
            String email = request.getParameter("correoElectro");
            int idtipoper = Integer.parseInt(request.getParameter("tipper"));   
            int idtipodoc = Integer.parseInt(request.getParameter("tipdoc"));
            String numident = request.getParameter("numident");
            int tipcli = Integer.parseInt(request.getParameter("tipcli"));
            int tiptel = Integer.parseInt(request.getParameter("tiptel"));
            int operadortel = Integer.parseInt(request.getParameter("operadortel"));
            int numtel = Integer.parseInt(request.getParameter("numtel"));
            int departamento = Integer.parseInt(request.getParameter("seldepartamentos"));
            int provincia = Integer.parseInt(request.getParameter("selprovincias"));
            int distrito = Integer.parseInt(request.getParameter("seldistritos"));
            request.setAttribute("idcliente", idcliente);
            request.setAttribute("idtipocli", tipcli);
            request.setAttribute("idpersona", idpersona);
            request.setAttribute("nombre", nombre);
            request.setAttribute("apepat", apepat);
            request.setAttribute("apemat", apemat);
            request.setAttribute("email", email);
            request.setAttribute("idtipoper", idtipoper);
            request.setAttribute("idtipodoc", idtipodoc);
            request.setAttribute("numident", numident);
            request.setAttribute("tiptel", tiptel);
            request.setAttribute("operadortel", operadortel);
            request.setAttribute("numtel", numtel);
            request.setAttribute("departamento", departamento);
            request.setAttribute("provincia", provincia);
            request.setAttribute("distrito", distrito);
            
            RequestDispatcher rd = request.getRequestDispatcher("formsModificarCliente.jsp");
            rd.forward(request, response);
        }else if( p.equals("eliminarCliente")){
            int idpersona = Integer.parseInt(request.getParameter("idpersona"));
            ConsultasEliminar co = new ConsultasEliminar();
            boolean eu = co.eliminarCliente(idpersona);
            if(eu){
               request.setAttribute("error", false);
               //request.setAttribute("idpersona", idpersona);
               RequestDispatcher rd = request.getRequestDispatcher("formsMantenerCliente.jsp");
               rd.forward(request, response);
            }else{
               request.setAttribute("error", true);
               //request.setAttribute("idpersona", idpersona);
               RequestDispatcher rd = request.getRequestDispatcher("formsMantenerCliente.jsp");
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
