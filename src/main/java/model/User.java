package model;

import java.sql.Date;

public class User {
    private String id;
    private String name;
    private String sex;
    private String address;
    private Date birthDay;
    private String phoneNumber;
    private String email;
    private String userName;
    private String password;
    private Role roleId;
    private String role_idStr;

    public User() {
    }

    public User(String id, String name, String sex, String address, Date birthDay, String phoneNumber, String email, String userName, String password, Role role_id) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.address = address;
        this.birthDay = birthDay;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.userName = userName;
        this.password = password;
        this.roleId = role_id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRoleId() {
        return roleId;
    }

    public void setRoleId(Role roleId) {
        this.roleId = roleId;
    }

    public String getRole_idStr() {
        return role_idStr;
    }

    public void setRole_idStr(String role_idStr) {
        this.role_idStr = role_idStr;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", address='" + address + '\'' +
                ", birth_day=" + birthDay +
                ", phone_number='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                ", user_name='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", role_id=" + roleId +
                '}';
    }

    public User(String name, String sex, String address, Date birth_day, String phoneNumber, String email, String user_name, String password, String role_idStr) {
        this.name = name;
        this.sex = sex;
        this.address = address;
        this.birthDay = birth_day;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.userName = user_name;
        this.password = password;
        this.role_idStr = role_idStr;
    }

    public User(String name, String sex, String address, Date birthDay, String phoneNumber, String email, String userName, String password) {
        this.name = name;
        this.sex = sex;
        this.address = address;
        this.birthDay = birthDay;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.userName = userName;
        this.password = password;
    }
}
