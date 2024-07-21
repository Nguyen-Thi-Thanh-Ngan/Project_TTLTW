package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Integer id;
    private String username;
    private String password;
    private String oauthProvider;
    private String oauthUid;
    private String oauthToken;
    private String name;
    private String email;
    private Integer roleId;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private Integer status;

    public User(Integer id, String name, String email, String username, Integer roleId) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.username = username;
        this.roleId = roleId;
    }
}