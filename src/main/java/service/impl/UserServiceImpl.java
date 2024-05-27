package service.impl;

import dao.IRoleDao;
import dao.IUserDao;
import dao.impl.RoleDaoImpl;
import dao.impl.UserDaoImpl;
import model.User;
import org.mindrot.jbcrypt.BCrypt;
import service.IUserService;

import java.util.List;

public class UserServiceImpl implements IUserService {
    private IUserDao userDao = new UserDaoImpl();
    private IRoleDao roleDao = new RoleDaoImpl();

    @Override
    public boolean login(String username, String password) {
        User user = new User();
        user.setUserName(username);
        user.setPassword(password);
        return userDao.login(user);
    }

    @Override
    public String register(User user) {
        user.setId(createId());
        String pass = user.getPassword();
        String passEn = BCrypt.hashpw(pass, BCrypt.gensalt(12));
        user.setPassword(passEn);
        User userNew = userDao.register(user);
        return userNew == null ? null : userNew.getId();
    }

    @Override
    public boolean isUserNameExists(String username) {
        return userDao.isUserNameExists(username);
    }

    @Override
    public String getIdByUserName(String username) {
        return userDao.getIdByUserName(username);
    }

    @Override
    public User getByUserName(String username) {
        return userDao.getByUserName(username);
    }

    @Override
    public User getById(String id) {
        return userDao.getById(id);
    }

    @Override
    public boolean isEmailExists(String email) {
        return userDao.isEmailExists(email);
    }

    @Override
    public void resetPass(String email, String password) {
        userDao.resetPass(email, password);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public void deleteById(String id) {
        userDao.deleteById(id);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public void add(User user, String role) {
        user.setRole_idStr(roleDao.getByName(role).getId());
        user.setId(createId());
        userDao.add(user);
    }

    private String createId(){
        String idOld = userDao.getIdTop1();
        if(idOld == null)
            return "u_1";
        int idNumber = Integer.parseInt(idOld.substring(2)) + 1;
        return "u_" + idNumber;
    }
}
