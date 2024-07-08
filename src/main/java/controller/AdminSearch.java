package controller;

import dao.impl.ProductDAOImpl;
import model.Product;
import service.IProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "adminSearch", value = "/admin-search")
public class AdminSearch extends HttpServlet{
    private IProductService productService = new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("name");
        List<Product> itemProduct = productService.findByName(search);
        request.setAttribute("item", itemProduct);
        request.getRequestDispatcher("management-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}