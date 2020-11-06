import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import com.google.gson.Gson;

@WebServlet(value = "/CheckServlet")
public class CheckServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatabaseConnection db = DatabaseConnection.getInstance();
        db.getCon();
        String email = request.getParameter("email");
        boolean check = db.emailCheck(email);
        System.out.println(check);
        String json = new Gson().toJson(check);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }
}
