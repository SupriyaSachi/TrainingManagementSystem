package trainingplan.course.domain;

import java.util.ArrayList;
import java.util.Date;

public class Student {
	private String StudentId;
	private String StudentFirstName;
	private String StudentLastName;
	private String Gender;
	private Date DateOfBirth;
	private String StudentMobileNo;
	private String ParentMobileNo;
	private String AltTelphNo;
	private String Email;
	private String StudentICno;
	private String ParentICno;
	private String CourseTitle;
	private Date  PrefCourseStartDate;
	private Date PrefCourseEndDate;
	private String BatchAllocationStatus;
	private String Findaboutus;
	private String Reason;
	public Course course;
	public Trainer trainer;
	public ArrayList<Trainer> trainers;
	public Batch batch;
	public ArrayList<Batch> batchlist;
	
	public Student() {
	}

	public Student(String studentId, String studentFirstName,
			String studentLastName, String gender, Date dateOfBirth,
			String studentMobileNo, String parentMobileNo, String altTelphNo,
			String email, String studentICno, String parentICno,
			String courseTitle, Date prefCourseStartDate,
			Date prefCourseEndDate, String batchAllocationStatus,
			String findaboutus, String reason) {
		StudentId = studentId;
		StudentFirstName = studentFirstName;
		StudentLastName = studentLastName;
		Gender = gender;
		DateOfBirth = dateOfBirth;
		StudentMobileNo = studentMobileNo;
		ParentMobileNo = parentMobileNo;
		AltTelphNo = altTelphNo;
		Email = email;
		StudentICno = studentICno;
		ParentICno = parentICno;
		CourseTitle = courseTitle;
		PrefCourseStartDate = prefCourseStartDate;
		PrefCourseEndDate = prefCourseEndDate;
		BatchAllocationStatus = batchAllocationStatus;
		Findaboutus = findaboutus;
		Reason = reason;
	}

	public Student(String studentId, String studentFirstName,
			String studentLastName, String gender, Date dateOfBirth,
			String studentMobileNo, String parentMobileNo, String altTelphNo,
			String email, String studentICno, String parentICno,
			String courseTitle, String batchAllocationStatus, Trainer trainer,
			Batch batch) {
		StudentId = studentId;
		StudentFirstName = studentFirstName;
		StudentLastName = studentLastName;
		Gender = gender;
		DateOfBirth = dateOfBirth;
		StudentMobileNo = studentMobileNo;
		ParentMobileNo = parentMobileNo;
		AltTelphNo = altTelphNo;
		Email = email;
		StudentICno = studentICno;
		ParentICno = parentICno;
		CourseTitle = courseTitle;
		BatchAllocationStatus = batchAllocationStatus;
		this.trainer = trainer;
		this.batch = batch;
	}

	public Student(String studentId, String studentFirstName,
			String studentLastName, String gender, Date dateOfBirth,
			String studentMobileNo, String parentMobileNo, String altTelphNo,
			String email, String studentICno, String parentICno,
			String courseTitle, String batchAllocationStatus) {
		StudentId = studentId;
		StudentFirstName = studentFirstName;
		StudentLastName = studentLastName;
		Gender = gender;
		DateOfBirth = dateOfBirth;
		StudentMobileNo = studentMobileNo;
		ParentMobileNo = parentMobileNo;
		AltTelphNo = altTelphNo;
		Email = email;
		StudentICno = studentICno;
		ParentICno = parentICno;
		CourseTitle = courseTitle;
		BatchAllocationStatus = batchAllocationStatus;
	}
	

	public Student(String studentId, String studentFirstName,
			String studentLastName, String gender, Date dateOfBirth,
			String studentMobileNo, String parentMobileNo, String altTelphNo,
			String email, String studentICno, String parentICno,
			String courseTitle, String batchAllocationStatus, Batch batch) {
		StudentId = studentId;
		StudentFirstName = studentFirstName;
		StudentLastName = studentLastName;
		Gender = gender;
		DateOfBirth = dateOfBirth;
		StudentMobileNo = studentMobileNo;
		ParentMobileNo = parentMobileNo;
		AltTelphNo = altTelphNo;
		Email = email;
		StudentICno = studentICno;
		ParentICno = parentICno;
		CourseTitle = courseTitle;
		BatchAllocationStatus = batchAllocationStatus;
		this.batch = batch;
	}
	public Student(String studentId, String studentFirstName,
			String studentLastName, String studentICno, String courseTitle,
			String batchAllocationStatus, Trainer trainer, Batch batch) {
		StudentId = studentId;
		StudentFirstName = studentFirstName;
		StudentLastName = studentLastName;
		StudentICno = studentICno;
		CourseTitle = courseTitle;
		BatchAllocationStatus = batchAllocationStatus;
		this.trainer = trainer;
		this.batch = batch;
	}
	
	
	public Student(String studentId, Trainer trainer, Batch batch) {
		StudentId = studentId;
		this.trainer = trainer;
		this.batch = batch;
	}

	public Student(String studentId, Batch batch) {
		StudentId = studentId;
		this.batch = batch;
	}
	
	public String getStudentId() {
		return StudentId;
	}

	public void setStudentId(String studentId) {
		StudentId = studentId;
	}

	public String getStudentFirstName() {
		return StudentFirstName;
	}

	public void setStudentFirstName(String studentFirstName) {
		StudentFirstName = studentFirstName;
	}

	public String getStudentLastName() {
		return StudentLastName;
	}

	public void setStudentLastName(String studentLastName) {
		StudentLastName = studentLastName;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public Date getDateOfBirth() {
		return DateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		DateOfBirth = dateOfBirth;
	}

	public String getStudentMobileNo() {
		return StudentMobileNo;
	}

	public void setStudentMobileNo(String studentMobileNo) {
		StudentMobileNo = studentMobileNo;
	}

	public String getParentMobileNo() {
		return ParentMobileNo;
	}

	public void setParentMobileNo(String parentMobileNo) {
		ParentMobileNo = parentMobileNo;
	}

	public String getAltTelphNo() {
		return AltTelphNo;
	}

	public void setAltTelphNo(String altTelphNo) {
		AltTelphNo = altTelphNo;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getStudentICno() {
		return StudentICno;
	}

	public void setStudentICno(String studentICno) {
		StudentICno = studentICno;
	}

	public String getParentICno() {
		return ParentICno;
	}

	public void setParentICno(String parentICno) {
		ParentICno = parentICno;
	}

	public String getCourseTitle() {
		return CourseTitle;
	}

	public void setCourseTitle(String courseTitle) {
		CourseTitle = courseTitle;
	}

	public Date getPrefCourseStartDate() {
		return PrefCourseStartDate;
	}

	public void setPrefCourseStartDate(Date prefCourseStartDate) {
		PrefCourseStartDate = prefCourseStartDate;
	}

	public Date getPrefCourseEndDate() {
		return PrefCourseEndDate;
	}

	public void setPrefCourseEndDate(Date prefCourseEndDate) {
		PrefCourseEndDate = prefCourseEndDate;
	}

	public String getBatchAllocationStatus() {
		return BatchAllocationStatus;
	}

	public void setBatchAllocationStatus(String batchAllocationStatus) {
		BatchAllocationStatus = batchAllocationStatus;
	}

	public String getFindaboutus() {
		return Findaboutus;
	}

	public void setFindaboutus(String findaboutus) {
		Findaboutus = findaboutus;
	}

	public String getReason() {
		return Reason;
	}

	public void setReason(String reason) {
		Reason = reason;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Trainer getTrainer() {
		return trainer;
	}

	public void setTrainer(Trainer trainer) {
		this.trainer = trainer;
	}

	public ArrayList<Trainer> getTrainers() {
		return trainers;
	}

	public void setTrainers(ArrayList<Trainer> trainers) {
		this.trainers = trainers;
	}

	public Batch getBatch() {
		return batch;
	}

	public void setBatch(Batch batch) {
		this.batch = batch;
	}

	public ArrayList<Batch> getBatchlist() {
		return batchlist;
	}

	public void setBatchlist(ArrayList<Batch> batchlist) {
		this.batchlist = batchlist;
	}

	@Override
	public String toString() {
		return "Student [StudentId=" + StudentId + ", StudentFirstName="
				+ StudentFirstName + ", StudentLastName=" + StudentLastName
				+ ", Gender=" + Gender + ", DateOfBirth=" + DateOfBirth
				+ ", StudentMobileNo=" + StudentMobileNo + ", ParentMobileNo="
				+ ParentMobileNo + ", AltTelphNo=" + AltTelphNo + ", Email="
				+ Email + ", StudentICno=" + StudentICno + ", ParentICno="
				+ ParentICno + ", CourseTitle=" + CourseTitle
				+ ", PrefCourseStartDate=" + PrefCourseStartDate
				+ ", PrefCourseEndDate=" + PrefCourseEndDate
				+ ", BatchAllocationStatus=" + BatchAllocationStatus
				+ ", Findaboutus=" + Findaboutus + ", Reason=" + Reason
				+ ", course=" + course + ", trainer=" + trainer + ", trainers="
				+ trainers + ", batch=" + batch + ", batchlist=" + batchlist
				+ "]";
	}
}
