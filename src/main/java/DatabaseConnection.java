

import java.sql.*;

public class DatabaseConnection {
    private Connection con;
    private static DatabaseConnection instance;

    private DatabaseConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "zet", "aAWRpyNNcazv9Hlr");
        }
        catch (Exception cnf) {
            System.out.println(cnf.getMessage());
        }

    }

    public Connection getCon() {
        return con;
    }
    public void closeCon(){
        try {
            con.close();
        }catch (Exception cnf){
            System.out.println(cnf.getMessage());
        }
    }
    public static DatabaseConnection getInstance(){
        if(instance == null){
            instance = new DatabaseConnection();
        }
        return instance;
    }
    public void query( String sql){
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                System.out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) );

            }
        }catch(Exception cnf){
            System.out.println(cnf.getMessage());
        }
    }
    public void register(String n, String s, String e, String p){
        try {
            String query = "INSERT INTO users(name, surname, email, password) VALUES(?, ?, ?, ?)";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString (1, n);
            preparedStmt.setString (2, s);
            preparedStmt.setString   (3, e);
            preparedStmt.setString(4, p);
            preparedStmt.execute();
            con.close();
        } catch(Exception cnf) {
            System.out.println(cnf.getMessage());
        }
    }

    public boolean emailCheck(String e){

        try {System.out.println("checking");
            String query = "SELECT * FROM users WHERE email = ?";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString (1, e);
            ResultSet rs = preparedStmt.executeQuery();
            if (rs.next()) {

                return false;
            }
        } catch(Exception cnf) {
            System.out.println(cnf.getMessage());
        }
        closeCon();
        return true;
    }
}
