package com.mvc.controller;

import jakarta.servlet.http.HttpServlet;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mvc.util.DatabaseConnection;
import com.mvc.dao.StringQuery;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class ProductUpadate
 */
@WebServlet("/ProductUpdateServlet")
@MultipartConfig(maxFileSize = 16177215)
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String productName = request.getParameter("productName");
		String stock = request.getParameter("stock");
		String productPrice = request.getParameter("productPrice");
		/* String productDisp= request.getParameter("productDisp"); */
		
		
		InputStream inputStream = null;
		int errorSender = 0;
        Part filePart = request.getPart("productImage");
       
        //System.out.println(filePart);
        if (filePart != null) 
        {
            inputStream = filePart.getInputStream();
        }
        
        
        Connection connection=null;
        PreparedStatement preparedStatement= null;
        try{

			connection = DatabaseConnection.createConnection();
			
			String queryCheck = StringQuery.addProductQuery;
			preparedStatement = connection.prepareStatement(queryCheck);
			preparedStatement.setString(1, productName);
			preparedStatement.setString(2, stock);
			preparedStatement.setString(3, productPrice);
			
			if (inputStream != null) {
                preparedStatement.setBlob(4, inputStream);
            }
			/* preparedStatement.setString(5, productDisp); */
			
			int row = preparedStatement.executeUpdate();
			//System.out.println("try2");
			if(row>0) 
			{
				request.setAttribute("noError", "<br>Completed....");
				errorSender++;
			}

        }
        catch(Exception exception) {
        	//System.out.println("try"+exception);
			request.setAttribute("fullError", "<br>Database error");
			errorSender++;
        }

		if(errorSender > 0 ) 
		{
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ProductUpdate.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
