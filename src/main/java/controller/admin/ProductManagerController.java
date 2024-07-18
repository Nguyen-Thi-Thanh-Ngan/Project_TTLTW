package controller.admin;

import com.google.gson.Gson;
import model.Product;
import service.IProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(value = "/product-manager")
public class ProductManagerController extends HttpServlet {
    private IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        List<Product> products = productService.findAll();
        resp.getWriter().print(new Gson().toJson(products));
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        Integer productId = Integer.parseInt(req.getParameter("id"));
        boolean success = productService.deleteById(productId);

        Map<String, Object> response = new HashMap<>();
        if (success) {
            response.put("message", "Product deleted successfully.");
            response.put("success", true);
        } else {
            response.put("message", "Failed to delete product.");
            response.put("success", false);
        }

        String json = new Gson().toJson(response);
        resp.getWriter().write(json);
    }
}
