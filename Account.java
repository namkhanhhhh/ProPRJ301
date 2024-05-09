package Models;

/**
 *
 * @author ADMIN
 */
public class Account {

    private String username;
    private String password;
    private int isAdmin;

    public Account() {
    }

    public Account(String username, String password, int isAdmin) {
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", isAdmin=" + isAdmin + '}';
    }

}
