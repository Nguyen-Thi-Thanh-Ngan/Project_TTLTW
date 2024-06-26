package controller;

import dao.impl.ProducerDAO;
import dao.impl.ProductDAO;
import dao.impl.ProductTypeDAO;
import model.Producer;
import model.Product;
import model.ProductType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddProductController", value = "/add")
public class AddProductController extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();
    private final ProductTypeDAO productTypeDAO = new ProductTypeDAO();
    private final ProducerDAO producerDAO = new ProducerDAO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String productTypeId = request.getParameter("productType");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String productCategoryId = request.getParameter("productCategory");
            String img = request.getParameter("img");

            ProductType productType = productTypeDAO.getById(productTypeId);
            Producer producer = producerDAO.getById(productCategoryId);

            if(productType != null || producer != null){
                Product product = new Product(id, name, price, productType, quantity, producer, img);
                productDAO.insert(product);
                request.getSession().setAttribute("addProductSuccess", true);
                response.sendRedirect("quanlysanpham.jsp");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
