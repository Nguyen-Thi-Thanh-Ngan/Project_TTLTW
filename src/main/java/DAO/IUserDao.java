package DAO;

import Model.User;

import java.util.List;

public interface IUserDao {
    boolean login(User item);
    User register(User item);
    String getIdTop1();
    boolean isUserNameExists(String username);
    String getIdByUserName(String username);
    User getByUserName(String username);
    User getById(String username);
    boolean isEmailExists(String email);
    void resetPass(String email, String password);
    List<User> findAll();
    void deleteById(String id);
    void update(User user);
    void add(User user);
}
