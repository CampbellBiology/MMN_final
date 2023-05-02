package InsertServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.watchlist;
import DB.DB_Conn;
import DataClass.loginData;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/resources/view_0427/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {
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

		HttpSession session = request.getSession();
	    String recentURI = (String)session.getAttribute("urlPage");
	    session.removeAttribute("urlPage");
	    
		request.setCharacterEncoding("UTF-8");

		//로그인시 DB로 데이터를 조회하여 데이별 결과 출력
		//로그인 실패시 alert
		try {
			// 유저 아이디
			String user_id = request.getParameter("user_id");
			// 유저 패스워드
			String user_pw = request.getParameter("user_pw");

			// 데이터베이스 접근
			DB_Conn _DB = new DB_Conn();
			// 로그인 데이터 객체 생성
			loginData _Data = new loginData();

			// 로그인 데이터 유저 아이디, 유저 패스워드
			_Data.userID = user_id;
			_Data.userPW = user_pw;

			// 로그인 데이터 매칭 결과
			int res = _DB.loginMathcing(_Data);
			// 로그인 데이터에서 로그인 상태를 업데이트 한다.
			loginData.setLoginStatus(res);

			// 세션 객체를 얻는다.
			//HttpSession session = request.getSession();
			// member 속성에 유저 아이디를 넣는다. 이걸로 유저가 로그인 중인지 체크한다.
			session.setAttribute("memberID", _Data.userID);


			// 로그인 후 띄울 화면을 설정하기 위한 코드
			String context = request.getContextPath();

			
			if (res == 0) {
	            System.out.println("마스터 계정 로그인 성공");
	            response.sendRedirect(context + "/resources/view_0427/Main_0427.jsp");
	         } else if (res == 1) {
	            System.out.println("일반 계정 로그인 성공");
	            System.out.println("recentURI: "+ context + recentURI);
	            //이전페이지로 돌아가게 함
	            response.sendRedirect(context+recentURI);
	         } else if (res == 2) {
	            System.out.println("비밀번호를 다시 확인 해주세요");
	          //로그인 실패 시 alert 매서드 타게 함
	            alert(response, context);
	         } else {          
	            System.out.println("아이디가 잘못 됐습니다.");
	          //로그인 실패 시 alert 매서드 타게 함
	            alert(response, context);
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
		
	//로그인 실패 시 뜨는 alert 매서드
	public static void alert(HttpServletResponse response, String msg) {
	    try {
	    	response.setCharacterEncoding("UTF-8");
	    	response.setContentType("text/html; charset=UTF-8");
			PrintWriter w = response.getWriter();
			w.write("<script>alert('"+ "Check ID or PW."+"');history.go(-1);</script>\" charset=\"utf-8\" </script>");
			w.flush();
			w.close();
	    } catch(Exception e) {
			e.printStackTrace();
	    }
	}
}