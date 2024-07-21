package controller;

import dao.IProductDAO;
import dao.impl.ProductDAOImpl;
import model.Log;
import model.Product;
import model.User;
import service.ILogService;
import service.IProductService;
import service.impl.LogServiceImpl;
import service.impl.ProductServiceImpl;
import utils.LevelLog;
import utils.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {
    private IProductService productService = new ProductServiceImpl();
    private ILogService logService = new LogServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("name");
        User user = (User) SessionUtil.getInstance().getKey(request, "user");
        Log log = new Log();
        log.setUserId(user.getId());
        log.setAction("Tìm kiếm sản phẩm: " + search);
        log.setAddressIP(request.getRemoteAddr());
        log.setLevel(LevelLog.INFO);
        logService.save(log);
        List<Product> listProduct = productService.findByName(search);
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("searchproduct.jsp").forward(request, response);
    }
}

