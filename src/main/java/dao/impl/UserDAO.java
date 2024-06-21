package dao.impl;

import dao.DAOInterface;
import model.*;
import db.JDBIConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserDAO implements DAOInterface<User> {
    @Override
    public List<User> selectAll() {
        List<User> ketQua = JDBIConnector.getConnect().withHandle((handle ->
        {
            List<User> users = new ArrayList<>();
            handle.createQuery("SELECT id, username, password, oauth_provider, oauth_uid, oauth_token, name, email, role_id, created_at, updated_at FROM users")
                    .map((rs, ctx) -> {
                        int id = rs.getInt("id");
                        String username = rs.getString("username");
                        String password = rs.getString("password");
                        String oauthProvider = rs.getString("oauth_provider");
                        String oauthUid = rs.getString("oauth_uid");
                        String oauthToken = rs.getString("oauth_token");
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        int roleId = rs.getInt("role_id");
                        Date created_at = rs.getDate("created_at");
                        Date updated_at = rs.getDate("updated_at");

                        Role role = new RoleDAO().selectById(new Role(roleId, null));

                        User user = new User(id, username, password, oauthProvider, oauthUid, oauthToken, name, email, role, created_at, updated_at);
                        users.add(user);

                        return null;
                    }).list();
            return users;
        }));
        return ketQua;
    }

    public User getUserByEmail(String email) {
        Optional<User> user = JDBIConnector.getConnect().withHandle(handle ->
                handle.createQuery("SELECT id, username, password, oauth_provider, oauth_uid, oauth_token, name, " +
                                "email, role_id, created_at, updated_at FROM users WHERE email = ?")
                        .bind(0, email)
                        .map((rs, ctx) -> {
                            int id = rs.getInt("id");
                            String username = rs.getString("username");
                            String password = rs.getString("password");
                            String oauthProvider = rs.getString("oauth_provider");
                            String oauthUid = rs.getString("oauth_uid");
                            String oauthToken = rs.getString("oauth_token");
                            String name = rs.getString("name");
                            int roleId = rs.getInt("role_id");
                            Date created_at = rs.getDate("created_at");
                            Date updated_at = rs.getDate("updated_at");

                            Role role = new RoleDAO().selectById(new Role(roleId, null));
                            return new User(id, username, password, oauthProvider, oauthUid, oauthToken, name, email, role, created_at, updated_at);
                        })
                        .findFirst()
        );

        return user.orElse(null);
    }


    @Override
    public User selectById(User userP) {
        Optional<User> user = JDBIConnector.getConnect().withHandle((handle ->
                handle.createQuery("SELECT id, username, password, oauth_provider, oauth_uid, oauth_token, name, " +
                                "email, role_id, created_at, updated_at FROM users WHERE id = ?")
                        .bind(0, userP.getId())
                        .map((rs, ctx) -> {
                            int id = rs.getInt("id");
                            String username = rs.getString("username");
                            String password = rs.getString("password");
                            String oauth_provider = rs.getString("oauth_provider");
                            String oauth_uid = rs.getString("oauth_uid");
                            String oauth_token = rs.getString("oauth_token");
                            String name = rs.getString("name");
                            String email = rs.getString("email");
                            int role_id = rs.getInt("role_id");
                            Date created_at = rs.getDate("created_at");
                            Date updated_at = rs.getDate("updated_at");

                            Role role = new RoleDAO().selectById(new Role(role_id, null));
                            return new User(id, username, password, oauth_provider, oauth_uid, oauth_token, name, email, role, created_at, updated_at);
                        })
                        .findFirst()
        ));
        return user.isEmpty() ? null : user.get();
    }

        public static User getById(int userP) {
            Optional<User> user = JDBIConnector.getConnect().withHandle((handle ->
            handle.createQuery("SELECT id, username, password, oauth_provider, oauth_uid, oauth_token, name, " +
                            "email, role_id, created_at, updated_at FROM users WHERE id = ?")
                    .bind(0, userP)
                    .map((rs, ctx) -> {
                        int id = rs.getInt("id");
                        String username = rs.getString("username");
                        String password = rs.getString("password");
                        String oauth_provider = rs.getString("oauth_provider");
                        String oauth_uid = rs.getString("oauth_uid");
                        String oauth_token = rs.getString("oauth_token");
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        int role_id = rs.getInt("role_id");
                        Date created_at = rs.getDate("created_at");
                        Date updated_at = rs.getDate("updated_at");

                        Role role = new RoleDAO().selectById(new Role(role_id, null));
                        return new User(id, username, password, oauth_provider, oauth_uid, oauth_token, name, email, role, created_at, updated_at);
                    })
                    .findFirst()
        ));
            return user.isEmpty() ? null : user.get();
        }

        @Override
        public int insert(User user) {
            int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                    handle.createUpdate("INSERT INTO users (id, username, password, oauth_provider, oauth_uid, oauth_token, name, email, role_id, created_at, updated_at) " +
                                    "VALUES (:id, :username, :password, :oauth_provider, :oauth_uid, :oauth_token, :name, :email, :role_id, :created_at, :updated_at)")
                            .bind("id", user.getId())
                            .bind("username", user.getUserName())
                            .bind("password", user.getPassword())
                            .bind("oauth_provider", user.getOauthProvider())
                            .bind("oauth_uid", user.getOauthUid())
                            .bind("oauth_token", user.getOauthToken())
                            .bind("name", user.getName())
                            .bind("email", user.getEmail())
                            .bind("role_id", user.getRoleId().getId())
                            .bind("created_at", user.getCreatedAt())
                            .bind("updated_at", user.getUpdatedAt())
                            .execute()
            );
            return ketQua;
        }


        @Override
        public int delete(User user) {
            int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                    handle.createUpdate("DELETE FROM users WHERE id = :id")
                            .bind("id", user.getId())
                            .execute()
            );
            return ketQua;
        }

        @Override
        public int update(User user) {
            int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                    handle.createUpdate("UPDATE users " +
                                    "SET username = :username, " +
                                    "password = :password, " +
                                    "oauth_provider = :oauth_provider, " +
                                    "oauth_uid = :oauth_uid, " +
                                    "oauth_token = :oauth_token, " +
                                    "name = :name, " +
                                    "email = :email, " +
                                    "role_id = :role_id, " +
                                    "created_at = created_at, " +
                                    "updated_at = updated_at " +
                                    "WHERE id = :id")
                            .bindBean(user)
                            .execute()
            );
            return ketQua;
        }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        Date createdAt = new Date(System.currentTimeMillis() + 3600000);
        User user1 = new User(1, "hadung", "Hà Huy Dũng", "hadung6765@gmail.com");
        User user = new User("nem", "12345678", "", "", "", "nem", "123@gmail.com", new Role("user"), createdAt, createdAt);
        System.out.println(userDAO.selectById(user1));
    }
}
