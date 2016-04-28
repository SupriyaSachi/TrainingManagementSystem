package trainingplan.course.dao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import trainingplan.course.domain.LogInAndPass;     

public class LogInAndPassDAO {
	private static final String DB_EXIST_TEST_URL = "jdbc:mysql://localhost:3306/";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/JDBC_TrainingManagementSystem";
	private static final String DB_USER = "root";
	private static final String DB_PWD = "root";          
	private static final String INSERT_QUERY = "insert into loginandpass values (?,?,?,?,?)";
	private static final String UPDATE_QUERY = "update loginandpass set user_firstname=?, user_lastname=?, user_nricno=?, user_name=?, user_password=? where user_nricno=?";
	
	public void IsDBExistIfNotCreate()
	{
		Connection connection = null;
		ResultSet resultset = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_EXIST_TEST_URL, DB_USER, DB_PWD);
			//String dbName = "JDBC_TrainingManagementSystem";
			String dbName = "jdbc_trainingmanagementsystem";
			Boolean dbexist = false;
			if (connection != null)
			{
				resultset = connection.getMetaData().getCatalogs();
				while(resultset.next())
				{
					String catalogs = resultset.getString(1);
					if(catalogs.equals(dbName))
					{
						dbexist = true;
					}
				}
				if(!dbexist)
				{
					CreateDB(connection);
				}
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{  
			try {
				resultset.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
   }
	
	public void CreateDB(Connection connection) 
	{
		Statement stmt = null;
		try {
			stmt = connection.createStatement();
			String sqlStmt = "create database JDBC_TrainingManagementSystem";
			stmt.executeUpdate(sqlStmt);
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{  
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void CreateCourseTable(Connection connection) {
	try {
	Statement stmt = connection.createStatement();
	String sqlStmt = "CREATE TABLE LOGINANDPASS"
						+ "("
						+ "USER_FIRSTNAME VARCHAR(10) NOT NULL,"
						+ "USER_LASTNAME VARCHAR(10) NOT NULL,"
						+ "USER_NRICNO VARCHAR(10) NOT NULL,"
						+ "USER_NAME VARCHAR(10) NOT NULL,"
						+ "USER_PASSWORD VARCHAR(30) NOT NULL,"
						+ "PRIMARY KEY (USER_NAME)"
						+")";
		stmt.executeUpdate(sqlStmt);
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
	
	public void SaveUserLogInDetails(Connection connection, LogInAndPass loginandpass) {
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(INSERT_QUERY);	
			ps.setString(1, loginandpass.getUserFirstName());
			ps.setString(2, loginandpass.getUserLastName());
			ps.setString(3, loginandpass.getUserNricNo());
			ps.setString(4, loginandpass.getUserName());
			ps.setString(5, loginandpass.getUserPassword());
		    ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
	public void save(LogInAndPass loginandpass) {
		Connection connection = null;
		try {
			IsDBExistIfNotCreate();
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
			DatabaseMetaData metadata = connection.getMetaData();
			ResultSet resultset = metadata.getTables(null, null, "LOGINANDPASS", null);
			if(!resultset.next())
			{
				CreateCourseTable(connection);
				SaveUserLogInDetails(connection, loginandpass);
			}
			else
			{
				SaveUserLogInDetails(connection, loginandpass);
			}
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch blockMeta
			e1.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }
	
	
	public LogInAndPass listUserLogInDetailsbyUsernricno(String user_nricno)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		LogInAndPass loginandpass = null;
		try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD); 
			 Statement stmt = connection.createStatement();
			) {
			ResultSet rs = stmt.executeQuery("select * from loginandpass where user_nricno = user_nricno");
			while (rs.next())
			{
				if(rs.getString("USER_NRICNO").equals(user_nricno))
			    {
					loginandpass = new LogInAndPass();
					loginandpass.setUserFirstName(rs.getString("USER_FIRSTNAME"));
					loginandpass.setUserLastName(rs.getString("USER_LASTNAME"));
					loginandpass.setUserNricNo(rs.getString("USER_NRICNO"));
					loginandpass.setUserName(rs.getString("USER_NAME"));
					loginandpass.setUserPassword(rs.getString("USER_PASSWORD"));
			   }	
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return loginandpass;	
	}

	public LogInAndPass listUserLogInDetailsbyUsernameandPasswd(LogInAndPass loginandpass)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String user_name = loginandpass.getUserName();
		String user_password = loginandpass.getUserPassword();
		LogInAndPass loginandpasswd = null;
		
		try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD); 
			 Statement stmt = connection.createStatement();
			) {
			ResultSet rs = stmt.executeQuery("select * from loginandpass where user_name = user_name");
			while (rs.next())
			{
				if(rs.getString("USER_NAME").equals(user_name) &&
				   rs.getString("USER_PASSWORD").equals(user_password))
			   {
					loginandpasswd = new LogInAndPass();
					loginandpasswd.setUserFirstName(rs.getString("USER_FIRSTNAME"));
					loginandpasswd.setUserLastName(rs.getString("USER_LASTNAME"));
					loginandpasswd.setUserNricNo(rs.getString("USER_NRICNO"));
					loginandpasswd.setUserName(rs.getString("USER_NAME"));
					loginandpasswd.setUserPassword(rs.getString("USER_PASSWORD"));
			   }	
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return loginandpasswd;	
	}


	public void update(LogInAndPass loginandpass)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try(
			Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
			PreparedStatement ps = connection.prepareStatement(UPDATE_QUERY);
			)	
				{
			ps.setString(1, loginandpass.getUserFirstName());
			ps.setString(2, loginandpass.getUserLastName());
			ps.setString(3, loginandpass.getUserNricNo());
		    ps.setString(4, loginandpass.getUserName());
		    ps.setString(5, loginandpass.getUserPassword());
		    ps.setString(6, loginandpass.getUserNricNo());
			ps.executeUpdate();
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
