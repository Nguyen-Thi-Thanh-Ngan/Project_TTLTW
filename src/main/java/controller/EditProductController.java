package controller;

import javax.servlet.annotation.WebServlet;

@WebServlet(name = "EditProductController", value = "/edit")
public class EditProductController{
//    private ProductDAOImpl productDAO = new ProductDAOImpl();
//    private ProductTypeDAO productTypeDAO = new ProductTypeDAO();
//    private ProducerDAO producerDAO = new ProducerDAO();
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request, response);
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("utf-8");
//        try {
//            String id = request.getParameter("id");
//            String name = request.getParameter("name");
//            double price = Double.parseDouble(request.getParameter("price"));
//            String productTypeId = request.getParameter("productType");
//            int quantity = Integer.parseInt(request.getParameter("quantity"));
//            String productCategoryId = request.getParameter("productCategory");
//            String img = request.getParameter("img");
//
//            ProductType productType = productTypeDAO.getById(productTypeId);
//            Producer producer = producerDAO.getById(productCategoryId);
//
//            Product product = new Product(id, name, price, productType, quantity, producer, img);
//            productDAO.update(product);
//            request.getSession().setAttribute("editProductSuccess", true);
//            response.sendRedirect("management-product.jsp");
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//    }

}
