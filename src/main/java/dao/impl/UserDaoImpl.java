package dao.impl;

import dao.IUserDao;
import mapper.impl.userMapperImpl;
import model.User;

import java.util.List;

public class  UserDaoImpl extends AbstractDaoImpl<User> implements IUserDao {
    @Override
    public boolean login(User item) {
        String sql = "select * from users where username = ? and password = ?";
        List<User> list = query(sql, new userMapperImpl(), item.getUserName(), item.getPassword());
        return list.size() == 1 ? true : false;
    }

    @Override
    public User register(User item) {
        String sql = "insert into users values(?,?,?,?,?,?,?,?,?,?,?)";
        query_insert(sql, item.getId(), item.getUserName(), item.getPassword(), item.getOauthProvider(), item.getOauthUid(), item.getOauthToken(), item.getName(), item.getEmail(), item.getRoleId(), item.getCreatedAt(), item.getUpdatedAt());
        sql = "select * from users where username = ? and password = ?";
        List<User> list = query(sql, new userMapperImpl(), item.getUserName(), item.getPassword());
        if(list.size() == 0)
            return null;
        return list.get(0);
    }

    @Override
    public Integer getIdTop1() {
        String sql = "select * from users ORDER BY LENGTH(id) DESC, id DESC LIMIT 1";
        List<User> list = query(sql, new userMapperImpl());
        return list.size() == 1 ? list.get(0).getId() : null;
    }

    @Override
    public boolean isUserNameExists(String username) {
        String sql = "select * from users where username = ?";
        List<User> list = query(sql, new userMapperImpl(), username);
        return list.size() > 0 ? true : false;
    }

    @Override
    public Integer getIdByUserName(String username) {
        String sql = "select * from users where username = ?";
        List<User> list = query(sql, new userMapperImpl(), username);
        return list.size() > 0 ? list.get(0).getId() : null;
    }

    @Override
    public User getByUserName(String username) {
        String sql = "select * from users where username = ?";
        List<User> list = query(sql, new userMapperImpl(), username);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public User getById(String username) {
        String sql = "select * from users where id = ?";
        List<User> list = query(sql, new userMapperImpl(), username);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public boolean isEmailExists(String email) {
        String sql = "select * from users where email = ?";
        return query(sql, new userMapperImpl(), email).size() > 0;
    }

    @Override
    public void resetPass(String email, String password) {
        String sql = "update users set password = ? where email = ?";
        query_update(sql, password, email);
    }

    @Override
    public List<User> findAll() {
        String sql = "select * from users";
        return query(sql, new userMapperImpl());
    }

    @Override
    public void deleteById(String id) {
        String sql = "delete from users where id = ?";
        query_update(sql, id);
    }

    @Override
    public void update(User user) {
        String sql = "update users set username = ?, password = ?, oauth_provider = ?, oauth_provider = ?, oauth_provider = ?, name = ?, email = ?, role_id = ? created_at = ? updated_at = ? where id = ?";
        query_update(sql, user.getUserName(), user.getPassword(), user.getOauthProvider(), user.getOauthUid(), user.getOauthToken(), user.getName(), user.getEmail(), user.getRoleId(), user.getCreatedAt(), user.getUpdatedAt(), user.getId());
    }

    @Override
    public void add(User user) {
        String sql = "insert into users values(?,?,?,?,?,?,?,?,?,?,?)";
        query_update(sql, user.getId(), user.getUserName(), user.getPassword(), user.getOauthProvider(), user.getOauthUid(), user.getOauthToken(), user.getName(), user.getEmail(), user.getRoleId(), user.getCreatedAt(), user.getUpdatedAt());
    }
}