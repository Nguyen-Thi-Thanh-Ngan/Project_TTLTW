package controller;

import dao.impl.ProductDAO;
import model.Product;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

@WebServlet(name = "Type", value = "/type")
public class TypeController extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productTypeId = request.getParameter("id");
        List<Product> listProducts = productDAO.selectByIdProductType(productTypeId);
        request.setAttribute("listProducts", listProducts);
        request.getRequestDispatcher("danhmuctheoloaisanpham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
