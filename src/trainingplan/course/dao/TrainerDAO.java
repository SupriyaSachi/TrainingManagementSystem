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
import trainingplan.course.domain.Student;
import trainingplan.course.domain.Trainer;

public class TrainerDAO {
	private static final String DB_EXIST_TEST_URL = "jdbc:mysql://localhost:3306/";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/JDBC_TrainingManagementSystem";
	private static final String DB_USER = "root";
	private static final String DB_PWD = "root";
	private static final String INSERT_QUERY = "insert into trainer values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String SELECT_QUERY = "select * from trainer";
	private static final String UPDATE_QUERY = "update trainer set trainer_id=?, trainer_first_name=?, trainer_last_name=?, gender=?, date_of_birth=?, mobile_no=?, alt_tel_ph_no=?, email=?, trainer_ic_no=?, availability=?, trainer_status=?, trainer_joining_date=?, trainer_work_status=? where trainer_id=?";
	private static final String UPDATE_DATE_QUERY = "update trainer set trainer_id=?, trainer_first_name=?, trainer_last_name=?, gender=?, date_of_birth=?, mobile_no=?, alt_tel_ph_no=?, email=?, trainer_ic_no=?, availability=?, trainer_status=?, trainer_joining_date=?, trainer_relieving_date=?, trainer_work_status=? where trainer_id=?";
//	private static final String UPDATE_QUERY_TSTATUS = "update trainer set trainer_status=? where trainer_id=?";
	private static final String DELETE_QUERY = "delete from trainer where trainer_id=?";
//	private static final String DELETE_CHILLD_QUERY = "delete * from trainer inner join trainerspecialisation on trainer.trainer_id = trainerspecialisation.trainer_id";
	
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
	
	public void CreateTrainerTable(Connection connection) {
	try {
	Statement stmt = connection.createStatement();
		String sqlStmt = "CREATE TABLE Trainer"
						+ "("	
						+ "TRAINER_ID VARCHAR(10) NOT NULL,"
						+ "TRAINER_FIRST_NAME VARCHAR(30) NOT NULL,"
						+ "TRAINER_LAST_NAME VARCHAR(30),"
						+ "GENDER VARCHAR(30),"
						+ "DATE_OF_BIRTH DATE,"
						+ "MOBILE_NO VARCHAR(30) UNIQUE,"
						+ "ALT_TEL_PH_NO VARCHAR(30),"
						+ "EMAIL VARCHAR(30),"
						+ "TRAINER_IC_NO VARCHAR(30),"
						+ "AVAILABILITY VARCHAR(30),"
						+ "TRAINER_STATUS VARCHAR(30),"
						+ "TRAINER_JOINING_DATE DATE,"
						+ "TRAINER_RELIEVING_DATE DATE,"
						+ "TRAINER_WORK_STATUS VARCHAR(30),"
						+ "PRIMARY KEY (TRAINER_ID)"
						+")";
		stmt.executeUpdate(sqlStmt);
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
	
	public void CreateTrainerSpecialisationTable(Connection connection)
	{
		try {
			Statement stmt = connection.createStatement();
				String sqlStmt = "CREATE TABLE TrainerSpecialisation"
								+ "("	
								+ "TS_ID INT NOT NULL AUTO_INCREMENT,"
								+ "TRAINER_ID VARCHAR(10) REFERENCES Trainer(TRAINER_ID) ON DELETE CASCADE ON UPDATE CASCADE,"
								+ "TRAINER_SPECIALIZATION VARCHAR(30) NOT NULL,"
								+ "PRIMARY KEY (TS_ID)"
								+")";
				stmt.executeUpdate(sqlStmt);
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
	public void SaveTrainerContent(Connection connection, Trainer trainer) {
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(INSERT_QUERY);	 
			ps.setString(1, trainer.getTrainerId());
			ps.setString(2, trainer.getTrainerFirstName());
			ps.setString(3, trainer.getTrainerLastName());
			ps.setString(4, trainer.getGender());
			if (trainer.getDateOfBirth() != null)
			{
				ps.setDate(5, new java.sql.Date(trainer.getDateOfBirth().getTime()));
			}
			ps.setString(6, trainer.getMobileNo());
			ps.setString(7, trainer.getAltTelphNo());
			ps.setString(8, trainer.getEmail());
			ps.setString(9, trainer.getTrainerICno());
			ps.setString(10, trainer.getAvailability());
			ps.setString(11, trainer.getTrainerStatus());
			if (trainer.getTrainerJoiningDate() != null) 
			{
				ps.setDate(12, new java.sql.Date(trainer.getTrainerJoiningDate().getTime()));
			}
			ps.setString(13, null);
			ps.setString(14, trainer.getTrainerWorkStatus());
			ps.executeUpdate();
			String[] Specialization = trainer.getTrainerSpecialization();
		
			int i, size = trainer.getTrainerSpecialization().length;
			
			for (i = 0; i< size; i++)
			{
				SaveTrainerSpecialisationContent(connection, trainer.getMobileNo(), Specialization[i]);
			}
		
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public void SaveTrainerSpecialisationContent(Connection connection, String trainer_mob, String spec) 
	{
		PreparedStatement ps;
		String sql = "insert into trainerspecialisation values (?, (select TRAINER_ID from trainer where mobile_no=?), ?)";
		try {
			ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
				int ts_id=0;
			ResultSet rs = ps.getGeneratedKeys();
				while (rs.next())
				{
					ts_id = (int)rs.getInt(1);
				}
				ps.setInt(1, ts_id);
				ps.setString(2, trainer_mob);
				ps.setString(3, spec);
				ps.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void save(Trainer trainer) {
		Connection connection = null;
		try {
			IsDBExistIfNotCreate();
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
			DatabaseMetaData metadata = connection.getMetaData();
			ResultSet resultset = metadata.getTables(null, null, "Trainer", null);
			if(!resultset.next())
			{
				CreateTrainerTable(connection);
				CreateTrainerSpecialisationTable(connection);
				SaveTrainerContent(connection, trainer);
			}
			else
			{
				SaveTrainerContent(connection, trainer);
			}
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch blockMeta
			e1.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }
	
	public ArrayList<String> listTrainerSpecialisation(String id)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ArrayList<String> myspeclist = new ArrayList<String>();
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		){
			ResultSet rs = stmt.executeQuery("select * from trainer inner join trainerspecialisation on trainer.trainer_id = trainerspecialisation.trainer_id");
			
			while (rs.next())
			{
				if (rs.getString("TRAINER_ID").equals(id) )
				{
					myspeclist.add(rs.getString("TRAINER_SPECIALIZATION"));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return myspeclist;
	}
	
	public ArrayList<Trainer> listTrainer()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ArrayList<Trainer> trainerList = new ArrayList<Trainer>();
		
		Trainer trainer= null;
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		) {

			ResultSet rs = stmt.executeQuery(SELECT_QUERY);
			while (rs.next())
			{
				String TrainerWorkStatus = rs.getString("TRAINER_WORK_STATUS");
				if (TrainerWorkStatus.equals("Employed"))
				{
				   trainer = new Trainer();
				   String trainerid = rs.getString("TRAINER_ID");
				   trainer.setTrainerId(rs.getString("TRAINER_ID"));
				   trainer.setTrainerFirstName(rs.getString("TRAINER_FIRST_NAME"));
				   trainer.setTrainerLastName(rs.getString("TRAINER_LAST_NAME"));
				   trainer.setGender(rs.getString("GENDER"));
				   java.util.Date utilBirthDate = null;
					java.sql.Date sqlBirthDate = rs.getDate("DATE_OF_BIRTH");
					if (sqlBirthDate != null)
					{
						utilBirthDate = new java.util.Date(sqlBirthDate.getTime());
					}
					trainer.setDateOfBirth(utilBirthDate);
				   trainer.setMobileNo(rs.getString("MOBILE_NO"));
				   trainer.setAltTelphNo(rs.getString("ALT_TEL_PH_NO"));
				   trainer.setEmail(rs.getString("EMAIL"));
				   trainer.setTrainerICno(rs.getString("TRAINER_IC_NO"));
				   trainer.setAvailability(rs.getString("AVAILABILITY"));
				   trainer.setTrainerStatus(rs.getString("TRAINER_STATUS"));
				   java.util.Date utilJoiningDate = null;
					java.sql.Date sqlJoiningDate = rs.getDate("TRAINER_JOINING_DATE");
					if (sqlJoiningDate != null)
					{
						utilJoiningDate = new java.util.Date(sqlJoiningDate.getTime());
					}
					trainer.setTrainerJoiningDate(utilJoiningDate);
				   trainer.setTrainerWorkStatus(rs.getString("TRAINER_WORK_STATUS"));
				   ArrayList<String> myspeclist = new ArrayList<String>();
				   myspeclist = listTrainerSpecialisation(trainerid);
				   String[] specialization = new String[myspeclist.size()];
				   specialization = myspeclist.toArray(specialization);
					
				   trainer.setTrainerSpecialization(specialization);
					trainerList.add(trainer);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return trainerList;	
	}


	public ArrayList<Trainer> listTrainerWhereTrainerWorkStatusIsLeft()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ArrayList<Trainer> trainerList = new ArrayList<Trainer>();
		
		Trainer trainer= null;
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		) {

			ResultSet rs = stmt.executeQuery(SELECT_QUERY);
			while (rs.next())
			{
				String TrainerWorkStatus = rs.getString("TRAINER_WORK_STATUS");
				if (TrainerWorkStatus.equals("Left"))
				{
				   trainer = new Trainer();
				   String trainerid = rs.getString("TRAINER_ID");
				   trainer.setTrainerId(rs.getString("TRAINER_ID"));
				   trainer.setTrainerFirstName(rs.getString("TRAINER_FIRST_NAME"));
				   trainer.setTrainerLastName(rs.getString("TRAINER_LAST_NAME"));
				   trainer.setGender(rs.getString("GENDER"));
				   java.util.Date utilBirthDate = null;
					java.sql.Date sqlBirthDate = rs.getDate("DATE_OF_BIRTH");
					if (sqlBirthDate != null)
					{
						utilBirthDate = new java.util.Date(sqlBirthDate.getTime());
					}
					 trainer.setDateOfBirth(utilBirthDate);
				   trainer.setMobileNo(rs.getString("MOBILE_NO"));
				   trainer.setAltTelphNo(rs.getString("ALT_TEL_PH_NO"));
				   trainer.setEmail(rs.getString("EMAIL"));
				   trainer.setTrainerICno(rs.getString("TRAINER_IC_NO"));
				   trainer.setAvailability(rs.getString("AVAILABILITY"));
				   trainer.setTrainerStatus(rs.getString("TRAINER_STATUS"));
				   java.util.Date utilJoiningDate = null, utilRelievingDate = null;
					java.sql.Date sqlJoiningDate = rs.getDate("TRAINER_JOINING_DATE");
					java.sql.Date sqlRelievingDate = rs.getDate("TRAINER_RELIEVING_DATE");
					if (sqlJoiningDate != null && sqlRelievingDate != null)
					{
						utilJoiningDate = new java.util.Date(sqlJoiningDate.getTime());
						utilRelievingDate = new java.util.Date(sqlRelievingDate.getTime());
					}
					trainer.setTrainerJoiningDate(utilJoiningDate);
					trainer.setTrainerRelievingDate(utilRelievingDate);
				   trainer.setTrainerWorkStatus(rs.getString("TRAINER_WORK_STATUS"));
					
				   ArrayList<String> myspeclist = new ArrayList<String>();
				   myspeclist = listTrainerSpecialisation(trainerid);
				   String[] specialization = new String[myspeclist.size()];
				   specialization = myspeclist.toArray(specialization);
					
				   trainer.setTrainerSpecialization(specialization);
					trainerList.add(trainer);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return trainerList;	
	}

	
	public ArrayList<Trainer> listTrainerWhereAvailStatusIsFree(String coursename)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ArrayList<Trainer> trainerList = new ArrayList<Trainer>();
		
		Trainer trainer= null;
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		) {

			ResultSet rs = stmt.executeQuery(SELECT_QUERY);
			while (rs.next())
			{
				String TrainerStatus = rs.getString("TRAINER_STATUS");
				String TrainerWorkStatus = rs.getString("TRAINER_WORK_STATUS");
				if ((TrainerWorkStatus.equals("Employed")) &&
				    ((TrainerStatus.equals("Free")) ||
				     (TrainerStatus.equals("Occupied"))))
			//	if (TrainerWorkStatus.equals("Employed"))
				{
					ArrayList<String> myspeclist = new ArrayList<String>();
					myspeclist = listTrainerSpecialisation(rs.getString("TRAINER_ID"));
					if(myspeclist.contains(coursename))
					{
						trainer = new Trainer();
					    String[] specialization = new String[myspeclist.size()];
						 specialization = myspeclist.toArray(specialization);
					    
						trainer.setTrainerSpecialization(specialization);
						trainer.setTrainerId(rs.getString("TRAINER_ID"));
					   trainer.setTrainerFirstName(rs.getString("TRAINER_FIRST_NAME"));
					   trainer.setTrainerLastName(rs.getString("TRAINER_LAST_NAME"));
					   trainer.setGender(rs.getString("GENDER"));
					   java.util.Date utilBirthDate = null;
						java.sql.Date sqlBirthDate = rs.getDate("DATE_OF_BIRTH");
						if (sqlBirthDate != null)
						{
							utilBirthDate = new java.util.Date(sqlBirthDate.getTime());
						}
						trainer.setDateOfBirth(utilBirthDate);
					   trainer.setMobileNo(rs.getString("MOBILE_NO"));
					   trainer.setAltTelphNo(rs.getString("ALT_TEL_PH_NO"));
					   trainer.setEmail(rs.getString("EMAIL"));
					   trainer.setTrainerICno(rs.getString("TRAINER_IC_NO"));
					   trainer.setAvailability(rs.getString("AVAILABILITY"));
					   trainer.setTrainerStatus(rs.getString("TRAINER_STATUS"));	
					   trainer.setTrainerWorkStatus(rs.getString("TRAINER_WORK_STATUS"));
					trainerList.add(trainer);
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return trainerList;	
	}

	
	
	public void deletechildtable(int ts_id)
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
						.prepareStatement("delete from trainerspecialisation where ts_id=?");

		) {
			ps.setInt(1, ts_id);
			
			ps.executeUpdate();
			
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

	
	public void deleteTrainerSpecialisation(String trainer_id)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		){
			ResultSet rs = stmt.executeQuery("select * from trainer inner join trainerspecialisation on trainer.trainer_id = trainerspecialisation.trainer_id");
			
			while (rs.next())
			{
				if (rs.getString("TRAINER_ID").equals(trainer_id) )
				{
					deletechildtable(rs.getInt("TS_ID"));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
		
	public void delete(String trainer_id)
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
			ps.setString(1, trainer_id);
			deleteTrainerSpecialisation(trainer_id);
			ps.executeUpdate();
			
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}



public Trainer listtrainerbyId(String trainer_id)
{
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	Trainer trainer = null;
	try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD); 
		 Statement stmt = connection.createStatement();
		) {
		ResultSet rs = stmt.executeQuery("select * from trainer where trainer_id = trainer_id");
		while (rs.next())
		{
			String gettrainerid = rs.getString("TRAINER_ID");
			if(gettrainerid.equals(trainer_id))
			   {
				trainer = new Trainer();
				 trainer.setTrainerId(rs.getString("TRAINER_ID"));
				   trainer.setTrainerFirstName(rs.getString("TRAINER_FIRST_NAME"));
				   trainer.setTrainerLastName(rs.getString("TRAINER_LAST_NAME"));
				   trainer.setGender(rs.getString("GENDER"));
				   trainer.setMobileNo(rs.getString("MOBILE_NO"));
				   trainer.setAltTelphNo(rs.getString("ALT_TEL_PH_NO"));
				   trainer.setTrainerICno(rs.getString("TRAINER_IC_NO"));
				   trainer.setEmail(rs.getString("EMAIL"));
				   trainer.setAvailability(rs.getString("AVAILABILITY"));
				   trainer.setTrainerStatus(rs.getString("TRAINER_STATUS"));
				   trainer.setTrainerWorkStatus(rs.getString("TRAINER_WORK_STATUS"));
					java.util.Date utilBirthDate = null;
					java.sql.Date sqlBirthDate = rs.getDate("DATE_OF_BIRTH");
					if (sqlBirthDate != null)
					{
						utilBirthDate = new java.util.Date(sqlBirthDate.getTime());
					}
					trainer.setDateOfBirth(utilBirthDate);
					java.util.Date utilJoiningDate = null;
					java.sql.Date sqlJoiningDate = rs.getDate("TRAINER_JOINING_DATE");
					if (sqlJoiningDate != null)
					{
						utilJoiningDate = new java.util.Date(sqlJoiningDate.getTime());
					}
					trainer.setTrainerJoiningDate(utilJoiningDate);
					ArrayList<String> myspeclist = new ArrayList<String>();
					   myspeclist = listTrainerSpecialisation(gettrainerid);
					   String[] specialization = new String[myspeclist.size()];
					   specialization = myspeclist.toArray(specialization);
					   CourseDAO courseDAO = new CourseDAO();
					   ArrayList<Course> courseList = new ArrayList<Course>();
					   courseList = courseDAO.listCourse();
					   String[] spec = new String[courseList.size()];
					   for (int i = 0; i < courseList.size(); i++)
		       	   		{ 
		       	        	Course course = (Course) courseList.get(i);
		       	        	spec[i] = course.getCourseName();
		       	        }
						
					   
						int length = specialization.length; 
				          int size = spec.length;
				          
				          
				          int j=0, i = 0, k=0;
				          String[] Trainerspec = new String[size];
				   
				          for (i = 0, j = 0, k = 0; i < length && j<size; j++,k++)
				          {
				        	  if (specialization[i].equals(spec[j]))
				        	  {
				        		  Trainerspec[k] = specialization[i];
				        		  i++;
				        	  }
				        	  else
				        	  {
				        	  Trainerspec[k] = "";
				        	 
				        	  }
				          }
				          while (k < size)
				          {
				        	  Trainerspec[k] = "";
				        	  k++;
				          }
				         
					//   trainer.setTrainerSpecialization(specialization);
				          trainer.setTrainerSpecialization(Trainerspec);
			    }
		}

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return trainer;	
}


public void UpdateTrainerSpecialisationContent(Connection connection, String trainer_mob, String spec) 
{
			PreparedStatement ps;
			String sql = "insert into trainerspecialisation values (?, (select TRAINER_ID from trainer where mobile_no=?), ?)";
			try {
				ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
					int ts_id=0;
				ResultSet rs = ps.getGeneratedKeys();
					while (rs.next())
					{
						ts_id = (int)rs.getInt(1);
					}
					ps.setInt(1, ts_id);
					ps.setString(2, trainer_mob);
					ps.setString(3, spec);
					ps.executeUpdate();	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}



public void updateTrainerSpecialisation(Trainer trainer)
{
	deleteTrainerSpecialisation(trainer.getTrainerId());
	Connection connection = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
	}catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch blockMeta
		e1.printStackTrace();
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	String[] Specialization = trainer.getTrainerSpecialization();
	
	int i, size = trainer.getTrainerSpecialization().length;
	for (i = 0; i< size; i++)
	{
		UpdateTrainerSpecialisationContent(connection, trainer.getMobileNo(), Specialization[i]);
	}
}

public void update(Trainer trainer)
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
		ps.setString(1, trainer.getTrainerId());
		ps.setString(2, trainer.getTrainerFirstName());
		ps.setString(3, trainer.getTrainerLastName());
		ps.setString(4, trainer.getGender());
		if (trainer.getDateOfBirth() != null)
		{
			ps.setDate(5, new java.sql.Date(trainer.getDateOfBirth().getTime()));
		}
		ps.setString(6, trainer.getMobileNo());
		ps.setString(7, trainer.getAltTelphNo());
		ps.setString(8, trainer.getEmail());
		ps.setString(9, trainer.getTrainerICno());
		ps.setString(10, trainer.getAvailability());
		ps.setString(11, trainer.getTrainerStatus());
		if (trainer.getTrainerJoiningDate() != null)
		{
			ps.setDate(12, new java.sql.Date(trainer.getTrainerJoiningDate().getTime()));
		}
		ps.setString(13, trainer.getTrainerWorkStatus());
		ps.setString(14, trainer.getTrainerId());
		updateTrainerSpecialisation(trainer);
		ps.executeUpdate();
		
		
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

public void updateTrainerDetails(Trainer trainer)
{
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	try(
		Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
		PreparedStatement ps = connection.prepareStatement(UPDATE_DATE_QUERY);
		)	
			{	
		ps.setString(1, trainer.getTrainerId());
		ps.setString(2, trainer.getTrainerFirstName());
		ps.setString(3, trainer.getTrainerLastName());
		ps.setString(4, trainer.getGender());
		if (trainer.getDateOfBirth() != null)
		{
			ps.setDate(5, new java.sql.Date(trainer.getDateOfBirth().getTime()));
		}
		ps.setString(6, trainer.getMobileNo());
		ps.setString(7, trainer.getAltTelphNo());
		ps.setString(8, trainer.getEmail());
		ps.setString(9, trainer.getTrainerICno());
		ps.setString(10, trainer.getAvailability());
		ps.setString(11, trainer.getTrainerStatus());
		if (trainer.getTrainerJoiningDate() != null && trainer.getTrainerRelievingDate() != null)
		{
			ps.setDate(12, new java.sql.Date(trainer.getTrainerJoiningDate().getTime()));
			ps.setDate(13, new java.sql.Date(trainer.getTrainerRelievingDate().getTime()));
		}
		ps.setString(14, trainer.getTrainerWorkStatus());
		ps.setString(15, trainer.getTrainerId());
		updateTrainerSpecialisation(trainer);
		ps.executeUpdate();
		
		
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

public void updateTrainerStatus(Student student)
{
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	try(
		Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
		PreparedStatement ps = connection.prepareStatement("update trainer set trainer_status=? where trainer_id=?");
		)	
			{
		ps.setString(1, student.trainer.getTrainerStatus());
		ps.setString(2, student.trainer.getTrainerId());
		ps.executeUpdate();
		
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}

}
