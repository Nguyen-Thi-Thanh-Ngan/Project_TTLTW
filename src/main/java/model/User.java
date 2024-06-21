package model;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
@Getter
@Setter
public class User {
    private int id;
    private String userName;
    private String password;
    private String oauthProvider;
    private String oauthUid;
    private String oauthToken;
    private String name;
    private String email;
    private Role roleId;
    private Date createdAt;
    private Date updatedAt;
    private int roleIdInt;

    public User() {
    }

    public User(int id, String userName, String password, String oauthProvider, String oauthUid, String oauthToken, String name, String email, Role roleId, Date createdAt, Date updatedAt) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.oauthProvider = oauthProvider;
        this.oauthUid = oauthUid;
        this.oauthToken = oauthToken;
        this.name = name;
        this.email = email;
        this.roleId = roleId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public User(String userName, String password, String oauthProvider, String oauthUid, String oauthToken, String name, String email, Role roleId, Date createdAt, Date updatedAt) {
        this.userName = userName;
        this.password = password;
        this.oauthProvider = oauthProvider;
        this.oauthUid = oauthUid;
        this.oauthToken = oauthToken;
        this.name = name;
        this.email = email;
        this.roleId = roleId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public User(int id, String userName, String password, String oauthProvider, String oauthUid, String oauthToken, String name, String email, Date createdAt, Date updatedAt, int roleIdInt) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.oauthProvider = oauthProvider;
        this.oauthUid = oauthUid;
        this.oauthToken = oauthToken;
        this.name = name;
        this.email = email;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.roleIdInt = roleIdInt;
    }

    public User(String userName, String password, String name, String email, Date createdAt) {
        this.userName = userName;
        this.password = password;
        this.name = name;
        this.email = email;
        this.createdAt = createdAt;
    }

    public User(String userName, String password, String name, String email, Date createdAt, int roleIdInt) {
        this.userName = userName;
        this.password = password;
        this.name = name;
        this.email = email;
        this.createdAt = createdAt;
        this.roleIdInt = roleIdInt;
    }

    public User(int id, String userName, String name, String email) {
        this.id = id;
        this.userName = userName;
        this.name = name;
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", oauthProvider='" + oauthProvider + '\'' +
                ", oauthUid='" + oauthUid + '\'' +
                ", oauthToken='" + oauthToken + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", roleId=" + roleId +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }

}
