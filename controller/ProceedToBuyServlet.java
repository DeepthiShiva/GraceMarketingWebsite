package com.mvc.controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.mvc.bean.ProceedToBuyBean;
import com.mvc.dao.ProceedToBuyDao;

/**
 * Servlet implementation class ProceedBuy
 */

@WebServlet("/ProceedToBuyServlet")
public class ProceedToBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProceedToBuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String addressId = request.getParameter("address");
		String userId = (String)request.getSession().getAttribute("userid");
		String productId = (String)request.getSession().getAttribute("productId");
		String quantity = (String)request.getSession().getAttribute("quantity");
		String productPrice = (String)request.getSession().getAttribute("productPrice");
		
			
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("ProceedToBuy.jsp");

		System.out.println("Before Bean "+addressId+" "+userId+" "+productPrice);
		if(productId != null && userId != null && addressId != null && productPrice != null && quantity != null) {
			
			ProceedToBuyBean proceedToBuyBean = new ProceedToBuyBean();
			proceedToBuyBean.setAddressId(addressId);
			proceedToBuyBean.setProductId(productId);
			proceedToBuyBean.setUserId(userId);
			proceedToBuyBean.setProductPrice(productPrice);
			proceedToBuyBean.setQuantity(quantity);
			
			System.out.println("After Bean "+addressId+" "+userId+" "+productPrice);
			
			ProceedToBuyDao proceedToBuyDao = new ProceedToBuyDao();
			String fullError = proceedToBuyDao.addOrder(proceedToBuyBean);

			if(fullError == null) {
				response.sendRedirect("SuccessPage.jsp");
			}
			else {
				requestDispatcher.forward(request,response);
			}
			
		}
		
	}

}
