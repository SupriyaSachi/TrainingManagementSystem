package trainingplan.course.domain;

import java.util.Arrays;
import java.util.Date;

public class Trainer {
	private String TrainerId;
	private String TrainerFirstName;
	private String TrainerLastName;
	private String Gender;
	private Date DateOfBirth;
	private String MobileNo;
	private String AltTelphNo;
	private String Email;
	private String TrainerICno;
	private String Availability;
	private String[] TrainerSpecialization;
	private String TrainerStatus;
	private Date TrainerJoiningDate;
	private Date TrainerRelievingDate;
	private String TrainerWorkStatus;
	
	
	public Trainer() {
	}
	
	public Trainer(String trainerId, String trainerStatus) {
		TrainerId = trainerId;
		TrainerStatus = trainerStatus;
	}
	
	public Trainer(String trainerId, String trainerFirstName,
			String trainerLastName, String gender, Date dateOfBirth,
			String mobileNo, String altTelphNo, String email,
			String trainerICno, String availability,
			String[] trainerSpecialization, String trainerStatus,
			Date trainerJoiningDate, String trainerWorkStatus) {
		TrainerId = trainerId;
		TrainerFirstName = trainerFirstName;
		TrainerLastName = trainerLastName;
		Gender = gender;
		DateOfBirth = dateOfBirth;
		MobileNo = mobileNo;
		AltTelphNo = altTelphNo;
		Email = email;
		TrainerICno = trainerICno;
		Availability = availability;
		TrainerSpecialization = trainerSpecialization;
		TrainerStatus = trainerStatus;
		TrainerJoiningDate = trainerJoiningDate;
		TrainerWorkStatus = trainerWorkStatus;
	}

	
	public Trainer(String trainerId, String trainerFirstName,
			String trainerLastName, String gender, Date dateOfBirth,
			String mobileNo, String altTelphNo, String email,
			String trainerICno, String availability,
			String[] trainerSpecialization, String trainerStatus,
			Date trainerJoiningDate, Date trainerRelievingDate,
			String trainerWorkStatus) {
		TrainerId = trainerId;
		TrainerFirstName = trainerFirstName;
		TrainerLastName = trainerLastName;
		Gender = gender;
		DateOfBirth = dateOfBirth;
		MobileNo = mobileNo;
		AltTelphNo = altTelphNo;
		Email = email;
		TrainerICno = trainerICno;
		Availability = availability;
		TrainerSpecialization = trainerSpecialization;
		TrainerStatus = trainerStatus;
		TrainerJoiningDate = trainerJoiningDate;
		TrainerRelievingDate = trainerRelievingDate;
		TrainerWorkStatus = trainerWorkStatus;
	}

	public Date getTrainerJoiningDate() {
		return TrainerJoiningDate;
	}

	public void setTrainerJoiningDate(Date trainerJoiningDate) {
		TrainerJoiningDate = trainerJoiningDate;
	}

	public Date getTrainerRelievingDate() {
		return TrainerRelievingDate;
	}

	public void setTrainerRelievingDate(Date trainerRelievingDate) {
		TrainerRelievingDate = trainerRelievingDate;
	}

	public String getTrainerWorkStatus() {
		return TrainerWorkStatus;
	}



	public void setTrainerWorkStatus(String trainerWorkStatus) {
		TrainerWorkStatus = trainerWorkStatus;
	}



	public String getTrainerId() {
		return TrainerId;
	}

	public void setTrainerId(String trainerId) {
		TrainerId = trainerId;
	}

	public String getTrainerFirstName() {
		return TrainerFirstName;
	}

	public void setTrainerFirstName(String trainerFirstName) {
		TrainerFirstName = trainerFirstName;
	}



	public String getTrainerLastName() {
		return TrainerLastName;
	}



	public void setTrainerLastName(String trainerLastName) {
		TrainerLastName = trainerLastName;
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



	public String getMobileNo() {
		return MobileNo;
	}



	public void setMobileNo(String mobileNo) {
		MobileNo = mobileNo;
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



	public String getTrainerICno() {
		return TrainerICno;
	}



	public void setTrainerICno(String trainerICno) {
		TrainerICno = trainerICno;
	}



	public String getAvailability() {
		return Availability;
	}



	public void setAvailability(String availability) {
		Availability = availability;
	}



	public String[] getTrainerSpecialization() {
		return TrainerSpecialization;
	}



	public void setTrainerSpecialization(String[] trainerSpecialization) {
		TrainerSpecialization = trainerSpecialization;
	}



	public String getTrainerStatus() {
		return TrainerStatus;
	}



	public void setTrainerStatus(String trainerStatus) {
		TrainerStatus = trainerStatus;
	}

	@Override
	public String toString() {
		return "Trainer [TrainerId=" + TrainerId + ", TrainerFirstName="
				+ TrainerFirstName + ", TrainerLastName=" + TrainerLastName
				+ ", Gender=" + Gender + ", DateOfBirth=" + DateOfBirth
				+ ", MobileNo=" + MobileNo + ", AltTelphNo=" + AltTelphNo
				+ ", Email=" + Email + ", TrainerICno=" + TrainerICno
				+ ", Availability=" + Availability + ", TrainerSpecialization="
				+ Arrays.toString(TrainerSpecialization) + ", TrainerStatus="
				+ TrainerStatus + ", TrainerJoiningDate=" + TrainerJoiningDate
				+ ", TrainerRelievingDate=" + TrainerRelievingDate
				+ ", TrainerWorkStatus=" + TrainerWorkStatus + "]";
	}

	

}
