import com.google.gson.Gson;
import week8.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatabaseConnection db = DatabaseConnection.getInstance();
        db.getCon();
        List<Book> ls = db.getBooks();
        for (Book book : ls){
            System.out.println(book.getName() + " " + book.getAuthor());
        }
        request.setAttribute("books", ls);
        request.getRequestDispatcher("mainList.jsp").forward(request, response);
    }
}
