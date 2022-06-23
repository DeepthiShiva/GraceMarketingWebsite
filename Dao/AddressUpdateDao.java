package com.mvc.dao;

import java.sql.Connection;
import java.sql.Statement;

import com.mvc.util.DatabaseConnection;
import com.mvc.bean.AddressBean;


public class AddressUpdateDao {
public String updateAddress(AddressBean addressUpdateBean) {
		
		String fullError="";
		
		String addressId = addressUpdateBean.getAddressId();
		String receiverName = addressUpdateBean.getReceiverName();
		String phoneNumber = addressUpdateBean.getPhoneNumber();
		String addressLine1 = addressUpdateBean.getAddressLine1();
		String addressLine2 = addressUpdateBean.getAddressLine2();
		String pincode = addressUpdateBean.getPincode();
		String city = addressUpdateBean.getCity();
		
		try {
			Connection connection = DatabaseConnection.createConnection();
			
			Statement state=connection.createStatement();
	        state.executeUpdate("update address set receiverName = '"+receiverName+"',phoneNumber = '"+phoneNumber+"',addressLine1 = '"+addressLine1+"',addressLine2 = '"+addressLine2+"',pincode = '"+pincode+"',city = '"+city+"' where addressId = '"+addressId+"'");
		}
		catch(Exception exception) {
			fullError += "<br>"+exception.toString();
		}
		
		if(fullError != "") {
			return fullError;
		}
		else {
			return null;
		}
		
	}
	
}



