import week8.Book;
import week8.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static java.lang.Integer.parseInt;

@WebServlet("/BorrowServlet")
public class BorrowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatabaseConnection db = DatabaseConnection.getInstance();
        db.getCon();
        db.Borrow((User)request.getSession().getAttribute("user"), parseInt(request.getParameter("id")));
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
