package service;

import model.User;

import java.util.List;

public interface IUserService {
    boolean login(String username, String password);
    Integer register(User user);
    boolean isUserNameExists(String username);
    Integer getIdByUserName(String username);
    User getByUserName(String username);
    User getById(String id);
    boolean isEmailExists(String email);
    void resetPass(String email, String password);
    List<User> findAll();
    void deleteById(String id);
    void update(User user);
    void add(User user, String role);
}
