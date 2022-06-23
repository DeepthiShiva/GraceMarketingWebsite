package com.mvc.controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
 

import com.mvc.bean.AddressBean;
import com.mvc.dao.AddressUpdateDao;

/**
 * Servlet implementation class AddressUpdateServlet
 */
@WebServlet("/AddressUpdateServlet")
public class AddressUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ji");
		String addressId = (String)request.getSession().getAttribute("addressId");
		String receiverName = request.getParameter("receiverName");
		String phoneNumber = request.getParameter("phoneNumber");
		String addressLine1 = request.getParameter("addressLine1");
		String addressLine2 = request.getParameter("addressLine2");
		String pincode = request.getParameter("pincode");
		String city = request.getParameter("city");
		
		System.out.println(addressId+""+receiverName+""+phoneNumber+""+addressLine1+"0"+addressLine2+""+pincode+""+city);
		int errorSender=0;
		RequestDispatcher requsetDispatcher = request.getRequestDispatcher("EditAddress.jsp");
		
		AddressBean addressUpdateBean = new AddressBean();
		
		
		if(addressId != null && receiverName != null && phoneNumber != null && addressLine1 != null && addressLine2 != null && pincode != null && city != null) {
			
			addressUpdateBean.setAddressId(addressId);
			addressUpdateBean.setReceiverName(receiverName);
			addressUpdateBean.setPhoneNumber(phoneNumber);
			addressUpdateBean.setAddressLine1(addressLine1);
			addressUpdateBean.setAddressLine2(addressLine2);
			addressUpdateBean.setPincode(pincode);
			addressUpdateBean.setCity(city);
			
			System.out.println("hi");

			AddressUpdateDao addressUpdateDao = new AddressUpdateDao();
			

			String fullError = addressUpdateDao.updateAddress(addressUpdateBean);


			if(fullError != null) {
				request.setAttribute("fullError", fullError);
				errorSender++;
			}
			else {
				response.sendRedirect("address.jsp");
			}

			if(errorSender > 0 ) {
				requsetDispatcher.forward(request, response);
			}
		}
		
	}

}
