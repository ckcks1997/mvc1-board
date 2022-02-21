package model;

public class Member {

    private String id;
    private String pass;
    private String name;
    private int num;
    private String tel;
    private String email;
    private String picture;

    public Member() {
    }

    public Member(String id, String pass, String name, int num, String tel, String email, String picture) {
        this.id = id;
        this.pass = pass;
        this.name = name;
        this.num = num;
        this.tel = tel;
        this.email = email;
        this.picture = picture;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

	@Override
	public String toString() {
		return "Member [id=" + id + ", pass=" + pass + ", name=" + name + ", num=" + num + ", tel=" + tel + ", email="
				+ email + ", picture=" + picture + "]";
	}
    
}
