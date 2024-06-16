package service.impl;

import dao.impl.RoleDAO;
import dao.impl.UserDAO;
import model.Role;
import model.User;
import db.JDBIConnector;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

public class UserService {
    private static UserService instance;

    public static UserService getInstance(){
        if(instance == null)
            instance = new UserService();
        return instance;
    }

    public User checkLogin(String email, String pass) throws SQLException {
        UserDAO userDAO = new UserDAO();
        User userByEmail = userDAO.getUserByEmail(email);
        if(userByEmail == null) return null;
        if(!userByEmail.getEmail().equals(email) || !userByEmail.getPassword().equals(pass)) return null;
        return userByEmail;
    }

    public static void main(String[] args) throws SQLException {
        List<User> users = JDBIConnector.getConnect().withHandle((handle -> {
            return handle.createQuery("SELECT id, name, sex, address, birth_day, phone_number, " +
                            "email, user_name, password, role_id FROM users")
                    .map((rs, ctx) -> {
                        int id = rs.getInt("id");
                        String username = rs.getString("username");
                        String password = rs.getString("password");
                        String oauth_provider = rs.getString("oauthProvider");
                        String oauth_uid = rs.getString("oauthUid");
                        String oauth_token = rs.getString("oauthToken");
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        int role_id = rs.getInt("role_id");
                        Date created_at = rs.getDate("created_at");
                        Date updated_at = rs.getDate("updated_at");

                        Role role = new RoleDAO().selectById(new Role(role_id, null));
                        return new User(id, username, password, oauth_provider, oauth_uid, oauth_token, name, email, role, created_at, updated_at);
                    }).stream().collect(Collectors.toList());
        }));
        System.out.println(users);
    }
}
