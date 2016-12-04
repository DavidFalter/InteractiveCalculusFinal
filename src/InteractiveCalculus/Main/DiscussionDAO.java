package InteractiveCalculus.Main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class DiscussionDAO {
	

	public Connection getConnection()
	{
		String connectionUrl ="jdbc:mysql://localhost:3306/interactivecalculusaid";
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			try {
				connection = DriverManager.getConnection(connectionUrl, "root", null);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (InstantiationException e) { 	 
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
		
	}
	
	public void closeConnection(Connection connection){
	try {
		connection.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}
	
	public void create(Forum_table application){
	
		String sql = "insert into forum_table (thread_name, thread_description, author) values (? , ?, ?) ";
		
		Connection connection = getConnection();
		
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, application.getThread_name());
			statement.setString(2, application.getThread_description());
			statement.setString(3, application.getAuthor());
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		closeConnection(connection);
		}
		
	}
	
	public void create2(Forum_post application, int oid){
		
		String sql = "insert into forum_post (post_author, post_body, op_id) values (? , ?, ?) ";
		
		
		Connection connection = getConnection();
		
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, application.getPost_author());
			statement.setString(2, application.getPost_body());
			statement.setInt(3, oid);
			
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		closeConnection(connection);
		}
		
	}
	
	
	public List<Forum_table> selectAll(){
	List<Forum_table> allthreads = new ArrayList<Forum_table>();
	
	String sql = "select * from forum_table";
	
	Connection connection = getConnection();
	
	try {
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet results = statement.executeQuery();
		
		while(results.next()){
			int id = results.getInt("thread_id");
			String name = results.getString("thread_name");
			String description = results.getString("thread_description");
			String author = results.getString("author");
			Forum_table ftable = new Forum_table(id,name,description,author);
			allthreads.add(ftable);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally{
		closeConnection(connection);
	}
	
	Collections.reverse(allthreads);
	return allthreads;
	}
	
	
	public List<Forum_post> selectAll2(){
	List<Forum_post> allposts = new ArrayList<Forum_post>();
	
	String sql = "select * from forum_post";
	
	Connection connection = getConnection();
	
	try {
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet results = statement.executeQuery();
		
		while(results.next()){
			int id = results.getInt("post_id");
			String name = results.getString("post_author");
			String body = results.getString("post_body");
			int oid = results.getInt("op_id");
			Forum_post application = new Forum_post(id,name, body, oid);
			allposts.add(application);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		closeConnection(connection);
	}
	Collections.reverse(allposts);

	return allposts;
	}
	
	
	public void remove(int id){
		String sql = "delete from forum_table where thread_id=?";
		
		Connection connection = getConnection();
		
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConnection(connection);	
		}
		
	}
	
	
	public void removee(int id){
		String sql = "delete from forum_post where post_id=?";
		
		Connection connection = getConnection();
		
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConnection(connection);	
		}
		
	}
	
	
	public Forum_table selectOnename(int id){
		Forum_table onename = null;
		
		String sql = "select * from forum_table where thread_id=?";
		
		Connection connection = getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet results = statement.executeQuery();
			if (results.next()){
				String name = results.getString("thread_name");
				String description = results.getString("thread_description");
				String author = results.getString("author");
				onename = new Forum_table(name, description, author);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeConnection(connection);	
		}
		
		return onename;
	}
	
	
	
	public static void main(String[] args) {
	}
	
	


}
