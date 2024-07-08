package controller;

import dao.IProducerDAO;
import dao.IProductDAO;
import dao.IProductTypeDAO;
import dao.impl.ProductDAOImpl;
import dao.impl.ProductTypeDAOImpl;
import model.Product;
import service.IProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Type", value = "/type")
public class TypeController extends HttpServlet {
private IProductService productService = new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer productTypeId = Integer.parseInt(request.getParameter("id"));
        List<Product> listProducts = productService.findByCategory(productTypeId);
        request.setAttribute("listProducts", listProducts);
        request.getRequestDispatcher("danhmuctheoloaisanpham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
