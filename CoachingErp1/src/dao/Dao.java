package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.app.Course;
import com.app.Fees;
import com.app.Student;
import com.app.User;
/*
 *Database coachig
 *mysql> desc users;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| mobilenumber | varchar(15)  | NO   | PRI | NULL    |                |
| name         | varchar(100) | YES  |     | NULL    |                |
| password     | varchar(100) | YES  |     | NULL    |                |
| gender       | varchar(20)  | YES  |     | NULL    |                |
| city         | varchar(50)  | YES  |     | NULL    |                |
| uid          | int(11)      | NO   | UNI | NULL    | auto_increment |
+--------------+--------------+------+-----+---------+----------------+
 *mysql> desc student;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| sid    | int(11)      | NO   | PRI | NULL    | auto_increment |
| Fname  | varchar(50)  | YES  |     | NULL    |                |
| Lname  | varchar(50)  | YES  |     | NULL    |                |
| course | varchar(100) | YES  |     | NULL    |                |
| Date   | varchar(50)  | YES  |     | NULL    |                |
| Fees   | int(11)      | YES  |     | NULL    |                |
| city   | varchar(100) | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
 * 
 * mysql> desc course;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| cid      | int(11)      | NO   | PRI | NULL    | auto_increment |
| Name     | varchar(50)  | YES  |     | NULL    |                |
| Duration | varchar(100) | YES  |     | NULL    |                |
| Fees     | int(11)      | YES  |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
 * */ 
public class Dao {
	Connection con;
	public Dao(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/coaching","root","sanjay");
		}catch(Exception e){
		 e.printStackTrace();

		} 

	}
	public int saveToDatabase(Student s) throws SQLException{
		System.out.println("Inside save for student");
		PreparedStatement pr=con.prepareStatement("insert into student(FName,LName,Course,Date,Fees) values(?,?,?,?,?);");
			pr.setString(1, s.getsFName());
		pr.setString(2, s.getsLName());
		pr.setInt(3,Integer.parseInt( s.getsCourse()));
		pr.setString(4, s.getsRegDate());
		pr.setInt(5,Integer.parseInt(s.getsFees()));
		 
		return pr.executeUpdate();
	}
	public int saveToDatabase(Course s) {
		System.out.println("Inside save for course");
		PreparedStatement pr;
		try {
			pr = con.prepareStatement("insert into course(Name,Duration,Fees) values(?,?,?);");
			pr.setString(1, s.getcName());
			pr.setString(2, s.getcDuration());
			pr.setInt(3,Integer.parseInt(s.getcFees()));
			return pr.executeUpdate();
			
		} catch (SQLException e) {
 			e.printStackTrace();
		}
		return 0;
	}
	public ArrayList  courseList() throws SQLException{
		 
 			PreparedStatement pr=con.prepareStatement("select * from course;");
 			ArrayList<String> data=new ArrayList();	
 			ResultSet r=pr.executeQuery();
 			while(r.next())
			{	Long id=r.getLong(1);
			String name=r.getString(2);
 			data.add(id+"+"+name);
	 
	 		}
 			return data;		
 	}
	public ArrayList loadAllCourses() throws SQLException{
		PreparedStatement pr=con.prepareStatement("select * from course;");
			ArrayList<String> data=new ArrayList<>();	
			ResultSet r=pr.executeQuery();
			while(r.next())
		{	Long id=r.getLong(1);
		String name=r.getString(2);
		String duration =r.getString(3);
		long fees =r.getLong(4);
			data.add(id+"+"+name+"-"+duration+"*"+fees);
 
 		}
			return data;
	}
	public ArrayList<String> login(User u){
		String error=null;
		ArrayList<String> list=new ArrayList<>();
		try{
 			PreparedStatement pr=con.prepareStatement("select * from users where mobilenumber=? and password=?;");
 			pr.setString(1, u.getMobilenumber());
 			pr.setString(2, u.getPassword());
 			ResultSet r=pr.executeQuery();
 			boolean isFound=false;
 			while(r.next())
 			{	isFound=true;
 				
// 				error="name="+r.getString(2);
 				list.add(0,"no error");
 				list.add(1,r.getString(2)+"="+u.getMobilenumber());
 			}
 			if(!isFound)
 			{	error="Invalid Mobile number or password";
 				list.add(0,null);
				list.add(1,error);
 			}
 			System.out.println("inside signin r="+r+" error is"+error+list);
  		}catch(Exception e){
  			list.add(0, null);;
  			list.add(1, e.getMessage());
  		}
		
		return list;
	}
	public ArrayList<String> signup(User u){
		String error=null;
		ArrayList<String> list=new ArrayList<>();
		try{
 			PreparedStatement pr=con.
 					prepareStatement("insert into users(mobilenumber,name,password,gender,city) values(?,?,?,?,?);");
 			pr.setString(1, u.getMobilenumber());
			pr.setString(2, u.getName());
			pr.setString(3,u.getPassword());
			pr.setString(4,u.getGender());
			pr.setString(5,u.getCity());
			int r= pr.executeUpdate();
			error="name="+u.getName();
			System.out.println("inside signup");
			if(r<0){
				error="error occurred";
				list.add(0,null);
				list.add(1,error);
			}else{
				list.add(0,"no error");
				list.add(1,u.getName()+"="+u.getMobilenumber());
			}
			
			
  		}catch(Exception e){
		 error=e.getMessage();
		 list.add(0,null);								
		 if(e.getLocalizedMessage().toLowerCase().contains("duplicate"))
			 error="Mobile number already registred";
			 list.add(1,error);	
		}
		System.out.println("inside signup "+" error is"+error);
		return list;
	}
	public ArrayList<String> search(Student st) throws SQLException{
		ArrayList<String> data=new ArrayList<>();	
		String course=st.getsCourse();
		String fname=st.getsFName();
		String lname=st.getsLName();
		ArrayList<String> record=new ArrayList<String>();
 		if(fname!=null){
			record.add(" Fname like ?");
		}
		if(lname!=null){
			record.add(" Lname like ?");
		}
		if(course!=null&&!course.isEmpty()){
			record.add(" course like ?");
		}
		String query="";
		for(int i=0;i<record.size();i++){
			if(i!=0)
				query+=" and";
			query+=record.get(i);
		}
		query="select * from student where"+query+";";
		
		System.out.println(query+" =>"+record);
		PreparedStatement pr=con.prepareStatement(query);
		for(int i=0;i<record.size();i++){
		if(record.get(i).contains("course"))
		{		System.out.println("course"+course);

			pr.setString(i+1, course+"%");	
		}else if(record.get(i).contains("Fname"))
		{			System.out.println("fname"+fname);

			pr.setString(i+1, fname+"%");	
		}else if(record.get(i).contains("Lname"))
		{			System.out.println("lname"+lname);

			pr.setString(i+1, lname+"%");	
		}
		}
		ResultSet r=pr.executeQuery();
			boolean isEmpty=true;
			while(r.next())
		{	String name=""+r.getInt(1);
			isEmpty=false;
 			name+="="+r.getString(2);
 			name+="="+r.getString(3);
 			name+="="+getCourseName( r.getString(4));
 			data.add(name);
 		}	if(isEmpty)
 			data.add(null);
			data.add("First Name-Last Name-Course-Action");
			return data;
	}
	public String getCourseName(Object id){
		try {
			PreparedStatement pr=con.prepareStatement
					("select name from course where cid=?");
			pr.setObject(1, id);
			ResultSet r=pr.executeQuery();
			
			while(r.next())
		{	
 		return	r.getString(1);
 			
 			
 		}
		} catch (SQLException e) {
			e.printStackTrace();
 			return "not found";
		}
		return "not found";
	}
	public HashMap<Object, Object> getDetail(String id,String query) {
		HashMap<Object,Object> data=new HashMap<>();	
		try{	PreparedStatement pr=con.
				prepareStatement("select * from"+query);
			pr.setString(1, id);
			ResultSet r=pr.executeQuery();
			ResultSetMetaData metadata=r.getMetaData();
 			while(r.next())
		{	for(int i=1;i<=metadata.getColumnCount();i++)
				data.put(i,r.getObject(i));
		}
	}catch(Exception e){e.printStackTrace();
		data.put("error", e.getMessage());
	}
		System.out.println("edit student"+data);
			return data;
	}
	 
	public String update(Student st,String id) {
		String message;
	try{ArrayList<String> data=new ArrayList<>();	
	String course=st.getsCourse();
	String fname=st.getsFName();
	String lname=st.getsLName();
	String city=st.getsCity();
	String fees=st.getsFees();
 	ArrayList<String> record=new ArrayList<String>();
		if(fname!=null){
		record.add(" Fname= ?");
	}
	if(lname!=null){
		record.add(" Lname = ?");
	}
	if(course!=null&&!course.isEmpty()){
		record.add(" course = ?");
	}
	if(city!=null&&!city.isEmpty()){
		record.add(" city = ?");
	}
	if(fees!=null&&!fees.isEmpty()){
		record.add(" Fees = ?");
	}
	String query="";
	for(int i=0;i<record.size();i++){
		if(i!=0)
			query+=" ,";
		query+=record.get(i);
	}
	
	query="update student set "+query+"where sid=?;";
	
	System.out.println(query+" =>"+record);
	PreparedStatement pr=con.prepareStatement(query);
	for(int i=0;i<record.size();i++){
	if(record.get(i).contains("course"))
	{		System.out.println("course"+course);

		pr.setString(i+1, course);	
	}else if(record.get(i).contains("Fname"))
	{			System.out.println("fname"+fname);

		pr.setString(i+1, fname);	
	}else if(record.get(i).contains("Lname"))
	{			System.out.println("lname"+lname);

		pr.setString(i+1, lname);	
	}
	}
	pr.setString(record.size()+1,id);
	int r=pr.executeUpdate();
	
			if(r>0)
				message="Record updated Successfully";
			else
				message="Failed to update record"+"=";
	}catch(Exception e){
		message=e.getMessage();
	}
	return message;
	}
	public String update(Course st,String id) {
		String message;
	try{ArrayList<String> data=new ArrayList<>();	
	String coursename=st.getcName();
 	String duration=st.getcDuration();
	String fees=st.getcFees();
	System.out.println(""+coursename+duration+fees);
 	ArrayList<String> record=new ArrayList<String>();
		if(duration!=null){
		record.add(" Duration= ?");
	}
	if(fees!=null){
		record.add(" fees = ?");
	}
	if(coursename!=null&&!coursename.isEmpty()){
		record.add(" name = ?");
	}
	 
	String query="";
	for(int i=0;i<record.size();i++){
		if(i!=0)
			query+=",";
		query+=record.get(i);
	}
	
	query="update course set "+query+"where cid=?;";
	
	System.out.println(query+" =>"+record);
	PreparedStatement pr=con.prepareStatement(query);
	for(int i=0;i<record.size();i++){
	if(record.get(i).contains("name"))
	{		System.out.println("course"+coursename);

		pr.setString(i+1, coursename);	
	}else if(record.get(i).contains("Duration"))
	{			System.out.println("fname"+duration);

		pr.setString(i+1, duration);	
	}else if(record.get(i).contains("Fees"))
	{			System.out.println("lname"+fees);

		pr.setString(i+1, fees);	
	}
	}
	pr.setString(record.size()+1,id);
	int r=pr.executeUpdate();
			if(r>0)
				message="Record updated Successfully";
			else
				message="Failed to update record";
	}catch(Exception e){
		message=e.getMessage();
	}
	return message;
	}
	
	public String update(User st,String id,HttpSession session) {
		String message;
		String fname=st.getName();	
		String mobile=st.getMobilenumber();

	try{ArrayList<String> data=new ArrayList<>();	
	String password=st.getPassword();
	
	String city=st.getCity();
	String gender=st.getGender();
	System.out.println(fname+city+mobile+gender+password+"uid"+id);
  	ArrayList<String> record=new ArrayList<String>();
		if(fname!=null){
		record.add(" name= ?");
	}
	if(password!=null){
		record.add(" password = ?");
	}
	if(mobile!=null&&!mobile.isEmpty()){
		record.add(" mobilenumber = ?");
	}
	if(city!=null&&!city.isEmpty()){
		record.add(" city = ?");
	}
	if(gender!=null&&!gender.isEmpty()){
		record.add(" gender = ?");
	}
	String query="";
	for(int i=0;i<record.size();i++){
		if(i!=0)
			query+=" ,";
		query+=record.get(i);
	}
	
	query="update users set "+query+"where uid in(select uid where mobilenumber=?);";

 	System.out.println(query+" =>"+record);
	PreparedStatement pr=con.prepareStatement(query);
	for(int i=0;i<record.size();i++){
	if(record.get(i).contains("name"))
	{		

		pr.setString(i+1, fname);	
	}else if(record.get(i).contains("gender"))
	{			

		pr.setString(i+1, gender);	
	}else if(record.get(i).contains("city"))
	{			

		pr.setString(i+1, city);	
	}else if(record.get(i).contains("password"))
	{			

		pr.setString(i+1, password);	
	}else if(record.get(i).contains("mobile"))
	{			

		pr.setString(i+1, mobile);	
	}


	}
	pr.setString(record.size()+1,id);
	int r=pr.executeUpdate();
			if(r>0)
				message="Record updated Successfully";
			else
				message="Failed to update record";
	}catch(Exception e){
		e.printStackTrace();
		message=e.getMessage();
	}
	
	
	return message+checkSession(fname,mobile,session);
	}
	private String checkSession(String name,String number,HttpSession session){
		if(name!=null){
			session.setAttribute("USERNAME", name);
		}
		if(number!=null){
			session.setAttribute("MOBILENUMBER", number);
			return "="+number;
		}
		return "";
	}
	public String[] loadFees(String id) throws Exception{
		PreparedStatement pr=con.prepareStatement("select * from student where sid=?;");
		System.out.println("Fees"+id);
		String data[]=new String[10];
			pr.setString(1, id);
			ResultSet r=pr.executeQuery();
			while(r.next())
		{		data[0]=id;
				data[2]=getCourseName( r.getString(4))+"("+r.getString(4)+")";
		data[1]=r.getString(2)+" "+r.getString(3);
 		int fees   = r.getInt(6);
 		data[3]=String.valueOf(fees);
		int dep=(int) extractTotal(id);
 		data[4]=String.valueOf(dep);
		data[5]=String.valueOf(fees-dep);
		data[6]=r.getString(4);
			//data.add(name+"+"+course+"-"+duration+"*"+fees+"+"+);
		
			
 		}
			System.out.println(Arrays.asList(data));
			return data;
	}
	
	public long extractTotal(String id) {
		try{ PreparedStatement pr=con.prepareStatement("select sum(deposit) from fees where sid=?;");
		ArrayList<String> data=new ArrayList();	
		pr.setString(1, id);
		ResultSet r=pr.executeQuery();
		while(r.next()){
			return r.getLong(1);
		}
		}catch(Exception e){
			
		}
		return 0;
	}
	public String saveToDatabase(Fees f){
		if(f.getReceiptno()==null)
			f.setReceiptno(String.valueOf(System.currentTimeMillis()));
		System.out.println("Inside save fees cid"+f.getCid());
		String cid=f.getCid();
	f.setCid(cid.substring(cid.indexOf("(")+1,cid.indexOf(")")));	
		System.out.println("Inside save fees cid"+cid);
		//f.setCid();
		String error=null;
 		try{System.out.println("Inside save fees");
 			PreparedStatement pr=con.
 					prepareStatement("insert into fees values(?,?,?,?,?);");
 			pr.setLong(1,Long.parseLong(f.getReceiptno()));
			pr.setInt(2,Integer.parseInt(f.getSid()));
			pr.setInt(3,Integer.parseInt(f.getCid()));
			pr.setInt(4,Integer.parseInt(f.getDeposit()));
			pr.setString(5,f.getDate());
			int r= pr.executeUpdate();
			
			System.out.println("Inside save fees "+pr.toString());
			error="Fees deposited sucessfully";
 			if(r<0){
				error="Error:error occurred";
 			} 
			
			
  		}catch(Exception e){
  			e.printStackTrace();
		 error="Error:"+e.getMessage();
 		 if(e.getLocalizedMessage().toLowerCase().contains("duplicate"))
			 error="Error:Receipt number already exist";
 		}
		//System.out.println("inside signup "+" error is"+error);
		return error;
 	}
}
