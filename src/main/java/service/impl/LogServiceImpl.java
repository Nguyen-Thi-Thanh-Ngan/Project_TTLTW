package service.impl;

import dao.ILogDAO;
import dao.impl.LogDAOImpl;
import model.Log;
import service.ILogService;

import java.util.List;

public class LogServiceImpl implements ILogService {
    private ILogDAO logDAO = new LogDAOImpl();
    @Override
    public Log save(Log log) {
        return logDAO.save(log);
    }

    @Override
    public List<Log> findAll() {
        return logDAO.findAll();
    }

    @Override
    public List<Log> findByUserId(int userId) {
        return logDAO.findByUserId(userId);
    }
}
