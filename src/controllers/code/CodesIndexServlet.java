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
 * Servlet implementation class CodesIndexServlet
 */
@WebServlet("/codes")
public class CodesIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CodesIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        int page;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            page = 1;
        }
        List<Code> codes = em.createNamedQuery("getAllCodes", Code.class)
                             .setFirstResult(10 * (page - 1))
                             .setMaxResults(10)
                             .getResultList();
        long codes_count = (long)em.createNamedQuery("getCodesCount", Long.class)
                                     .getSingleResult();
        List<Category> categories = em.createNamedQuery("getAllCategories", Category.class)
                                       .getResultList();
        em.close();

        request.setAttribute("codes", codes);
        request.setAttribute("codes_count", codes_count);
        request.setAttribute("categories", categories);
        request.setAttribute("page", page);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/codes/index.jsp");
        rd.forward(request, response);
    }
}
