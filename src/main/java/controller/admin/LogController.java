package controller.admin;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import model.Log;
import org.json.JSONArray;
import org.json.JSONObject;
import service.ILogService;
import service.impl.LogServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/admin/log")
public class LogController extends HttpServlet {
    private ILogService logService = new LogServiceImpl();

    private Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        List<Log> logs = logService.findAll();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("data", logs);
        resp.getWriter().print(jsonObject);
    }
}
