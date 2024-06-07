package controller;

import dao.impl.ProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "adminSearch", value = "/admin-search")
public class AdminSearch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String textSearch = request.getParameter("name");
        List<Product> itemProduct = ProductDAO.searchByName(textSearch);
        request.setAttribute("item", itemProduct);
        request.getRequestDispatcher("quanlysanpham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}