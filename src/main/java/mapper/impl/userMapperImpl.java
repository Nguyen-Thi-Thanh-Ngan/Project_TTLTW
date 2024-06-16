package mapper.impl;

import mapper.IRowMapper;
import model.Role;
import model.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class userMapperImpl implements IRowMapper<User> {

	@Override
	public User maplist(ResultSet rs) {
		User model = new User();
		try {
			model.setId(rs.getInt("id"));
			model.setUserName(rs.getString("username"));
			model.setPassword(rs.getString("password"));
			model.setOauthProvider(rs.getString("oauth_provider"));
			model.setOauthUid(rs.getString("oauth_uid"));
			model.setOauthToken(rs.getString("oauth_token"));
			model.setRoleIdInt(rs.getInt("role_id"));
			model.setCreatedAt(rs.getDate("created_at"));
			model.setUpdatedAt(rs.getDate("updated_at"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return model;
	}

	@Override
	public User mapFindById(ResultSet rs) {
		return null;
	}
}
