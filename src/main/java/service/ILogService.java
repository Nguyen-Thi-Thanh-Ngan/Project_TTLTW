package service;

import model.Log;

import java.util.List;

public interface ILogService {
    Log save(Log log);
    List<Log> findAll();
    List<Log> findByUserId(int userId);
}
