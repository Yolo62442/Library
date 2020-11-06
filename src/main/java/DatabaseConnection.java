

import week8.Book;
import week8.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
    public void register(User user){
        try {
            String query = "INSERT INTO users(name, surname, email, password) VALUES(?, ?, ?, ?)";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString (1, user.getName());
            preparedStmt.setString (2, user.getSurname());
            preparedStmt.setString   (3, user.getEmail());
            preparedStmt.setString(4, user.getPassword());
            preparedStmt.execute();
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
        return true;
    }
    public void addBook(Book book){
        try {
            String query = "INSERT INTO books(name, author, count) VALUES(?, ?, ?)";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString (1, book.getName());
            preparedStmt.setString (2, book.getAuthor());
            preparedStmt.setInt   (3, book.getCount());
            preparedStmt.execute();
        } catch(Exception cnf) {
            System.out.println(cnf.getMessage());
        }
    }
    public List<Book> getBooks(){
        List<Book> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM books";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
        }catch(Exception cnf){
            System.out.println(cnf.getMessage());
        }
        return list;
    }
}
