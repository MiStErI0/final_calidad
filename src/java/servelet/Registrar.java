
package servelet;

import Controlador.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Registrar extends HttpServlet {

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
        HttpSession session = request.getSession();
        request.setAttribute("usuario", session.getAttribute("usuario"));
        String p = request.getParameter("rgusuario");
        if(p.equals("registrarUsuario")){
            String usuario = request.getParameter("user");
            String psw = request.getParameter("psw"); 
            String nombre = request.getParameter("nomUser");
            String apepat = request.getParameter("apePatUser");
            String apemat = request.getParameter("apeMatUser"); 
            String email = request.getParameter("correoElectro");
            String tipoper = request.getParameter("tipper");
            String tipodoc = request.getParameter("tipdoc");
            String numident = request.getParameter("numident");
            String cargousu = request.getParameter("cargusu");
            String tiptel = request.getParameter("tiptel");
            String operadortel = request.getParameter("operadortel");
            String numtel = request.getParameter("numtel");
            String departamento = request.getParameter("seldepartamentos");
            String provincia = request.getParameter("selprovincias");
            String distrito = request.getParameter("seldistritos");
                        
            if((usuario != null && !usuario.isEmpty()) 
                   && (psw != null && !psw.isEmpty()) 
                   && (nombre != null && !nombre.isEmpty()) 
                   && (apepat != null && !apepat.isEmpty()) 
                   && (apemat != null && !apemat.isEmpty())
                   && (email != null && !email.isEmpty())
                   && (tipoper != null && !tipoper.isEmpty())
                   && (tipodoc != null && !tipodoc.isEmpty())
                   && (numident != null && !numident.isEmpty())
                   && (cargousu != null && !cargousu.isEmpty())
                   && (tiptel != null && !tiptel.isEmpty())
                   && (operadortel != null && !operadortel.isEmpty())
                   && (numtel != null && !numtel.isEmpty())
                   && (departamento != null && !departamento.isEmpty())
                   && (provincia != null && !provincia.isEmpty()) 
                   && (distrito != null && !distrito.isEmpty()) ){
            
                int idtipoper = Integer.parseInt(tipoper);   
                int idtipodoc = Integer.parseInt(tipodoc);
                int idtiptel = Integer.parseInt(tiptel);
                int idcargousu = Integer.parseInt(cargousu);
                int idoperadortel = Integer.parseInt(operadortel);
                int idnumtel = Integer.parseInt(numtel);
                int iddepartamento = Integer.parseInt(departamento);
                int idprovincia = Integer.parseInt(provincia);
                int iddistrito = Integer.parseInt(distrito);
                
                request.setAttribute("usuario", session.getAttribute("usuario"));
                Consultas co=new Consultas();
                boolean qr = co.registrar(nombre,apepat,apemat,usuario,psw,email,idtiptel,idoperadortel,
                     iddepartamento, idprovincia, iddistrito, numident, idcargousu, idnumtel, idtipoper, idtipodoc);
                if(qr){
                   request.setAttribute("error", false);
                   RequestDispatcher rd = request.getRequestDispatcher("formsRegistrarUsuario.jsp");
                   rd.forward(request, response);
                }else{
                   request.setAttribute("error", true);
                   request.setAttribute("msg", "No se pudo registrar los datos");
                   RequestDispatcher rd = request.getRequestDispatcher("formsRegistrarUsuario.jsp");
                   rd.forward(request, response);
                }
            }else{
                request.setAttribute("error", true);
                request.setAttribute("msg", "Ingresa todos los campos");
                RequestDispatcher rd = request.getRequestDispatcher("formsRegistrarUsuario.jsp");
                rd.forward(request, response);  
            }
        }else if(p.equals("registrarCliente")){
            String nombre = request.getParameter("nomUser");
            String apepat = request.getParameter("apePatUser");
            String apemat = request.getParameter("apeMatUser"); 
            String email = request.getParameter("correoElectro");
            String tipocli = request.getParameter("tipcli");
            String tipoper = request.getParameter("tipper");
            String tipodoc = request.getParameter("tipdoc");
            String numident = request.getParameter("numident");
            String tiptel = request.getParameter("tiptel");
            String operadortel = request.getParameter("operadortel");
            String numtel = request.getParameter("numtel");
            String departamento = request.getParameter("seldepartamentos");
            String provincia = request.getParameter("selprovincias");
            String distrito = request.getParameter("seldistritos");
            
            if((nombre != null && !nombre.isEmpty()) 
                   && (apepat != null && !apepat.isEmpty()) 
                   && (apemat != null && !apemat.isEmpty())
                   && (email != null && !email.isEmpty())
                   && (tipocli != null && !tipocli.isEmpty())
                   && (tipoper != null && !tipoper.isEmpty())
                   && (tipodoc != null && !tipodoc.isEmpty())
                   && (numident != null && !numident.isEmpty())
                   && (tiptel != null && !tiptel.isEmpty())
                   && (operadortel != null && !operadortel.isEmpty())
                   && (numtel != null && !numtel.isEmpty())
                   && (departamento != null && !departamento.isEmpty())
                   && (provincia != null && !provincia.isEmpty()) 
                   && (distrito != null && !distrito.isEmpty()) ){
            
                int tipcliente = Integer.parseInt(tipocli);
                int idtipoper = Integer.parseInt(tipoper);   
                int idtipodoc = Integer.parseInt(tipodoc);
                int idtiptel = Integer.parseInt(tiptel);
                int idoperadortel = Integer.parseInt(operadortel);
                int idnumtel = Integer.parseInt(numtel);
                int iddepartamento = Integer.parseInt(departamento);
                int idprovincia = Integer.parseInt(provincia);
                int iddistrito = Integer.parseInt(distrito);
         
                request.setAttribute("usuario", session.getAttribute("usuario"));
                Consultas co=new Consultas();
                boolean cr = co.registrar_cliente(nombre,apepat,apemat,email,tipcliente,idtiptel,idoperadortel,
                        iddepartamento, idprovincia, iddistrito, numident, idnumtel, idtipoper, idtipodoc);
                if(cr){
                   request.setAttribute("error", false);
                   RequestDispatcher rd = request.getRequestDispatcher("formsRegistrarCliente.jsp");
                   rd.forward(request, response);
                }else{
                   request.setAttribute("error", true);
                   request.setAttribute("msg", "No se pudo registrar los datos");
                   RequestDispatcher rd = request.getRequestDispatcher("formsRegistrarCliente.jsp");
                   rd.forward(request, response);
                }

            }else{
                request.setAttribute("error", true);
                request.setAttribute("msg", "Ingresa todos los campos");
                RequestDispatcher rd = request.getRequestDispatcher("formsRegistrarCliente.jsp");
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
