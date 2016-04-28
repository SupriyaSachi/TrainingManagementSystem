package trainingplan.course.domain;

import java.util.Arrays;
import java.util.Date;

public class Course {
	
		private String CourseId;
		private String CourseName;
		private String CourseSession;
		private String[] CourseConductingOn;
		private Date CourseStartDate;
		private Date CourseEndDate;
		
		public Course() {
			
		}

		public Course(String courseId, String courseName, String courseSession,
				String[] courseConductingOn, Date courseStartDate,
				Date courseEndDate) {
			CourseId = courseId;
			CourseName = courseName;
			CourseSession = courseSession;
			CourseConductingOn = courseConductingOn;
			CourseStartDate = courseStartDate;
			CourseEndDate = courseEndDate;
		}

		
		public Course(String courseId, String courseName) {
			CourseId = courseId;
			CourseName = courseName;
		}

		public String getCourseId() {
			return CourseId;
		}

		public void setCourseId(String courseId) {
			CourseId = courseId;
		}

		public String getCourseName() {
			return CourseName;
		}

		public void setCourseName(String courseName) {
			CourseName = courseName;
		}

		

		public String getCourseSession() {
			return CourseSession;
		}



		public void setCourseSession(String courseSession) {
			CourseSession = courseSession;
		}

		public String[] getCourseConductingOn() {
			return CourseConductingOn;
		}

		public void setCourseConductingOn(String[] courseConductingOn) {
			CourseConductingOn = courseConductingOn;
		}

		public Date getCourseStartDate() {
			return CourseStartDate;
		}

		public void setCourseStartDate(Date courseStartDate) {
			CourseStartDate = courseStartDate;
		}

		public Date getCourseEndDate() {
			return CourseEndDate;
		}

		public void setCourseEndDate(Date courseEndDate) {
			CourseEndDate = courseEndDate;
		}

		@Override
		public String toString() {
			return "Course [CourseId=" + CourseId + ", CourseName=" + CourseName
					+ ", CourseSession=" + CourseSession + ", CourseConductingOn="
					+ Arrays.toString(CourseConductingOn) + ", CourseStartDate="
					+ CourseStartDate + ", CourseEndDate=" + CourseEndDate + "]";
		}	


}
