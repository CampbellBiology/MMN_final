package InsertServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB_Conn;

/**
 * Servlet implementation class watchlistInactiveServlet
 */
@WebServlet("/resources/View/watchlistInactive")
public class watchlistInactiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public watchlistInactiveServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		try {
			// 유저 아이디
			String userID = (String) request.getParameter("userID");
			// 관심목록의 개수는 최대 10개
			int len = 10;

			// 관심목록의 가게코드를 String으로 저장한다.
			String[] storeCodeStringArr = new String[len];
			// 관심목록의 체크 유무를 checkBox에 저장한다.
			String[] checkBox = new String[len];
			// 관심목록의 가게코드를 int형으로 저장한다.
			int[] storeCodeArr = new int[len];

			for (int i = 0; i < len; i++) {
				// 관심목록의 체크 상태를 checkBox에 저장한다.
				checkBox[i] = request.getParameter("check" + i);
				
				System.out.println("checkBox : "+ checkBox[i]);
			}

			for (int i = 0; i < len; i++) {
				// 문자열로 가게코드를 받는다.
				storeCodeStringArr[i] = request.getParameter("storeCode" + i);
			}

			for (int i = 0; i < len; i++) {
				// 관심목록에 없는 가게코드라면 continue
				if (storeCodeStringArr[i] == null)
					continue;
				// 관심목록에 있는 가게 코드라면 storeCodeArr에 정수로 파싱한 가게코드를 삽입한다.
				storeCodeArr[i] = Integer.parseInt(storeCodeStringArr[i]);
			}

			// 데이터베이스 접근
			DB_Conn db = new DB_Conn();

			for (int i = 0; i < len; i++) {
				// 관심목록에서 취소된 가게라면
				if (checkBox[i] == null && storeCodeArr[i] != 0) {
					// 관심목록에서 지워준다.
					db.deleteWatchlistInfo(userID, storeCodeArr[i]);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
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
