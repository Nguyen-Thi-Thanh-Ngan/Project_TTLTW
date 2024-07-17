package service;

import model.User;

import java.util.List;

public interface IUserService {
    boolean login(String username, String password);
    boolean register(User user);
    boolean isUserNameExists(String username);
    Integer getIdByUserName(String username);
    Integer getRoleIdByUsername(String username);
    User getUserByUsername(String username);
    boolean isEmailExists(String email);
    void resetPass(String email, String password);
    List<User> findAll();
    void deleteById(Integer  id);
    void update(User user);
    void add(User user, String role);
    User isUserExists(String oauthProvider, String oauthUid);

    List<User> findAllUser();
}
