package week8;

public class User {
    private int id;
    private String name;
    private String surname;
    private String email;
    private int access;

    public User(int id, String name, String surname, String email, int access) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.access = access;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAccess() {
        return access;
    }

    public void setAccess(int access) {
        this.access = access;
    }
}
