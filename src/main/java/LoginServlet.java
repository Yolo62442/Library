import week8.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatabaseConnection db = DatabaseConnection.getInstance();
        db.getCon();
        System.out.println(request.getParameter("email") + " " + request.getParameter("password"));
        User user = db.login(request.getParameter("email"), request.getParameter("password"));
        System.out.println(user);
        if (user == null ) {
            request.setAttribute("Error", "Email or password is incorrect");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        response.sendRedirect("BookServlet");

    }
}
