package am.pac;

import java.sql.Date;

public class User {
    private int id;
    private String firsname;
    private String lastname;
    private String email;
    private Date date;

    public User(int id, String firsname, String lastname, String email, Date date) {
        this.id = id;
        this.firsname = firsname;
        this.lastname = lastname;
        this.email = email;
        this.date = date;
    }

    public User() {

    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getFirsname() {
        return firsname;
    }

    public void setFirsname(String firsname) {
        this.firsname = firsname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
