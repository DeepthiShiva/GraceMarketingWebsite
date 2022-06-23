package com.mvc.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;

import com.mvc.bean.EditProductBean;
import com.mvc.dao.EditProductDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
/**
 * Servlet implementation class EditProductServlet
 */
@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId = (String)request.getSession().getAttribute("productId");
		String productName = request.getParameter("productName");
		String productPrice = request.getParameter("productPrice");
		String stock = request.getParameter("stock");

		System.out.println("all set1 "+productId+" "+productName+" "+productPrice+" "+stock);

		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("ProductEdit.jsp");
		
		InputStream inputStream = null;
		int errorSender = 0;
        Part filePart = request.getPart("productImage");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
    
        if(productId != null && productName != null && productPrice != null && stock != null) {
        	
    		System.out.println(productId+"hai");
        	EditProductBean editProductBean = new EditProductBean();
        	editProductBean.setProductId(productId);
        	editProductBean.setProductName(productName);
        	editProductBean.setPrice(productPrice);
        	editProductBean.setStock(stock);
    		System.out.println("all set "+productId+" "+productName+" "+productPrice+" "+stock+" "+inputStream.toString());
        	if(inputStream != null) {
        		System.out.println("image created");
        		editProductBean.setProductimage((Blob) inputStream);
        	}
        	
        	EditProductDao editProductDao = new EditProductDao();
        	String fullerror = editProductDao.updateAddress(editProductBean);

			if(fullerror != null) {
				request.setAttribute("fullError", fullerror);
				errorSender++;
			}
			else {
				response.sendRedirect("ProductEditList.jsp");
			}

			if(errorSender > 0 ) {
				requestDispatcher.forward(request, response);
			}
        	
        }
		
	}

}
