package DAO.impl;

import DAO.IRoleDao;
import Model.Role;
import mapper.impl.RoleMapperImpl;

import java.util.List;

public class RoleDaoImpl extends AbstractDaoImpl<Role> implements IRoleDao {
    @Override
    public Role getByName(String name) {
        String sql = "select * from roles where role_name = ?";
        List<Role> roles = query(sql, new RoleMapperImpl(), name);
        return roles.size() > 0 ? roles.get(0) : null;
    }
}
