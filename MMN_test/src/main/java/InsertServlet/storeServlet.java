package InsertServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB_Conn;

/**
 * Servlet implementation class storeServlet
 */
@WebServlet("/store")
public class storeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public storeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		try {
			// 유저 아이디
			String userId = request.getParameter("userId");
			// 가게코드
			int storeCode = Integer.parseInt(request.getParameter("storeCode"));
			// 관심목록에서 제거해야 될 가게일 때 chk1는 공백이고 chk2는 null이다.
			// 관심목록에 추가해야 될 가게일 때 chk2는 공백이고 chk1는 null이다.
			String chk1 = request.getParameter("toDelete");
			String chk2 = request.getParameter("toAdd");

			DB_Conn db = new DB_Conn();

			// 관심목록에 가게를 제거해야 한다면
			if (chk2 == null) {
				db.deleteWatchlistInfo(userId, storeCode);
			}
			// 관심목록에 가게를 추가해야 된다면
			else {
				db.addWatchlistInfo(userId, storeCode);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 관심목록을 누른 뒤 바껴야될 페이지는 여전히 Store.jsp 이다.
		String context = request.getContextPath();
		response.sendRedirect(context + "/Store.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
