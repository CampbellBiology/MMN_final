package InsertServlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import DataClass.*;
import DB.*;

/**
 * Servlet implementation class reviewServlet
 */
@WebServlet("/resources/view_0427/review")
public class reviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public reviewServlet() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("리뷰 서블릿 호출");
		// 인코딩 지정
		request.setCharacterEncoding("utf-8");
		// 현재 파일 경로 저장
		String context = request.getContextPath();

		// DB객체 생성
		DB_Conn dao = new DB_Conn();

		// 리뷰데이터 모델클래스.
		reviewData sd = new reviewData();
		String  review_imgurls = "";
		String review_store = "";
		// 리뷰페이지에서 리뷰 내용을 가져와 DB에 입력
		// 각 페이지가 아직 연결되지 않아 세션가져오기 어려움
		// 임시로 아이디 입력칸 생성
		try {
			String path = "C:/Apache24/htdocs/ImageTest/storeImgSub";
			File f = new File(path);
	    	//파일이 있는지 체크
	    	if(!f.exists()){
	    		//파일폴더 생성.
	            f.mkdirs();
	        }
			MultipartRequest multi = new MultipartRequest(request, path, 1024 * 1024 * 10, "utf-8");
			// 메뉴 리스트와 태그 리스트.
			String menuListView = multi.getParameter("menuListView");
			String tagListView = multi.getParameter("tagListView");

			// input 받아옴.
			String review_noname = multi.getParameter("noname_check"); // null인가 아닌가.
			review_store = multi.getParameter("review_storeCode"); // request.getParameter("review_storeCode");
			String review_id = multi.getParameter("review_input_id");
			String review_text = multi.getParameter("review_text");
			String review_score = multi.getParameter("score_result"); // request.getParameter("score_review");
			
			//이미지 input
			String review_imgtext = multi.getParameter("name_imgtext");
			String imgstr[] = review_imgtext.split(",");
	        for(int i=1; i<imgstr.length; i++) {
	        	
	        	//이미지 파일명 변경.
	        	File fileimg = new File("/ImageTest/storeImgSub/"+imgstr[i]);
	        	File fileimgname = new File("/ImageTest/storeImgSub/"+review_store+"-"+review_id+"-"+i+".jpg");
	        	fileimg.renameTo(fileimgname);
	        	
	        	//이미지 링크를 문자열로 만들기(DB입력용)
	        	if(i==1) {
	        		review_imgurls = '"'+fileimgname.toString()+'"';
	        	}else {
	        		review_imgurls = review_imgurls+","+'"'+fileimgname.toString()+'"';
	        	}
	        	//이미지 저장완료
	        }
	        //db에 저장하는 형식에 맞춰 url로 방식으로 변환
	        review_imgurls = review_imgurls.replace("\\", "/");
	        //System.out.println("이미지 경로: "+review_imgurls);
			
	        /*
			//받아온 결과 출력.
			System.out.println("menu: "+menuListView);
			System.out.println("tag: "+tagListView);
			
			System.out.println("store: "+review_store);
			System.out.println("id: "+review_id);
			System.out.println("text: "+review_text);
			System.out.println("score: "+review_score); //true: value, false: null(익명체크)
			System.out.println("no: "+review_noname);
			*/
			
			// 데이터 reviewData 방식으로 저장
			sd.setStoreCode(review_store);
			sd.setUserId(review_id);
			sd.setContents(review_text);
			sd.setRating(review_score);
			sd.setPhotoPath(review_imgurls);
			sd.setAnonymous(review_noname);

			// DB삽입
			//리뷰 정보
			dao.Insert_ReviewData(sd);
			//메뉴리스트와 태그리스트
			dao.Insert_List(menuListView, review_id, tagListView, review_store);
			System.out.println("db 등록 끝");
			
		} catch (Exception e) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('문제가 발생하였습니다.'); location.href='"+context + "/Store.jsp"+"';</script>"); 
			writer.close();
			e.printStackTrace();
		}
		//"Store_0424.jsp?storeCode=<%=tlbt.getTldList().get(j).getStoreCode()%>"
		//response.sendRedirect(context + "/View/Store_0424.jsp?storeCode="+review_store);
		response.sendRedirect(context + "/resources/view_0427/Store_0427.jsp?storeCode=" + review_store);
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
