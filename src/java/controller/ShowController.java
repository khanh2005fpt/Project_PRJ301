/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Product;

/**
 *
 * @author Admin
 */
public class ShowController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShowController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
       
        String idRaw = request.getParameter("id"); // id của sản phẩm được thêm vào giỏ
        Cookie[] cookies = request.getCookies();
        String txt = ""; // dữ liệu từ cookie
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("cart")) {
                    txt += c.getValue();
                }
            }
        }

        if (idRaw != null) {
            // Nếu sản phẩm đã có trong giỏ, tăng số lượng
            if (txt.isEmpty()) {
                txt = idRaw + ":1"; //cong vao cookie
            } else {
                // kiểm tra id đã có chưa
                String[] items = txt.split("|");
                boolean found = false;
                for (int i = 0; i < items.length; i++) {
                    String[] pair = items[i].split(":");
                    if (pair.length == 2 && pair[0].equals(idRaw)) { //check xem co dung 2 ky tu khong vi du 2:3, 3:1
                        int quantity = Integer.parseInt(pair[1]) + 1;
                        items[i] = idRaw + ":" + quantity;
                        found = true;
                    }
                }
                if (!found) {
                    txt += "|" + idRaw + ":1";
                } else {
                    txt = String.join("|", items); //noi lai cac items voi nhau
                }
            }
        }

        // Ghi lại vào cookie
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(24 * 60 * 60); // 1 ngày
        response.addCookie(c);

        // Dùng DAO để tạo Cart từ chuỗi txt
        ProductDao dao = new ProductDao();
        List<Product> list = dao.getAllProduct();
        Cart cart = new Cart(txt, list);

        request.setAttribute("cart", cart);
        request.getRequestDispatcher("mycart.jsp").forward(request, response);
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
