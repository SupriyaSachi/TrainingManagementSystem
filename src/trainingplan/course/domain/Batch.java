package trainingplan.course.domain;

import java.util.ArrayList;
import java.util.Date;

public class Batch {
	private String BatchId;
	private Date BatchStartDate;
	private Date BatchEndDate;
	private String BatchStatus;
	public Trainer trainer;
	public ArrayList<Trainer> trainers;
	public Course course;
	
	public Batch() {
	}
	
	public Batch(String batchId, String batchStatus) {
		BatchId = batchId;
		BatchStatus = batchStatus;
	}

	public Batch(String batchId, Date batchStartDate, Date batchEndDate,
			String batchStatus, Trainer trainer, Course course) {
		BatchId = batchId;
		BatchStartDate = batchStartDate;
		BatchEndDate = batchEndDate;
		BatchStatus = batchStatus;
		this.trainer = trainer;
		this.course = course;
	}

	public Batch(String batchId, Date batchStartDate, Date batchEndDate,
			String batchStatus, Course course) {
		BatchId = batchId;
		BatchStartDate = batchStartDate;
		BatchEndDate = batchEndDate;
		BatchStatus = batchStatus;
		this.course = course;
	}

	
	
	public ArrayList<Trainer> getTrainers() {
		return trainers;
	}

	public void setTrainers(ArrayList<Trainer> trainers) {
		this.trainers = trainers;
	}

	public String getBatchId() {
		return BatchId;
	}

	public void setBatchId(String batchId) {
		BatchId = batchId;
	}

	public Date getBatchStartDate() {
		return BatchStartDate;
	}

	public void setBatchStartDate(Date batchStartDate) {
		BatchStartDate = batchStartDate;
	}

	public Trainer getTrainer() {
		return trainer;
	}

	public void setTrainer(Trainer trainer) {
		this.trainer = trainer;
	}

	public Date getBatchEndDate() {
		return BatchEndDate;
	}

	public void setBatchEndDate(Date batchEndDate) {
		BatchEndDate = batchEndDate;
	}

	public String getBatchStatus() {
		return BatchStatus;
	}

	public void setBatchStatus(String batchStatus) {
		BatchStatus = batchStatus;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	@Override
	public String toString() {
		return "Batch [BatchId=" + BatchId + ", BatchStartDate="
				+ BatchStartDate + ", BatchEndDate=" + BatchEndDate
				+ ", BatchStatus=" + BatchStatus + ", trainer=" + trainer
				+ ", trainers=" + trainers + ", course=" + course + "]";
	}

	
}
