package service.impl;

import dao.ICartDAO;
import dao.IRoleDao;
import dao.IUserDao;
import dao.impl.CartDAOImpl;
import dao.impl.RoleDaoImpl;
import dao.impl.UserDaoImpl;
import model.Role;
import model.User;
import org.mindrot.jbcrypt.BCrypt;
import service.IUserService;

import java.util.List;
import java.util.concurrent.CompletableFuture;

public class UserServiceImpl implements IUserService {
    private IUserDao userDao = new UserDaoImpl();
    private IRoleDao roleDao = new RoleDaoImpl();
    private ICartDAO cartDao = new CartDAOImpl();

    @Override
    public boolean login(String username, String password) {
        User user = userDao.getUserByUserName(username);
        if(user != null){
            if(BCrypt.checkpw(password, user.getPassword())){
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean register(User user) {
        String pass = user.getPassword();
        String passEncode = BCrypt.hashpw(pass, BCrypt.gensalt(12));
        user.setPassword(passEncode);
        user.setStatus(1);
        user.setRoleId(4);
        return userDao.register(user);
    }

    @Override
    public boolean isUserNameExists(String username) {
        return userDao.isUserNameExists(username);
    }

    @Override
    public Integer getIdByUserName(String username) {
        User user = userDao.getUserByUserName(username);
        return user.getId();
    }

    @Override
    public Integer getRoleIdByUsername(String username) {
        User user = userDao.getUserByUserName(username);
        Role role = roleDao.findById(user.getRoleId());
       return role.getId();
    }

    @Override
    public User getUserByUsername(String username) {
        User user = userDao.getUserByUserName(username);
        return user;
    }

    @Override
    public boolean isEmailExists(String email) {
        return false;
    }

    @Override
    public void resetPass(String email, String password) {

    }

    @Override
    public List<User> findAll() {
        return List.of();
    }

    @Override
    public void deleteById(Integer id) {
        userDao.deleteById(id);
    }

    @Override
    public void update(User user) {

    }

    @Override
    public void add(User user, String role) {

    }

    @Override
    public User isUserExists(String oauthProvider, String oauthUid) {
        return userDao.isUserExists(oauthProvider, oauthUid);
    }

    @Override
    public List<User> findAllUser() {
        return null;
    }
}