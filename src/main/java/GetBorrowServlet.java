import week8.Book;
import week8.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/GetBorrowServlet")
public class GetBorrowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatabaseConnection db = DatabaseConnection.getInstance();
        db.getCon();
        System.out.println("i;m here");
        List<Book> ls = db.GetUserBooks((User)request.getSession().getAttribute("user"));
        request.setAttribute("borrow", ls);
        request.getRequestDispatcher("Profile.jsp").forward(request, response);
    }
}
