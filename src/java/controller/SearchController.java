/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDao;
import dal.ProductDao;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class SearchController extends HttpServlet {

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
//               try {
//            String search = request.getParameter("search");
//            UserDao ud = new UserDao();
//            int count = ud.count(search);
//            int size = 8;
//            int endPage = count / size;
//            if(count / size != 0)
//            {
//                endPage++;
//            }
//            request.setAttribute("endPage", endPage);
//            request.getRequestDispatcher("home.jsp").forward(request, response);
//        } catch (Exception e) {
//        }
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
        response.setContentType("text/html;charset=UTF-8");
            String txtsearch = request.getParameter("txt");
        String index = request.getParameter("index");
         ProductDao pd = new ProductDao();
        CategoryDao cd = new CategoryDao();
        List<Category> listC = cd.getAllCategory();
        if (index == null || index == "0") //trang dau
        {
            index = "1";
        }

        int indexNumber = Integer.parseInt(index);

       


        int numPage = pd.countPageBySearch(9, txtsearch); // Tổng số trang
        List<Product> listbyname = pd.searchByNamePagination(indexNumber, 9, txtsearch);

        request.setAttribute("index", indexNumber);
        request.setAttribute("numpage", numPage);
        request.setAttribute("listp", listbyname);
        request.setAttribute("txtS", txtsearch);
        request.setAttribute("listcc", listC);
        request.getRequestDispatcher("search.jsp").forward(request, response);

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
