package InsertServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB_Conn;
import DataClass.Insert_joinData;

/**
 * Servlet implementation class servlet_
 */
@WebServlet("/resources/View/join")
public class joinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public joinServlet() {
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

		try {
			// 유저 아이디
			String user_id = request.getParameter("user_id");
			// 유저 패스워드
			String user_pw = request.getParameter("user_pw");
			// 유저 이름
			String user_name = request.getParameter("user_name");
			// 유저 이메일
			String user_email = request.getParameter("user_email");

			// 데이터베이스 접근
			DB_Conn _DB = new DB_Conn();
			// 삽입할 회원가입 정보를 저장할 객체다.
			Insert_joinData _Data = new Insert_joinData();

			_Data.userID = user_id;
			_Data.userPW = user_pw;
			_Data.userName = user_name;
			_Data.userEmail = user_email;
			_Data.isMaster = "N";

			// 데이터베이스에 회원가입 자료들을 삽입한다.
			_DB.Insert_UserData(_Data);

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
