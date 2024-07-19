package controller.admin;

import com.google.gson.Gson;
import model.Log;
import service.ILogService;
import service.IProductService;
import service.impl.LogServiceImpl;
import service.impl.ProductServiceImpl;
import utils.LevelLog;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "DeleteProductController", value = "/delete-product")
public class DeleteProductController extends HttpServlet {
    private IProductService productService = new ProductServiceImpl();
    private ILogService logService = new LogServiceImpl();
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        Integer productId = Integer.parseInt(req.getParameter("id"));
        boolean success = productService.deleteById(productId);

        Map<String, Object> response = new HashMap<>();
        if (success) {
            Log log = new Log();
            log.setUserId(1);
            log.setAction("Xóa sản phẩm có id: " + productId);
            log.setAddressIP(req.getRemoteAddr());
            log.setLevel(LevelLog.WARN);
            logService.save(log);
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
