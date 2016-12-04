package InteractiveCalculus.Main;

public class Forum_table {
	private int thread_id = -1;
	private String thread_name = "";
	private String thread_description = "";
	private String author="";
	
	public Forum_table(String thread_name, String thread_description, String author) {
		super();
		this.thread_name = thread_name;
		this.thread_description = thread_description;
		this.author = author;
	}
	public Forum_table(int thread_id, String thread_name, String thread_description, String author) {
		super();
		this.thread_id = thread_id;
		this.thread_name = thread_name;
		this.thread_description = thread_description;
		this.author = author;
	}
	public int getThread_id() {
		return thread_id;
	}
	public void setThread_id(int thread_id) {
		this.thread_id = thread_id;
	}
	public String getThread_name() {
		return thread_name;
	}
	public void setThread_name(String thread_name) {
		this.thread_name = thread_name;
	}
	public String getThread_description() {
		return thread_description;
	}
	public void setThread_descirption(String thread_description) {
		this.thread_description = thread_description;
	}	
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Forum_table(int thread_id, String thread_name, String thread_description) {
		super();
		this.thread_id = thread_id;
		this.thread_name = thread_name;
		this.thread_description = thread_description;
	}
	public Forum_table(String thread_name, String thread_description) {
		super();
		this.thread_name = thread_name;
		this.thread_description = thread_description;
	}
	public Forum_table(String thread_name) {
		super();
		this.thread_name = thread_name;
	}
	public Forum_table() {
		super();
	}
	
}