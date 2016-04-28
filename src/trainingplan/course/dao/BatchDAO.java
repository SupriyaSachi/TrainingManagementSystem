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

public class BatchDAO {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/JDBC_TrainingManagementSystem";
	private static final String DB_USER = "root";
	private static final String DB_PWD = "root";
	private static final String INSERT_QUERY = "insert into batch values (?,?,?,?,?,?,?)";
	private static final String UPDATE_QUERY = "update batch set course_id=?, course_title=?, batch_id=?, batch_start_date=?, batch_end_date=?, batch_status=?, trainer_id=? where batch_id=?";
	private static final String DELETE_QUERY = "delete from batch where batch_id=?";
	private static final String SELECT_QUERY = "select * from batch";
	
	public void CreateBatchTable(Connection connection) {
		try {
		Statement stmt = connection.createStatement();
		String sqlStmt = "CREATE TABLE batch"
							+ "("
							+ "COURSE_ID VARCHAR(10),"
							+ "COURSE_TITLE VARCHAR(30),"
							+ "BATCH_ID VARCHAR(10),"
							+ "BATCH_START_DATE DATE,"
							+ "BATCH_END_DATE DATE,"
							+ "BATCH_STATUS VARCHAR(10),"
							+ "TRAINER_ID VARCHAR(10),"
							+ "PRIMARY KEY (BATCH_ID)"
							+")";
			stmt.executeUpdate(sqlStmt);
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }
	
	public void SaveBatchInfo(Connection connection, Batch batch) {
		PreparedStatement ps;
		try {		
			ps = connection.prepareStatement(INSERT_QUERY);
			ps.setString(1, batch.course.getCourseId());
			ps.setString(2, batch.course.getCourseName());
			ps.setString(3, batch.getBatchId());
			if (batch.getBatchStartDate() != null &&
				batch.getBatchEndDate() != null	) {
				ps.setDate(4, new java.sql.Date(batch.getBatchStartDate().getTime()));
				ps.setDate(5, new java.sql.Date(batch.getBatchEndDate().getTime()));
			}
			ps.setString(6, batch.getBatchStatus());
			ps.setString(7, null);
			ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public void save(Batch batch) {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
			DatabaseMetaData metadata = connection.getMetaData();
			ResultSet resultset = metadata.getTables(null, null, "BATCH", null);
			if(!resultset.next())
			{
				CreateBatchTable(connection);
				SaveBatchInfo(connection, batch);
			}
			else
			{
				SaveBatchInfo(connection, batch);
			}
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch blockMeta
			e1.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }

	
	public ArrayList<Batch> listBatch(String BatchStatus)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ArrayList<Batch> BatchList = new ArrayList<Batch>();
		
		Batch batch = null;
		Course course = null;
		Trainer trainer = null;
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		) {
			ResultSet rs = stmt.executeQuery(SELECT_QUERY);
		    while (rs.next())
			{
		    	if (rs.getString("BATCH_STATUS").equals(BatchStatus))
		    	{
		    	  batch = new Batch();
				  course = new Course();
				  trainer = new Trainer();
				  batch.setBatchId(rs.getString("BATCH_ID"));
				  course.setCourseId(rs.getString("COURSE_ID"));
				  course.setCourseName(rs.getString("COURSE_TITLE"));
				  java.util.Date utilStartDate = null, utilEndDate = null;
					java.sql.Date sqlStartDate = rs.getDate("BATCH_START_DATE");
					java.sql.Date sqlEndDate = rs.getDate("BATCH_END_DATE");
					if ((sqlStartDate != null) && (sqlEndDate != null))
					{
						utilStartDate = new java.util.Date(sqlStartDate.getTime());
						utilEndDate = new java.util.Date(sqlEndDate.getTime());
					}
					batch.setBatchStartDate(utilStartDate);
					batch.setBatchEndDate(utilEndDate);
					batch.setBatchStatus(rs.getString("BATCH_STATUS"));
					trainer.setTrainerId(rs.getString("TRAINER_ID"));
					batch.setTrainer(trainer);
					batch.setCourse(course);
					BatchList.add(batch);
		    	}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return BatchList;	
	}
	
	
	
	public Batch listBatchById(String batch_id)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Course course = null;
		Batch batch = null;
		Trainer trainer = null;
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		) {
			ResultSet rs = stmt.executeQuery("select * from batch where batch_id = batch_id");
		    while (rs.next())
			{
		    	if (rs.getString("BATCH_ID").equals(batch_id))
		    	{
		    		course = new Course();
				  batch = new Batch();
				  trainer = new Trainer();
				  batch.setBatchId(rs.getString("BATCH_ID"));
				  course.setCourseId(rs.getString("COURSE_ID"));
				  course.setCourseName(rs.getString("COURSE_TITLE"));
				  java.util.Date utilStartDate = null, utilEndDate = null;
					java.sql.Date sqlStartDate = rs.getDate("BATCH_START_DATE");
					java.sql.Date sqlEndDate = rs.getDate("BATCH_END_DATE");
					if ((sqlStartDate != null) && (sqlEndDate != null))
					{
						utilStartDate = new java.util.Date(sqlStartDate.getTime());
						utilEndDate = new java.util.Date(sqlEndDate.getTime());
					}
					batch.setBatchStartDate(utilStartDate);
					batch.setBatchEndDate(utilEndDate);
						batch.setBatchStartDate(utilStartDate);
					batch.setBatchEndDate(utilEndDate);
					batch.setBatchStatus(rs.getString("BATCH_STATUS"));
					trainer.setTrainerId(rs.getString("TRAINER_ID"));
					batch.setTrainer(trainer);
					batch.setCourse(course);
		    	}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return batch;	
	}
	

	public Batch listBatchByTrainerId(String trainer_id)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Course course = null;
		Batch batch = null;
		Trainer trainer = null;
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		) {
			ResultSet rs = stmt.executeQuery("select * from batch where trainer_id = trainer_id");
		    while (rs.next())
			{
		    	if ((rs.getString("BATCH_STATUS").equals("Ongoing")) &&
		    			(rs.getString("TRAINER_ID").equals(trainer_id)))
		    	{
		    		course = new Course();
				  batch = new Batch();
				  trainer = new Trainer();
				  batch.setBatchId(rs.getString("BATCH_ID"));
				  course.setCourseId(rs.getString("COURSE_ID"));
				  course.setCourseName(rs.getString("COURSE_TITLE"));
				  java.util.Date utilStartDate = null, utilEndDate = null;
					java.sql.Date sqlStartDate = rs.getDate("BATCH_START_DATE");
					java.sql.Date sqlEndDate = rs.getDate("BATCH_END_DATE");
					if ((sqlStartDate != null) && (sqlEndDate != null))
					{
						utilStartDate = new java.util.Date(sqlStartDate.getTime());
						utilEndDate = new java.util.Date(sqlEndDate.getTime());
					}
					batch.setBatchStartDate(utilStartDate);
					batch.setBatchEndDate(utilEndDate);
						batch.setBatchStartDate(utilStartDate);
					batch.setBatchEndDate(utilEndDate);
					batch.setBatchStatus(rs.getString("BATCH_STATUS"));
					trainer.setTrainerId(rs.getString("TRAINER_ID"));
					batch.setTrainer(trainer);
					batch.setCourse(course);
		    	}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return batch;	
	}

	
	
	
	public ArrayList<Batch> listBatchByCourseName(String course_title)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Course course = null;
		Batch batch = null;
		Trainer trainer = null;
		ArrayList<Batch> batchlist = null;
		try (Connection connection = DriverManager.getConnection(DB_URL,
				DB_USER, DB_PWD); Statement stmt = connection.createStatement();

		) {
			ResultSet rs = stmt.executeQuery("select * from batch where course_title = course_title");
		    while (rs.next())
			{
		    	if ((rs.getString("COURSE_TITLE").equals(course_title)) && 
		    	    ((rs.getString("BATCH_STATUS").equals("NotStarted")) ||
		    	     (rs.getString("BATCH_STATUS").equals("Ongoing")) ||
		    	     (rs.getString("BATCH_STATUS").equals("Halt"))))
		    	{
		    	  course = new Course();
				  batch = new Batch();
				  trainer = new Trainer();
				  batchlist = new ArrayList<Batch>();
				  batch.setBatchId(rs.getString("BATCH_ID"));
				  course.setCourseId(rs.getString("COURSE_ID"));
				  course.setCourseName(rs.getString("COURSE_TITLE"));
				  java.util.Date utilStartDate = null, utilEndDate = null;
					java.sql.Date sqlStartDate = rs.getDate("BATCH_START_DATE");
					java.sql.Date sqlEndDate = rs.getDate("BATCH_END_DATE");
					if ((sqlStartDate != null) && (sqlEndDate != null))
					{
						utilStartDate = new java.util.Date(sqlStartDate.getTime());
						utilEndDate = new java.util.Date(sqlEndDate.getTime());
					}
					batch.setBatchStartDate(utilStartDate);
					batch.setBatchEndDate(utilEndDate);
						batch.setBatchStartDate(utilStartDate);
					batch.setBatchEndDate(utilEndDate);
					batch.setBatchStatus(rs.getString("BATCH_STATUS"));
					batch.setCourse(course);
					trainer.setTrainerId(rs.getString("TRAINER_ID"));
					batch.setTrainer(trainer);
					batchlist.add(batch);
		    	}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return batchlist;
	}
	
	public void update(Batch batch)
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
			ps.setString(1, batch.course.getCourseId());
			ps.setString(2, batch.course.getCourseName());
			ps.setString(3, batch.getBatchId());
			if (batch.getBatchStartDate() != null &&
				batch.getBatchEndDate() != null	) {
				ps.setDate(4, new java.sql.Date(batch.getBatchStartDate().getTime()));
				ps.setDate(5, new java.sql.Date(batch.getBatchEndDate().getTime()));
			}
			ps.setString(6, batch.getBatchStatus());
			ps.setString(7, batch.trainer.getTrainerId());
			ps.setString(8, batch.getBatchId());
			ps.executeUpdate();
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	public void updateBatchStatus(Student student)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try(
			Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
			PreparedStatement ps = connection.prepareStatement("update batch set batch_status=?, trainer_id=? where batch_id=?");
			)	
				{
			ps.setString(1, student.batch.getBatchStatus());
			ps.setString(2, student.trainer.getTrainerId());
			ps.setString(3, student.batch.getBatchId());
			ps.executeUpdate();
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public Batch ResumeBatch(Batch batch)
	{
		batch = listBatchById(batch.getBatchId());
		Trainer trainer = new Trainer();
		ArrayList<Trainer> trainers = new ArrayList<Trainer>();
		TrainerDAO trainerDAO = new TrainerDAO();
		trainer = trainerDAO.listtrainerbyId(batch.trainer.getTrainerId());
		batch.setTrainer(trainer);
		trainers = trainerDAO.listTrainerWhereAvailStatusIsFree(batch.course.getCourseName());
	    batch.setTrainers(trainers);
		return batch;	
	}

	
	
	public void delete(String batch_id)
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
			ps.setString(1, batch_id);
			ps.executeUpdate();
			
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	


}
