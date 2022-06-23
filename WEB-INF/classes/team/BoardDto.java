package team;

public class BoardDto {
	private String id;
	private String title;
	private String content;
	private String num;
	private String dt;
	
	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public BoardDto(String id, String title, String content) {
		this.id=id;
		this.title=title;
		this.content=content;
	}
	public BoardDto() {}
}
