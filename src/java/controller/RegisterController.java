/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Admin
 */
public class RegisterController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
              request.getRequestDispatcher("Register.jsp").forward(request, response);

    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html");
        String name = request.getParameter("fullname");
        String email = request.getParameter("email");
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String cf_pass = request.getParameter("confirm-password");
        PrintWriter out = response.getWriter();
        UserDao ud = new UserDao();
        if(pass.equals(cf_pass)) {
            if (ud.checkRegister(name, email, user)) {
                
    //            out.print(user + pass);
                ud.insert(name, email, user, pass);
                HttpSession session = request.getSession();
                User l = ud.getUser(user);
                session.setAttribute("account", l);
                request.getRequestDispatcher("home").forward(request, response);

            } else {
                request.setAttribute("mess1", "Đăng ký không thành công");
                request.getRequestDispatcher("Register.jsp").include(request, response);
            }
        } else {
            request.setAttribute("mess2", "Mật khẩu nhập lại không khớp vs mật khẩu");
            request.getRequestDispatcher("Register.jsp").include(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
