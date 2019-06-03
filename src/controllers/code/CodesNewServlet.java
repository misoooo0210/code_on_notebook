package controllers.code;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Category;
import models.Code;
import utils.DBUtil;

/**
 * Servlet implementation class CodesNewServlet
 */
@WebServlet("/codes/new")
public class CodesNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CodesNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());

        EntityManager em = DBUtil.createEntityManager();
        List<Category> categoryList = em.createNamedQuery("getAllCategories", Category.class)
                                       .getResultList();
        em.close();

        Code c = new Code();
        request.setAttribute("code", c);
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/codes/new.jsp");
        rd.forward(request, response);
    }
}
