

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalcServlet
 */
@WebServlet("/CalcServlet")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public CalcServlet() {
       super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int n1=Integer.parseInt(request.getParameter("n1"));
		int n2=Integer.parseInt(request.getParameter("n2"));
		String op=request.getParameter("op");
		
		long result=0;
		
		switch(request.getParameter("op")){
			case "+" :
				result=n1+n2;
				break;
			case "-" :
				result=n1-n2;
				break;
			case "*" :
				result=n1*n2;
				break;
			case "/" :
				result=n1/n2;
				break;
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.append("<html><body><h2> 계산기 서블릿</h2><hr>")
		.append("계산 결과 : " + result + "</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
