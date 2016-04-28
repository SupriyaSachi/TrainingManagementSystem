package trainingplan.course.domain;

public class LogInAndPass {
	private String UserFirstName;
	private String UserLastName;
	private String UserNricNo;
	private String UserName;
	private String UserPassword;


	public LogInAndPass() {
	}

	
	public LogInAndPass(String userFirstName, String userLastName,
			String userNricNo, String userName, String userPassword) {
		UserFirstName = userFirstName;
		UserLastName = userLastName;
		UserNricNo = userNricNo;
		UserName = userName;
		UserPassword = userPassword;
	}
	
	public LogInAndPass(String userName, String userPassword) {
		UserName = userName;
		UserPassword = userPassword;
	}


	public String getUserNricNo() {
		return UserNricNo;
	}


	public void setUserNricNo(String userNricNo) {
		UserNricNo = userNricNo;
	}


	public String getUserFirstName() {
		return UserFirstName;
	}

	public void setUserFirstName(String userFirstName) {
		UserFirstName = userFirstName;
	}

	public String getUserLastName() {
		return UserLastName;
	}

	public void setUserLastName(String userLastName) {
		UserLastName = userLastName;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getUserPassword() {
		return UserPassword;
	}

	public void setUserPassword(String userPassword) {
		UserPassword = userPassword;
	}


	@Override
	public String toString() {
		return "LogInAndPass [UserFirstName=" + UserFirstName
				+ ", UserLastName=" + UserLastName + ", UserNricNo="
				+ UserNricNo + ", UserName=" + UserName + ", UserPassword="
				+ UserPassword + "]";
	}

	

		
	}

	
	
	


