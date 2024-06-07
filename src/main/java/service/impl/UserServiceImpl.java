package service.impl;


import dao.IRoleDao;
import dao.IUserDao;
import dao.impl.RoleDaoImpl;
import dao.impl.UserDaoImpl;
import model.User;
import service.IUserService;

import java.util.List;

public class UserServiceImpl implements IUserService {
    private IUserDao dao = new UserDaoImpl();
    private IRoleDao roleDao = new RoleDaoImpl();

    @Override
    public boolean login(String username, String password) {
        User user = new User();
        user.setUserName(username);
        user.setPassword(password);
        return dao.login(user);
    }

    @Override
    public String register(User user) {
        user.setId(createId());
        User userNew = dao.register(user);
        return userNew == null ? null : userNew.getId();
    }

    @Override
    public boolean isUserNameExists(String username) {
        return dao.isUserNameExists(username);
    }

    @Override
    public String getIdByUserName(String username) {
        return dao.getIdByUserName(username);
    }

    @Override
    public User getByUserName(String username) {
        return dao.getByUserName(username);
    }

    @Override
    public User getById(String id) {
        return dao.getById(id);
    }

    @Override
    public boolean isEmailExists(String email) {
        return dao.isEmailExists(email);
    }

    @Override
    public void resetPass(String email, String password) {
        dao.resetPass(email, password);
    }

    @Override
    public List<User> findAll() {
        return dao.findAll();
    }

    @Override
    public void deleteById(String id) {
        dao.deleteById(id);
    }

    @Override
    public void update(User user) {
        dao.update(user);
    }

    @Override
    public void add(User user, String role) {
        user.setRole_idStr(roleDao.getByName(role).getId());
        user.setId(createId());
        dao.add(user);
    }

    private String createId(){
        String idOld = dao.getIdTop1();
        if(idOld == null)
            return "u_1";
        int idNumber = Integer.parseInt(idOld.substring(2)) + 1;
        return "u_" + idNumber;
    }
}
