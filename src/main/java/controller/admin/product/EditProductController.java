package controller.admin.product;

import com.google.gson.Gson;
import dao.IProducerDAO;
import dao.IProductTypeDAO;
import dao.impl.ProducerDAOImpl;
import dao.impl.ProductTypeDAOImpl;
import model.Producer;
import model.Product;
import model.ProductType;
import service.IProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/edit-product")
public class EditProductController extends HttpServlet {
    private IProductService productService = new ProductServiceImpl();
    private IProductTypeDAO productTypeDAO = new ProductTypeDAOImpl();
    private IProducerDAO producerDAO = new ProducerDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        Integer productId = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findProductById(productId);
        Gson gson = new Gson();
        String json = gson.toJson(product);
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        Integer productId = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        Double price = Double.parseDouble(req.getParameter("price"));
        String detail = req.getParameter("description");
        Integer productTypeId = Integer.parseInt(req.getParameter("productTypeId"));
        Integer producerId = Integer.parseInt(req.getParameter("producerId"));

        ProductType productType = productTypeDAO.findById(productTypeId);
        Producer producer = producerDAO.findById(producerId);

        Product product = new Product();
        product.setId(productId);
        product.setName(name);
        product.setPrice(price);
        product.setDetail(detail);
        product.setProductType(productType);
        product.setProducer(producer);

        boolean isUpdate = productService.updateProduct(product);

        if (isUpdate) {
            resp.setStatus(HttpServletResponse.SC_OK);
            resp.getWriter().write("{\"message\": \"Cập nhật thành công\"}");
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"message\": \"Cập nhật thất bại\"}");
        }
    }
}
