package InteractiveCalculus.Main;

public class Forum_post {
	private int post_id = -1;
	private String post_author = "";
	private String post_body = "";
	private int op_id = -1;
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getPost_author() {
		return post_author;
	}
	public void setPost_author(String post_author) {
		this.post_author = post_author;
	}
	public String getPost_body() {
		return post_body;
	}
	public void setPost_body(String post_body) {
		this.post_body = post_body;
	}
	public int getOp_id() {
		return op_id;
	}
	public void setOp_id(int op_id) {
		this.op_id = op_id;
	}
	public Forum_post(int post_id, String post_author, String post_body, int op_id) {
		super();
		this.post_id = post_id;
		this.post_author = post_author;
		this.post_body = post_body;
		this.op_id = op_id;
	}
	public Forum_post(String post_author, String post_body, int op_id) {
		super();
		this.post_author = post_author;
		this.post_body = post_body;
		this.op_id = op_id;
	}
	public Forum_post(String post_author, String post_body) {
		super();
		this.post_author = post_author;
		this.post_body = post_body;
	}
	public Forum_post() {
		super();
	}
	
	
}