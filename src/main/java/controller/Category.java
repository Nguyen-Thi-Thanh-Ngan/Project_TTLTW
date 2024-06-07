package controller;

import dao.impl.ProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Category", value = "/category")
public class Category extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String producerId = request.getParameter("idProducer");
        ProductDAO productDAO = new ProductDAO();
        List<Product> listProduct = productDAO.selectByIdProducer(producerId);


        request.setAttribute("listC", listProduct);
        request.getRequestDispatcher("danhmuctheoNSX.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
