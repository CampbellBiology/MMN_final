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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());        
		request.setCharacterEncoding("utf-8");        
		response.setContentType("text/html; charset=UTF-8");
		
		String userID = (String)request.getParameter("userID");
		String [] storeCodeStringArr = new String[5];
		String[] checkBox = new String[5];
		int [] storeCodeArr = new int[5];
		
		checkBox[0] = request.getParameter("check1");
		checkBox[1] = request.getParameter("check2");
		checkBox[2] = request.getParameter("check3");
		checkBox[3] = request.getParameter("check4");
		checkBox[4] = request.getParameter("check5");
		
		storeCodeStringArr[0] = request.getParameter("storeCode1");
		storeCodeStringArr[1] = request.getParameter("storeCode2");
		storeCodeStringArr[2] = request.getParameter("storeCode3");
		storeCodeStringArr[3] = request.getParameter("storeCode4");
		storeCodeStringArr[4] = request.getParameter("storeCode5");
		
		for(int i=0;i<5;i++) {
			if(storeCodeStringArr[i] == null)continue;
			storeCodeArr[i] = Integer.parseInt(storeCodeStringArr[i]);
		}
		
		DB_Conn db = new DB_Conn();
		
		for(int i=0;i<5;i++) {
			if(checkBox[i] == null && storeCodeArr[i] != 0) {
				db.deleteWatchlistInfo(userID, storeCodeArr[i]);
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
