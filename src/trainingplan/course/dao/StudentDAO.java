package trainingplan.course.dao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;


import trainingplan.course.domain.Batch;
import trainingplan.course.domain.Course;
import trainingplan.course.domain.Student;
import trainingplan.course.domain.Trainer;

public class StudentDAO {
	private static final String DB_EXIST_TEST_URL = "jdbc:mysql://localhost:3306/";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/JDBC_TrainingManagementSystem";
	private static final String DB_USER = "root";
	private static final String DB_PWD = "root";
	private static final String INSERT_QUERY = "insert into student values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String SELECT_QUERY = "select * from student";
	private static final String UPDATE_QUERY = "update student set student_id=?, student_first_name=?, student_last_name=?, gender=?, date_of_birth=?, student_mobile_no=?, parent_mobile_no=?, alt_tel_ph_no=?, email=?, student_ic_no=?, parent_ic_no=?, batch_allocation_status=?, course_title=? where student_id=?";
	private static final String DELETE_QUERY = "delete from student where student_id=?";
	
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
	
	public void CreateStudentTable(Connection connection) {
	try {
	Statement stmt = connection.createStatement();
	String sqlStmt = "CREATE TABLE student"
						+ "("
						+ "STUDENT_ID VARCHAR(30) NOT NULL,"
						+ "STUDENT_FIRST_NAME VARCHAR(30) NOT NULL,"
						+ "STUDENT_LAST_NAME VARCHAR(30) NOT NULL,"
						+ "GENDER VARCHAR(10) NOT NULL,"
						+ "DATE_OF_BIRTH DATE,"
						+ "STUDENT_MOBILE_NO VARCHAR(30),"
						+ "PARENT_MOBILE_NO VARCHAR(30),"
						+ "ALT_TEL_PH_NO VARCHAR(30),"
						+ "EMAIL VARCHAR(30),"
						+ "STUDENT_IC_NO VARCHAR(30),"
						+ "PARENT_IC_NO VARCHAR(30),"
						+ "COURSE_TITLE VARCHAR(30) NOT NULL,"
						+ "PREFERRABLE_COURSE_START_DATE DATE,"
						+ "PREFERRABLE_COURSE_END_DATE DATE,"
						+ "BATCH_ALLOCATION_STATUS VARCHAR(10) NOT NULL,"
						+ "BATCH_ID VARCHAR(10),"
						+ "BATCH_STATUS VARCHAR(20),"
						+ "TRAINER_ID VARCHAR(30),"
						+ "FIND_ABOUT_US VARCHAR(30) NOT NULL,"
						+ "REASON VARCHAR(30),"
						+ "PRIMARY KEY (STUDENT_ID)"
						+")";
		stmt.executeUpdate(sqlStmt);
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
	
	public void SaveStudentContent(Connection connection, Student student) {
		PreparedStatement ps;
		//int studentid = 0;
		try {
			ps = connection.prepareStatement(INSERT_QUERY);
			/*ps = connection.prepareStatement(INSERT_QUERY, PreparedStatement.RETURN_GENERATED_KEYS);
			int student_id=0;
			ResultSet rs = ps.getGeneratedKeys();
				while (rs.next())
				{
					System.out.println("Generated Key: "+rs.getInt(1));
					student_id = (int)rs.getInt(1);
					//student.setStudentId(student_id);
				}*/
				//studentid = student_id;*/
			String batchstatus = "NotStarted";
				//System.out.println("stduent id: "+studentid);
				ps.setString(1, student.getStudentId());
			ps.setString(2, student.getStudentFirstName());
			ps.setString(3, student.getStudentLastName());
			ps.setString(4, student.getGender());
			if (student.getDateOfBirth() != null) {
				ps.setDate(5, new java.sql.Date(student.getDateOfBirth().getTime()));
			}
			ps.setString(6, student.getStudentMobileNo());
			ps.setString(7, student.getParentMobileNo());
			ps.setString(8, student.getAltTelphNo());
			ps.setString(9, student.getEmail());
			ps.setString(10, student.getStudentICno());
			ps.setString(11, student.getParentICno());
			ps.setString(12, student.getCourseTitle());
			if ((student.getPrefCourseStartDate() != null) && (student.getPrefCourseEndDate() != null)){
				ps.setDate(13, new java.sql.Date(student.getPrefCourseStartDate().getTime()));
				ps.setDate(14, new java.sql.Date(student.getPrefCourseEndDate().getTime()));
			}
			ps.setString(15, student.getBatchAllocationStatus());
			ps.setString(16, null);
			ps.setString(17, batchstatus);
			ps.setString(18, null);
			ps.setString(19, student.getFindaboutus());
			ps.setString(20, student.getReason());
			ps.executeUpdate();
		/*	int student_id=0;
			ResultSet rs = ps.getGeneratedKeys();
				while (rs.next())
				{
					System.out.println("Generated Key: "+rs.getInt(1));
					student_id = (int)rs.getInt(1);
					studentid = Integer.valueOf(student_id);
					//student.setStudentId(student_id);
				}
				System.out.println("The value of student id: "+studentid);*/
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	
	public void save(Student student) {
		Connection connection = null;
//		BatchDAO batchDAO = new BatchDAO();

		try {
			IsDBExistIfNotCreate();
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
			DatabaseMetaData metadata = connection.getMetaData();
			ResultSet resultset = metadata.getTables(null, null, "STUDENT", null);
			if(!resultset.next())
			{
				CreateStudentTable(connection);
				SaveStudentContent(connection, student);
			//	batchDAO.save(student);
			}
			else
			{
				SaveStudentContent(connection, student);
				//batchDAO.save(student);
			}
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch blockMeta
			e1.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }
	
	public Student BatchAllocatedStudentinfo(ResultSet rs, Student student)
	{
		Course course = new Course();
		   CourseDAO courseDAO = new CourseDAO();
		   Batch batch = new Batch();
		   BatchDAO batchDAO = new BatchDAO();
		   Trainer trainer = new Trainer();
		   TrainerDAO trainerDAO = new TrainerDAO();
		   try
		   {
			   student.setStudentId(rs.getString("STUDENT_ID"));
			   student.setStudentFirstName(rs.getString("STUDENT_FIRST_NAME"));
			   student.setStudentLastName(rs.getString("STUDENT_LAST_NAME"));
			   student.setGender(rs.getString("GENDER"));
			   java.util.Date utilBirthDate = null;
				java.sql.Date sqlBirthDate = rs.getDate("DATE_OF_BIRTH");
				if (sqlBirthDate != null)
				{
					utilBirthDate = new java.util.Date(sqlBirthDate.getTime());
				}
			   student.setDateOfBirth(utilBirthDate);
			   student.setStudentMobileNo(rs.getString("STUDENT_MOBILE_NO"));
			   student.setParentMobileNo(rs.getString("PARENT_MOBILE_NO"));
			   student.setAltTelphNo(rs.getString("ALT_TEL_PH_NO"));
			   student.setEmail(rs.getString("EMAIL"));
			   student.setStudentICno(rs.getString("STUDENT_IC_NO"));
			   student.setParentICno(rs.getString("PARENT_IC_NO"));
			   student.setBatchAllocationStatus(rs.getString("BATCH_ALLOCATION_STATUS"));
			   String coursetitle = rs.getString("COURSE_TITLE");
			   String CourseId = courseDAO.getcourseId(coursetitle);
			   course = courseDAO.listcoursebyId(CourseId);
			   batch = batchDAO.listBatchById(rs.getString("BATCH_ID"));
			   trainer = trainerDAO.listtrainerbyId(rs.getString("TRAINER_ID"));
			   student.setCourse(course);
			   student.setTrainer(trainer);
			   student.setBatch(batch);
		   }catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   return student;
	}
	
	public Student BatchNotAllocatedStudentinfo(ResultSet rs, Student student)
	{
		Course course = null;
		//ArrayList<Batch> batchlist = new ArrayList<Batch>();
		   CourseDAO courseDAO = null;
		  // BatchDAO batchDAO = null;
		   try {
			   course = new Course();
			//   batchDAO = new BatchDAO();
			  // batchlist = new ArrayList<Batch>();
			   courseDAO = new CourseDAO();
			   student.setStudentId(rs.getString("STUDENT_ID"));
		 	
			student.setStudentFirstName(rs.getString("STUDENT_FIRST_NAME"));
		   student.setStudentLastName(rs.getString("STUDENT_LAST_NAME"));
		   student.setGender(rs.getString("GENDER"));
		   java.util.Date utilBirthDate = null;
			java.sql.Date sqlBirthDate = rs.getDate("DATE_OF_BIRTH");
			if (sqlBirthDate != null)
			{
				utilBirthDate = new java.util.Date(sqlBirthDate.getTime());
			}
		   student.setDateOfBirth(utilBirthDate);
		   student.setStudentMobileNo(rs.getString("STUDENT_MOBILE_NO"));
		   student.setParentMobileNo(rs.getString("PARENT_MOBILE_NO"));
		   student.setAltTelphNo(rs.getString("ALT_TEL_PH_NO"));
		   student.setEmail(rs.getString("EMAIL"));
		   student.setStudentICno(rs.getString("STUDENT_IC_NO"));
		   student.setParentICno(rs.getString("PARENT_IC_NO"));
		   
		   java.util.Date utilprefCourseStartDate = null, utilprefCourseEndDate = null;
			java.sql.Date sqlprefCourseStartDate = rs.getDate("PREFERRABLE_COURSE_START_DATE");
			java.sql.Date sqlprefCourseEndDate = rs.getDate("PREFERRABLE_COURSE_END_DATE");
			if ((sqlprefCourseStartDate != null) && (sqlprefCourseEndDate != null))
			{
				utilprefCourseStartDate = new java.util.Date(sqlprefCourseStartDate.getTime());
				utilprefCourseEndDate = new java.util.Date(sqlprefCourseEndDate.getTime());
			}
		   student.setPrefCourseStartDate(utilprefCourseStartDate);
		   student.setPrefCourseEndDate(utilprefCourseEndDate);
		   student.setBatchAllocationStatus(rs.getString("BATCH_ALLOCATION_STATUS"));
		   String coursetitle = rs.getString("COURSE_TITLE");
		   
		   String CourseId = courseDAO.getcourseId(coursetitle);
		   course = courseDAO.listcoursebyId(CourseId);
		   student.setCourse(course);
		   //batchlist = batchDAO.listBatchByCourseName(coursetitle);
		   //student.setBatchlist(batchlist);
		   //System.out.println(student.course.getCourseId());
		   } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   return student;
	}
	
	public ArrayList<Student> listStudent()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ArrayList<Student> studentList = new ArrayList<Student>();
		
		Student student = null;
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		) {
			ResultSet rs = stmt.executeQuery(SELECT_QUERY);
		    while (rs.next())
			{
				   student = new Student();
				   student = BatchNotAllocatedStudentinfo(rs, student);
				   studentList.add(student);
				   }

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return studentList;	
	}
	
	public Student listStudentbyId(String student_id)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Student student = null;
		try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD); 
			 Statement stmt = connection.createStatement();
			) {
			ResultSet rs = stmt.executeQuery("select * from student where student_id = student_id");
			while (rs.next())
			{
				 	  
					  if ((rs.getString("STUDENT_ID").equals(student_id)) && (rs.getString("BATCH_ALLOCATION_STATUS").equals("No")))  /*Batch Not allocated Student list*/
					   {
						  student = new Student();
						  student = BatchNotAllocatedStudentinfo(rs, student);
					   }
					  if ((rs.getString("STUDENT_ID").equals(student_id)) && (rs.getString("BATCH_ALLOCATION_STATUS").equals("Yes")))  /*Batch allocated Student list*/
					   {
						  student = new Student();
						  student = BatchAllocatedStudentinfo(rs, student);
					   }
		   }

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return student;	
	}
	
	
	public Student listStudentbyIdToAllocateBatch(String student_id)
	{
		Student student = new Student();
		student = listStudentbyId(student_id);
		BatchDAO batchDAO = new BatchDAO(); 
	    ArrayList<Batch> batchlist = batchDAO.listBatchByCourseName(student.course.getCourseName());
	    student.setBatchlist(batchlist);
		TrainerDAO trainerDAO = new TrainerDAO();
		ArrayList<Trainer> trainers = trainerDAO.listTrainerWhereAvailStatusIsFree(student.course.getCourseName());
		student.setTrainers(trainers);
		return student;	
	}
	
/*When student submit "Resume Batch" button in Batchhaltedstudentlist*/	
	public Student ResumeStudentBatchHalted(String student_id)
	{
		Student student = new Student();
		student = listStudentbyIdToAllocateBatch(student_id);
		Batch batch = new Batch();
		BatchDAO batchDAO = new BatchDAO();
		batch = batchDAO.listBatchById(student.batch.getBatchId());
		student.setBatch(batch);
		Trainer trainer = new Trainer();
		TrainerDAO trainerDAO = new TrainerDAO();
		trainer = trainerDAO.listtrainerbyId(student.trainer.getTrainerId());
		student.setTrainer(trainer);
		return student;	
	}

	public void update(Student student)
	{
	//	BatchDAO batchDAO;
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
			
		//	batchDAO = new BatchDAO();
			ps.setString(1, student.getStudentId());
			ps.setString(2, student.getStudentFirstName());
			ps.setString(3, student.getStudentLastName());
			ps.setString(4, student.getGender());
			if (student.getDateOfBirth() != null)  {
				ps.setDate(5, new java.sql.Date(student.getDateOfBirth().getTime())); 
			}
			ps.setString(6, student.getStudentMobileNo());
			ps.setString(7, student.getParentMobileNo());
			ps.setString(8, student.getAltTelphNo());
			ps.setString(9, student.getEmail());
			ps.setString(10, student.getStudentICno());
			ps.setString(11, student.getParentICno());
			ps.setString(12, student.getBatchAllocationStatus());
			ps.setString(13, student.getCourseTitle());
			ps.setString(14, student.getStudentId());
			ps.executeUpdate();
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public void updateBatchAndTrainerDetails(Student student)
	{
		BatchDAO batchDAO;
		TrainerDAO trainerDAO;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try(
			Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
			PreparedStatement ps = connection.prepareStatement("update student set batch_allocation_status = ?, batch_id = ?,  batch_status = ?, trainer_id = ? where student_id = ?");
			)	
				{
			batchDAO = new BatchDAO();
			trainerDAO = new TrainerDAO();
			ps.setString(1, student.getBatchAllocationStatus());
			ps.setString(2, student.batch.getBatchId());
			ps.setString(3, student.batch.getBatchStatus());
			ps.setString(4, student.trainer.getTrainerId());
			ps.setString(5, student.getStudentId());
			batchDAO.updateBatchStatus(student);
			trainerDAO.updateTrainerStatus(student);
			ps.executeUpdate();
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	/*When user press "Edit" button in listbatch*/
	public Student listStudentsToUpdateBatchStatus(Batch batch, String trainer_status)
	{
		String batch_id = batch.getBatchId();
		Student student = null;
		Trainer trainer = null;
		String student_id;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD); 
			 Statement stmt = connection.createStatement();
			) {
			ResultSet rs = stmt.executeQuery("select * from student where batch_id = batch_id");
			while (rs.next())
			{
				  if (rs.getString("BATCH_ID").equals(batch_id))  
				   {
					  trainer = new Trainer(batch.trainer.getTrainerId(), trainer_status);
					  student_id = rs.getString("STUDENT_ID");
					  student = new Student(student_id, trainer, batch);
					  updateBatchStatusAndTrainerIdForEachStudent(student);
				   }
			   }

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return student;
	}


		
	public void listBatchStatusForEachStudent(Batch batch)
	{
		String batch_id = batch.getBatchId();
		Student student = null;
		String student_id;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD); 
			 Statement stmt = connection.createStatement();
			) {
			ResultSet rs = stmt.executeQuery("select * from student where batch_id = batch_id");
			while (rs.next())
			{
				  if (rs.getString("BATCH_ID").equals(batch_id))  
				   {
					  student = new Student();
					  student_id = rs.getString("STUDENT_ID");
					  student = new Student(student_id, batch);
					  updateBatchStatusForEachStudent(student);
				   }
		   }

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	public void updateBatchStatusForEachStudent(Student student)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try(
			Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
			PreparedStatement ps = connection.prepareStatement("update student set batch_id = ?,  batch_status = ? where student_id = ?");
			)	
		{  
			ps.setString(1, student.batch.getBatchId());
			ps.setString(2, student.batch.getBatchStatus());
			ps.setString(3, student.getStudentId());
			ps.executeUpdate();
           
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public void updateBatchStatusAndTrainerIdForEachStudent(Student student)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try(
			Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
			PreparedStatement ps = connection.prepareStatement("update student set batch_id = ?,  batch_status = ?, trainer_id = ? where student_id = ?");
			)	
		{  
			ps.setString(1, student.batch.getBatchId());
			ps.setString(2, student.batch.getBatchStatus());
			ps.setString(3, student.trainer.getTrainerId());
			ps.setString(4, student.getStudentId());
			ps.executeUpdate();
           
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Student> BatchHaltedStudentList(String BatchAllocationStatus, String BatchStatus)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ArrayList<Student> studentList = new ArrayList<Student>();
		
		
		Student student = null;
		
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		) {
			ResultSet rs = stmt.executeQuery(SELECT_QUERY);
		    while (rs.next())
			{
				   if ((rs.getString("BATCH_ALLOCATION_STATUS").equals("Yes")) && 
					   (BatchAllocationStatus.equals("Yes")) &&
					    (rs.getString("BATCH_STATUS").equals(BatchStatus)))  
				   {
					   student = new Student();
					   student = BatchAllocatedStudentinfo(rs, student);
					   studentList.add(student);
				   }
		    }

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return studentList;	

	}
	
	public ArrayList<Student> BatchCompletedStudentList(String BatchAllocationStatus, String BatchStatus)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ArrayList<Student> studentList = new ArrayList<Student>();
		
		
		Student student = null;
		
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		) {
			ResultSet rs = stmt.executeQuery(SELECT_QUERY);
		    while (rs.next())
			{
				   if ((rs.getString("BATCH_ALLOCATION_STATUS").equals("Yes")) && 
					   (BatchAllocationStatus.equals("Yes")) &&
					   (rs.getString("BATCH_STATUS").equals(BatchStatus)))  
				   {
					   student = new Student();
					   student = BatchAllocatedStudentinfo(rs, student);
					   studentList.add(student);
				   }
		    }

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return studentList;	

	}
	
	public ArrayList<Student> BatchAllocatedOrNotStudentList(String BatchAllocationStatus, String BatchStatus)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ArrayList<Student> studentList = new ArrayList<Student>();
		
		
		Student student = null;
		
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		) {
			ResultSet rs = stmt.executeQuery(SELECT_QUERY);
		    while (rs.next())
			{
				   if ((rs.getString("BATCH_ALLOCATION_STATUS").equals("No")) && 
					   (BatchAllocationStatus.equals("No")))   
				   {
					   student = new Student();
					   student = BatchNotAllocatedStudentinfo(rs, student);
					   studentList.add(student);
				   }
				   else if ((rs.getString("BATCH_ALLOCATION_STATUS").equals("Yes")) && 
					   (BatchAllocationStatus.equals("Yes")) &&
					   (rs.getString("BATCH_STATUS").equals(BatchStatus))) 
				   {
					   student = new Student();
					   student = BatchAllocatedStudentinfo(rs, student);
					   studentList.add(student);
				   }
		    }

		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		return studentList;	
	}

	public void delete(String student_id)
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
			//BatchDAO batchDAO = new BatchDAO();
			ps.setString(1, student_id);
			//batchDAO.delete(student_id);
			ps.executeUpdate();
			
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

	
}
