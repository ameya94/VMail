/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package authenticate;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import Database.DatabaseConnection;

/**
 * 
 * @author test
 */
public class CreateUser {

	DatabaseConnection dbcon;

	public CreateUser() {
		dbcon = new DatabaseConnection();
		dbcon.dbconnection();
	}

	public boolean create(String fname, String address, String mail,
			String password, String gender, String mobile) {
		boolean flag = false;
		try {
			String query = "INSERT INTO usertable VALUES('" + fname + "', '"
					+ address + "', '" + mail + "', '" + password + "','"
					+ gender + "','" + mobile + "')";
			System.out.println(query);
			int rslt = dbcon.getUpdate(query);
			if (rslt == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(String username, String password, String mail,
			String mobile, String gender, String dob, String age,
			String salary, String location) {
		boolean flage = false;
		try {
			String query = "select * from userTable where username='"
					+ username + "'";
			ResultSet rs = dbcon.getResultSet(query);
			if (rs.next()) {
				query = "UPDATE userTable SET location='" + location
						+ "' , Gender='" + gender + "' , dob='" + dob
						+ "' , Age='" + age + "' , Email='" + mail
						+ "' , mobno='" + mobile + "' , password='" + password
						+ "' WHERE username='" + username + "'";

				int i = dbcon.getUpdate(query);
				if (i == 1)
					flage = true;
			} else {
				flage = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flage;
	}

	public boolean chkExists(String userid) {
		boolean flag = false;
		try {

			String query = "SELECT * FROM usertable WHERE email='" + userid
					+ "'";
			ResultSet rs = dbcon.getResultSet(query);
			if (rs.next()) {
				flag = true;
			}
		} catch (SQLException ex) {
			Logger.getLogger(CreateUser.class.getName()).log(Level.SEVERE,
					null, ex);
		}
		return flag;
	}

	public int getID(String tableName) {
		int id = 0;
		try {
			String query = "SELECT MAX(ID) AS ID FROM " + tableName + ";";
			ResultSet rs = (ResultSet) dbcon.getResultSet(query);

			if (rs.next()) {
				if (rs.getString("ID") != null) {
					id = rs.getInt("ID");
				} else {
					id = 0;
				}
			}
			id = id + 1;
		} catch (Exception e) {
		}
		return id;
	}
}
