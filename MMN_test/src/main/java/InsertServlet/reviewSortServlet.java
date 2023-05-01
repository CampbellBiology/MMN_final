package InsertServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class reviewSortServlet
 */
@WebServlet("/resources/view_0427/reviewSortServlet")
public class reviewSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reviewSortServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8"); 
		//현재 파일 경로 저장
		String context = request.getContextPath();
		//원래 페이지로 이동을 위해
		String review_store = request.getParameter("review_storeCode");
		
		//리뷰 정렬번호
		String review_SortTexted = request.getParameter("review_SortTexted");
		
		//리뷰 정렬번호를 세션을 통해 전달
		HttpSession session = request.getSession();
		session.setAttribute("test", review_SortTexted);
		response.sendRedirect(context + "/resources/view_0427/Store_0427.jsp?storeCode=" + review_store);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
