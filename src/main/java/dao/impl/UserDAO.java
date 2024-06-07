        package dao.impl;

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
            handle.createQuery("SELECT id, name, sex, address, birth_day, phone_number, email, user_name, password, role_id FROM users")
                    .map((rs, ctx) -> {
                        String id = rs.getString("id");
                        String name = rs.getString("name");
                        String sex = rs.getString("sex");
                        String address = rs.getString("address");
                        Date birth_day = rs.getDate("birth_day");
                        String phoneNumber = rs.getString("phone_number");
                        String email = rs.getString("email");
                        String user_name = rs.getString("user_name");
                        String password = rs.getString("password");
                        String role_id = rs.getString("role_id");

                        Role role = new RoleDAO().selectById(new Role(role_id, null));

                        User user = new User(id, name, sex, address, birth_day, phoneNumber, email, user_name, password, role);
                        users.add(user);

                        return null;
                    }).list();
            return users;
        }));
        return ketQua;
    }

    public User getUserByEmail(String email) {
        Optional<User> user = JDBIConnector.getConnect().withHandle(handle ->
                handle.createQuery("SELECT id, name, sex, address, birth_day, phone_number, " +
                                "email, user_name, password, role_id FROM users WHERE email = ?")
                        .bind(0, email)
                        .map((rs, ctx) -> {
                            String id = rs.getString("id");
                            String name = rs.getString("name");
                            String sex = rs.getString("sex");
                            String address = rs.getString("address");
                            Date birth_day = rs.getDate("birth_day");
                            String phoneNumber = rs.getString("phone_number");
                            String email1 = rs.getString("email");
                            String user_name = rs.getString("user_name");
                            String password = rs.getString("password");
                            String role_id = rs.getString("role_id");

                            Role role = new RoleDAO().selectById(new Role(role_id, null));
                            return new User(id, name, sex, address, birth_day, phoneNumber, email1, user_name, password, role);
                        })
                        .findFirst()
        );

        return user.orElse(null);
    }


    @Override
    public User selectById(User userP) {
        Optional<User> user = JDBIConnector.getConnect().withHandle((handle ->
                handle.createQuery("SELECT id, name, sex, address, birth_day, phone_number, " +
                                "email, user_name, password, role_id FROM users WHERE id = ?")
                        .bind(0, userP.getId())
                        .map((rs, ctx) -> {
                            String id = rs.getString("id");
                            String name = rs.getString("name");
                            String sex = rs.getString("sex");
                            String address = rs.getString("address");
                            Date birth_day = rs.getDate("birth_day");
                            String phoneNumber = rs.getString("phone_number");
                            String email1 = rs.getString("email");
                            String user_name = rs.getString("user_name");
                            String password = rs.getString("password");
                            String role_id = rs.getString("role_id");

                            Role role = new RoleDAO().selectById(new Role(role_id, null));
                            return new User(id, name, sex, address, birth_day, phoneNumber, email1, user_name, password, role);
                        })
                        .findFirst()
        ));
        return user.isEmpty() ? null : user.get();
    }

        public static User getById(String userP) {
            Optional<User> user = JDBIConnector.getConnect().withHandle((handle ->
            handle.createQuery("SELECT id, name, sex, address, birth_day, phone_number, " +
                            "email, user_name, password, role_id FROM users WHERE id = ?")
                    .bind(0, userP)
                    .map((rs, ctx) -> {
                        String id = rs.getString("id");
                        String name = rs.getString("name");
                        String sex = rs.getString("sex");
                        String address = rs.getString("address");
                        Date birth_day = rs.getDate("birth_day");
                        String phoneNumber = rs.getString("phone_number");
                        String email1 = rs.getString("email");
                        String user_name = rs.getString("user_name");
                        String password = rs.getString("password");
                        String role_id = rs.getString("role_id");

                        Role role = new RoleDAO().selectById(new Role(role_id, null));
                        return new User(id, name, sex, address, birth_day, phoneNumber, email1, user_name, password, role);
                    })
                    .findFirst()
        ));
            return user.isEmpty() ? null : user.get();
        }


        public static void main(String[] args) {
            UserDAO user = new UserDAO();
            User u = new User("u_2", "hhh", null, null, null, null, "hahuydung@gmail.com", "dung", "123", null);
            //System.out.println(user.selectAll());
            System.out.println(user.getUserByEmail("hadung6765@gmail.com"));
        }

        @Override
        public int insert(User user) {
            int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                    handle.createUpdate("INSERT INTO users (id, name, sex, address, birth_day, phone_number, email, user_name, password) " +
                                    "VALUES (:id, :name, :sex, :address, :birthDay, :phoneNumber, :email, :userName, :password)")
                            .bind("id", user.getId())
                            .bind("name", user.getName())
                            .bind("sex", user.getSex())
                            .bind("address", user.getAddress())
                            .bind("birthDay", user.getBirthDay())
                            .bind("phoneNumber", user.getPhoneNumber())
                            .bind("email", user.getEmail())
                            .bind("userName", user.getUserName())
                            .bind("password", user.getPassword())
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
                                    "SET name = :name, " +
                                    "sex = :sex, " +
                                    "address = :address, " +
                                    "birth_day = :birthDay, " +
                                    "phone_number = :phoneNumber, " +
                                    "email = :email, " +
                                    "user_name = :userName, " +
                                    "password = :password " +
                                    "WHERE id = :id")
                            .bindBean(user)
                            .execute()
            );
            return ketQua;
        }
    }
