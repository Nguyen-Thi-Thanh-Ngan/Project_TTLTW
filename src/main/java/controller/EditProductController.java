package controller;

import dao.ProducerDAO;
import dao.ProductDAO;
import dao.ProductTypeDAO;
import model.Producer;
import model.Product;
import model.ProductType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditProductController", value = "/edit")
public class EditProductController extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();
    private ProductTypeDAO productTypeDAO = new ProductTypeDAO();
    private ProducerDAO producerDAO = new ProducerDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String priceFormat = request.getParameter("price").substring(0, request.getParameter("price").length() - 4);
            String result = "";
            for(int i = 0; i  < priceFormat.length(); i++){
                result += priceFormat.charAt(i) == '.' ? "" : priceFormat.charAt(i);
            }
            double price = Double.parseDouble(result);
            String productTypeId = request.getParameter("productType");
            int quantity = Integer.parseInt(request.getParameter("quantity").trim());
            String productCategoryId = request.getParameter("productCategory");
            String img = request.getParameter("img");

            ProductType productType = productTypeDAO.getById(productTypeId);
            Producer producer = producerDAO.getById(productCategoryId);

            Product product = new Product(id, name, price, productType, quantity, producer, img);
            productDAO.update(product);
            request.getSession().setAttribute("editProductSuccess", true);
            response.sendRedirect("quanlysanpham.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}