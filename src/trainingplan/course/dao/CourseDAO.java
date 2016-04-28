package trainingplan.course.dao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import trainingplan.course.domain.Course;

public class CourseDAO {
	private static final String DB_EXIST_TEST_URL = "jdbc:mysql://localhost:3306/";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/JDBC_TrainingManagementSystem";
	private static final String DB_USER = "root";
	private static final String DB_PWD = "root";
	private static final String INSERT_QUERY = "insert into course values (?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String SELECT_QUERY = "select * from course";
	//private static final String SELECT_QUERY_ID = "select * from course where course_id = ?";
	private static final String UPDATE_QUERY = "update course set course_id=?, course_name=?, course_session=?, course_conducting_on_day1=?, course_conducting_on_day2=?, course_conducting_on_day3=?, course_conducting_on_day4=?, course_conducting_on_day5=?, course_conducting_on_day6=?, course_conducting_on_day7=?, course_start_date=?, course_end_date=? where course_id=?";
	private static final String DELETE_QUERY = "delete from course where course_id=?";
	
	
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
	String sqlStmt = "CREATE TABLE COURSE"
						+ "("	
						+ "COURSE_ID VARCHAR(10) NOT NULL,"
						+ "COURSE_NAME VARCHAR(30) NOT NULL,"
						+ "COURSE_SESSION VARCHAR(30),"
						+ "COURSE_CONDUCTING_ON_DAY1 VARCHAR(30),"
						+ "COURSE_CONDUCTING_ON_DAY2 VARCHAR(30),"
						+ "COURSE_CONDUCTING_ON_DAY3 VARCHAR(30),"
						+ "COURSE_CONDUCTING_ON_DAY4 VARCHAR(30),"
						+ "COURSE_CONDUCTING_ON_DAY5 VARCHAR(30),"
						+ "COURSE_CONDUCTING_ON_DAY6 VARCHAR(30),"
						+ "COURSE_CONDUCTING_ON_DAY7 VARCHAR(30),"
						+ "COURSE_START_DATE DATE,"
						+ "COURSE_END_DATE DATE,"
						+ "PRIMARY KEY (COURSE_ID)"
						+")";
		stmt.executeUpdate(sqlStmt);
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
	
	
	public String getcourseId(String course_name)
	{
		String courseid = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD); 
			 Statement stmt = connection.createStatement();
			) {
			ResultSet rs = stmt.executeQuery("select * from course where course_name = course_name");
			while (rs.next())
			{
				String getcoursename = rs.getString("COURSE_NAME");
				if(getcoursename.equals(course_name))
				   {
				   	   courseid = rs.getString("COURSE_ID");
				   	}	
			}
		}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return courseid;
	}
	
	public void SaveCourseContent(Connection connection, Course course) {
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(INSERT_QUERY);	 
			ps.setString(1, course.getCourseId());
			ps.setString(2, course.getCourseName());
		/*	ps.setString(3, null);
			ps.setString(4, null);
			ps.setString(5, null);
			ps.setString(6, null);
			ps.setString(7, null);
			ps.setString(8, null);
			ps.setString(9, null);
			ps.setString(10, null);
			ps.setDate(11, null);
			ps.setDate(12, null);*/
			ps.setString(3, course.getCourseSession());
			String[] CourseConductingOn  = course.getCourseConductingOn();
			int size =  CourseConductingOn.length;
			String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
			String[] temp = new String[7];
			int i, j, k;
			String found = "false";
			
		/*	for (i = 0, j = 4; i < size && j < 11; i++, j++)
			{
				if (CourseConductingOn[i].equals("AllDays"))
				{
					for (tmp = j, k = 0; tmp < 11 && k < 7; tmp++, k++)
					{
						ps.setString(tmp, days[k]);
					}
					j = tmp;
				}
			}*/
			
			for (i = 0; i < days.length; i++)
			{
				for (j = 0; j < size; j++)
				{
					if (CourseConductingOn[j].equals("AllDays"))
					{
						found = "true";
						for (k = 0; k < days.length; k++)
						{
							temp[k] = days[k];
						}
					}
					else if (days[i].equals(CourseConductingOn[j]))
					{
						temp[i] = CourseConductingOn[j];
						found = "true";
						break;
					}
					else
					{
						found = "false";
					}
				}
				if (found.equals("false"))
				{
					temp[i] = " ";
				}
			}
			for (i = 0, j = 4; j < 11 && i < temp.length; i++, j++)
			{
				ps.setString(j, temp[i]);
			}
		/*	do
			{
				for (i = 0, j = 4; i < size && j < 11; i++, j++)
				{
					if (CourseConductingOn[i].equals("AllDays"))
					{
						for (temp = j, k = 0; temp < 11 && k < 7; temp++, k++)
						{
							ps.setString(temp, days[k]);
						}
						j = temp;
					}
					else
						ps.setString(j, CourseConductingOn[i]);
				}
				while(j < 11)
				{
					ps.setString(j, " ");
					j++;
				}				
			}while (i < size && j < 11);*/
			if ((course.getCourseStartDate() != null) && (course.getCourseEndDate() != null)) {
				ps.setDate(11, new java.sql.Date(course.getCourseStartDate().getTime()));
				ps.setDate(12, new java.sql.Date(course.getCourseEndDate().getTime()));
			} 
			ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public void save(Course course) {
		Connection connection = null;
		try {
			IsDBExistIfNotCreate();
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
			DatabaseMetaData metadata = connection.getMetaData();
			ResultSet resultset = metadata.getTables(null, null, "COURSE", null);
			if(!resultset.next())
			{
				CreateCourseTable(connection);
				SaveCourseContent(connection, course);
			}
			else
			{
				SaveCourseContent(connection, course);
			}
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch blockMeta
			e1.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }
	
		
	
	public ArrayList<Course> listCourse()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ArrayList<Course> courseList = new ArrayList<Course>();
		
		//String[] temp = new String[7];
		Course course = null;
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		) {

			ResultSet rs = stmt.executeQuery(SELECT_QUERY);

			while (rs.next())
			{
					
				  course = new Course();
				   String[] Days = new String[7];
				   course.setCourseId(rs.getString("COURSE_ID"));
				   course.setCourseName(rs.getString("COURSE_NAME"));
				   course.setCourseSession(rs.getString("COURSE_SESSION"));
				  // String test = "COURSE_NOT_SCHEDULED";
				   
					Days[0] = rs.getString("COURSE_CONDUCTING_ON_DAY1");
					Days[1] = rs.getString("COURSE_CONDUCTING_ON_DAY2");
					Days[2] = rs.getString("COURSE_CONDUCTING_ON_DAY3");
					Days[3] = rs.getString("COURSE_CONDUCTING_ON_DAY4");
					Days[4] = rs.getString("COURSE_CONDUCTING_ON_DAY5");
					Days[5] = rs.getString("COURSE_CONDUCTING_ON_DAY6");
					Days[6] = rs.getString("COURSE_CONDUCTING_ON_DAY7");
					
				    course.setCourseConductingOn(Days);
					
				java.util.Date utilStartDate = null, utilEndDate = null;
				java.sql.Date sqlStartDate = rs.getDate("COURSE_START_DATE");
				java.sql.Date sqlEndDate = rs.getDate("COURSE_END_DATE");
				if ((sqlStartDate != null) && (sqlEndDate != null))
				{
					utilStartDate = new java.util.Date(sqlStartDate.getTime());
					utilEndDate = new java.util.Date(sqlEndDate.getTime());
				}
				course.setCourseStartDate(utilStartDate);
				course.setCourseEndDate(utilEndDate);
			
				courseList.add(course);
				}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return courseList;	
	}
	

	public void delete(String course_id)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); 
				PreparedStatement ps = connection
						.prepareStatement(DELETE_QUERY);

		) {
			ps.setString(1, course_id);
			ps.executeUpdate();
			
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}


public Course listcoursebyId(String course_id)
{
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	Course course = null;
	try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD); 
		 Statement stmt = connection.createStatement();
		) {
		ResultSet rs = stmt.executeQuery("select * from course where course_id = course_id");
		while (rs.next())
		{
			String getcourseid = rs.getString("COURSE_ID");
			if(getcourseid.equals(course_id))
			{
				course = new Course();
			   String[] Days = new String[7];
			   
				   course.setCourseId(rs.getString("COURSE_ID"));
				   course.setCourseName(rs.getString("COURSE_NAME"));
				   course.setCourseSession(rs.getString("COURSE_SESSION"));
					Days[0] = rs.getString("COURSE_CONDUCTING_ON_DAY1");
					Days[1] = rs.getString("COURSE_CONDUCTING_ON_DAY2");
					Days[2] = rs.getString("COURSE_CONDUCTING_ON_DAY3");
					Days[3] = rs.getString("COURSE_CONDUCTING_ON_DAY4");
					Days[4] = rs.getString("COURSE_CONDUCTING_ON_DAY5");
					Days[5] = rs.getString("COURSE_CONDUCTING_ON_DAY6");
					Days[6] = rs.getString("COURSE_CONDUCTING_ON_DAY7");
					
			        course.setCourseConductingOn(Days);
					
				java.util.Date utilStartDate = null, utilEndDate = null;
				java.sql.Date sqlStartDate = rs.getDate("COURSE_START_DATE");
				java.sql.Date sqlEndDate = rs.getDate("COURSE_END_DATE");
				if ((sqlStartDate != null) && (sqlEndDate != null))
				{
					utilStartDate = new java.util.Date(sqlStartDate.getTime());
					utilEndDate = new java.util.Date(sqlEndDate.getTime());
				}
				course.setCourseStartDate(utilStartDate);
				course.setCourseEndDate(utilEndDate);
			   }	
		}

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return course;	
}


public void update(Course course)
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
		ps.setString(1, course.getCourseId());
		ps.setString(2, course.getCourseName());
		ps.setString(3, course.getCourseSession());
		String[] CourseConductingOn  = course.getCourseConductingOn();
		int size =  CourseConductingOn.length;
		String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
		String[] temp = new String[7];
		int i, j, k;
		String found = "false";
		
		/*for (i = 0, j = 4; i < size && j < 11; i++, j++)
		{
			if (CourseConductingOn[i].equals("AllDays"))
			{
				for (tmp = j, k = 0; tmp < 11 && k < 7; tmp++, k++)
				{
					ps.setString(tmp, days[k]);
				}
				j = tmp;
			}
		}*/
		
		for (i = 0; i < days.length; i++)
		{
			for (j = 0; j < size; j++)
			{
				if (CourseConductingOn[j].equals("AllDays"))
				{
					found = "true";
					for (k = 0; k < days.length; k++)
					{
						temp[k] = days[k];
					}
				}
				else if (days[i].equals(CourseConductingOn[j]))
				{
					temp[i] = CourseConductingOn[j];
					found = "true";
					break;
				}
				else
				{
					found = "false";
				}
			}
			if (found.equals("false"))
			{
				temp[i] = " ";
			}
		}
		for (i = 0, j = 4; j < 11 && i < temp.length; i++, j++)
		{
			ps.setString(j, temp[i]);
		}
		
		
		/*do
		{
			for (i = 0, j = 4; i < size && j < 11; i++, j++)
			{
				if (CourseConductingOn[i].equals("AllDays"))
				{
					for (temp = j, k = 0; temp < 11 && k < 7; temp++, k++)
					{
						ps.setString(temp, days[k]);
					}
					j = temp;
				}
				else
					ps.setString(j, CourseConductingOn[i]);
			}
			while(j < 11)
			{
				ps.setString(j, " ");
				j++;
			}				
		}while (i < size && j < 11); */
		if ((course.getCourseStartDate() != null) && (course.getCourseEndDate() != null)) {
			ps.setDate(11, new java.sql.Date(course.getCourseStartDate().getTime())); /*
																	 * second
																	 * parameter
																	 * should
																	 * be
								         							 * of
																	 * type
																	 * java
																	 * .
																	 * sql
																	 * .
																	 * date
																	 */
			ps.setDate(12, new java.sql.Date(course.getCourseEndDate().getTime()));
		}
		ps.setString(13, course.getCourseId());
		ps.executeUpdate();
		
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

}
