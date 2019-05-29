package controllers.HTML;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.HTML;
import utils.DBUtil;

/**
 * Servlet implementation class HTMLsIndexServlet
 */
@WebServlet("/categories/html")
public class HTMLsIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HTMLsIndexServlet() {
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
        List<HTML> HTMLs = em.createNamedQuery("getAllHTMLs", HTML.class)
                             .setFirstResult(15 * (page - 1))
                             .setMaxResults(15)
                             .getResultList();
        long HTMLs_count = (long)em.createNamedQuery("getHTMLsCount", Long.class)
                                     .getSingleResult();
        em.close();

        request.setAttribute("HTMLs", HTMLs);
        request.setAttribute("HTMLs_count", HTMLs_count);
        request.setAttribute("page", page);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/HTMLs/index.jsp");
        rd.forward(request, response);
    }

}