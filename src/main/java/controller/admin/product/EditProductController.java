package controller.admin.product;

import com.google.gson.Gson;
import controller.HomeController;
import model.Product;
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
}
