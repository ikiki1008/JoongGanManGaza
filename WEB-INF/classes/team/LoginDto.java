package team;


public class LoginDto {
	private String name;
	private String id;
	private String pass;
	private String birth;
	private String tel;
	private String email;

	
	/*---------------------회원 정보-----------------------------*/
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public LoginDto(String name, String id, String pass, String birth, String tel, String email) {
		this.name = name;
		this.id = id;
		this.pass = pass;
		this.birth = birth;
		this.tel = tel;
		this.email = email;
		
	}
	/*-----------------------------------------------------------------*/
	

	public LoginDto() {}

}
