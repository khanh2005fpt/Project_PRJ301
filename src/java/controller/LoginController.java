/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.User;

/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {

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
        Cookie arr[] = request.getCookies();
        if(arr != null) //khi doi sang trinh duyet khac se bao loi
        {
            for (Cookie cookie : arr) {
            if (cookie.getName().equals("userC")) {
                request.setAttribute("username", cookie.getValue());
            }

            if (cookie.getName().equals("passC")) {
                request.setAttribute("password", cookie.getValue());
            }
        }
        }
        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        response.setContentType("text/html");
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String remember = request.getParameter("remember-me");
//        PrintWriter out = response.getWriter();
        UserDao ud = new UserDao();
        User l = ud.getUser(user);
        if (ud.checkLogin(user, pass)) {
            HttpSession session = request.getSession();
            session.setAttribute("account", l);
//            out.print(user + pass);
            Cookie u = new Cookie("userC", user);
            Cookie p = new Cookie("passC", pass);

            if (remember != null) {
                u.setMaxAge(60);
                p.setMaxAge(60);
            } else {
                u.setMaxAge(0);
                p.setMaxAge(0);
            }

            response.addCookie(u);
            response.addCookie(p);

            request.getRequestDispatcher("home").forward(request, response);

        } else {
            request.setAttribute("mess", "Đăng nhập không thành công");
        }
        request.getRequestDispatcher("Login.jsp").include(request, response);
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
