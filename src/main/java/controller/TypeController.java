package controller;

import dao.IProducerDAO;
import dao.IProductDAO;
import dao.IProductTypeDAO;
import dao.impl.ProductDAOImpl;
import dao.impl.ProductTypeDAOImpl;
import model.Log;
import model.Product;
import model.ProductType;
import model.User;
import service.ILogService;
import service.IProductService;
import service.impl.LogServiceImpl;
import service.impl.ProductServiceImpl;
import utils.LevelLog;
import utils.SessionUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Type", value = "/type")
public class TypeController extends HttpServlet {
    private IProductService productService = new ProductServiceImpl();
    private IProductTypeDAO productTypeDAO = new ProductTypeDAOImpl();
    private ILogService logService = new LogServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer productTypeId = Integer.parseInt(request.getParameter("id"));
        ProductType productType = productTypeDAO.findById(productTypeId);
        List<Product> listProducts = productService.findByCategory(productTypeId);
        User user = (User) SessionUtil.getInstance().getKey(request, "user");
        Log log = new Log();
        log.setUserId(user.getId());
        log.setAction("Tìm kiếm loại sản phẩm: " + productType.getName());
        log.setAddressIP(request.getRemoteAddr());
        log.setLevel(LevelLog.INFO);
        logService.save(log);
        request.setAttribute("listProducts", listProducts);
        request.getRequestDispatcher("danhmuctheoloaisanpham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
