package onlineexam;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Part;

public class Dac {
	

	static String fileName;

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online", "root", "");
		} catch (Exception e) {
		}
		return con;
	}

	public static int save(Bean1 e) {
		Connection con = Dac.getConnection();
		int status = 0;
		try {

			PreparedStatement stmt = con.prepareStatement(
					"insert into test1(username,password,email,mob,yop,aadhar,resume,filename,type)values(?,?,?,?,?,?,?,?,?)");
			stmt.setString(1, e.getName());
			stmt.setString(2, e.getPass2());
			stmt.setString(3, e.getEmail());
			stmt.setLong(4, e.getMob());
			stmt.setInt(5, e.getYop());
			stmt.setString(6, e.getAadhar());
			stmt.setString(8, e.getResume().getSubmittedFileName());
			stmt.setString(9, "candidate");

			InputStream inputstream = e.getResume().getInputStream();

			// fetches input stream of the upload file for the blob column
			stmt.setBinaryStream(7, inputstream, (int) e.getResume().getSize());

			status = stmt.executeUpdate();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return status;

	}

	public static String validate(String name, String pass) {

		String type = "invalid";

		try {

			Connection con = Dac.getConnection();
			System.out.println("got connection" +name + "" + pass );
			
			PreparedStatement pst = con.prepareStatement("select username, password from test1 where username=? and password=?");
			System.out.println("query executed");
			pst.setString(1, name);
			pst.setString(2, pass);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				
				
				type = rs.getString(1);
				System.out.println("type " + type);

			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return type;

	}

	public static int saveQn(Bean2 b) {
		int status = 0;
		try {
			Connection con = Dac.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"insert into test(Domain,Question,Option1,Option2,Option3,Option4,Answer)values(?,?,?,?,?,?,?)");
			ps.setString(1, b.getDom());
			ps.setString(2, b.getQuest());
			ps.setString(3, b.getO1());
			ps.setString(4, b.getO2());
			ps.setString(5, b.getO3());
			ps.setString(6, b.getO4());
			ps.setString(7, b.getAns());

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
		}

		return status;
	}

	public static Bean1 getEmployeeByName(String name) {
		Bean1 e = new Bean1();
		try {
			Connection con = Dac.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from test1 where username=?");
			ps.setString(1, name);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				e.setName(rs.getString(1));
				e.setPass2(rs.getString(2));
				e.setEmail(rs.getString(3));
				e.setMob(rs.getLong(4));
				e.setYop(rs.getInt(5));
				e.setAadhar(rs.getString(6));

			}
			con.close();
		} catch (Exception d) {
			System.out.println(d);
		}

		return e;

	}

	public static int updateAdm(Bean1 b,String name) {
		int status = 0;

		try {

			Connection con = Dac.getConnection();
			InputStream inputstream;
			/*
			 * PreparedStatement
			 * ps=con.prepareStatement("select resume from test1 where id=?"); ps.setInt(1,
			 * b.getId()); ResultSet rs=ps.executeQuery(); while(rs.next()) { InputStream
			 * inputstream= }
			 */
			PreparedStatement ps = con.prepareStatement(
					"update test1 set username=?,password=?,email=?,mob=?,yop=?,aadhar=? where username=? ");

			ps.setString(1, b.getName());
			ps.setString(2, b.getPass2());
			ps.setString(3, b.getEmail());
			ps.setLong(4, b.getMob());
			ps.setInt(5, b.getYop());
			ps.setString(6, b.getAadhar());
			ps.setString(7, name);

			

			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static List getMarks() {
		List list = new ArrayList();
		try {

			Connection con = Dac.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select * from marks order by marks desc ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
				list.add(rs.getInt(2));
				list.add(rs.getString(3));
				list.add(rs.getDate(4));
				list.add(rs.getString(5));
				//list.add(rs.getDomain(5));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;

	}

	public static List<Bean2> getQuestionsByDomain(String dom) {
		List<Bean2> list = new ArrayList<Bean2>();
		try {

			Connection con = Dac.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from test where domain=? ");
			ps.setString(1, dom);
			ResultSet rs = ps.executeQuery();

			while (rs.next())

			{
				Bean2 b = new Bean2();
				b.setId(rs.getInt(1));
				b.setDom(rs.getString(2));
				b.setQuest(rs.getString(3));
				b.setO1(rs.getString(4));
				b.setO2(rs.getString(5));
				b.setO3(rs.getString(6));
				b.setO4(rs.getString(7));
				b.setAns(rs.getString(8));

				list.add(b);
			}

			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public static List<Bean2> getQuestionsByDom(String dom) {
		List<Bean2> list = new ArrayList<Bean2>();
		try {

			Connection con = Dac.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from test where domain=? order by RAND() LIMIT 20");
			ps.setString(1, dom);
			ResultSet rs = ps.executeQuery();

			while (rs.next())

			{
				Bean2 b = new Bean2();
				b.setId(rs.getInt(1));
				b.setDom(rs.getString(2));
				b.setQuest(rs.getString(3));
				b.setO1(rs.getString(4));
				b.setO2(rs.getString(5));
				b.setO3(rs.getString(6));
				b.setO4(rs.getString(7));
				b.setAns(rs.getString(8));

				list.add(b);
			}

			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public static Bean2 getQnById(int id) {
		Connection con = Dac.getConnection();
		Bean2 e = new Bean2();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from test where id=?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				System.out.println("am in editqndac");
				System.out.println(rs.getString(3));
				e.setId(rs.getInt(1));
				e.setDom(rs.getString(2));
				e.setQuest(rs.getString(3));
				e.setO1(rs.getString(4));
				e.setO2(rs.getString(5));
				e.setO3(rs.getString(6));
				e.setO4(rs.getString(7));
				e.setAns(rs.getString(8));
			}
			con.close();
		} catch (Exception e1) {
			System.out.println(e1);
		}

		return e;

	}

	public static List<Bean2> getAllQuestions() {
		List<Bean2> list = new ArrayList<Bean2>();
		Connection con = Dac.getConnection();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from test");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) { // System.out.println(rs.getString(3));
				Bean2 e = new Bean2();
				e.setId(rs.getInt(1));
				e.setDom(rs.getString(2));
				e.setQuest(rs.getString(3));
				e.setO1(rs.getString(4));
				e.setO2(rs.getString(5));
				e.setO3(rs.getString(6));
				e.setO4(rs.getString(7));
				e.setAns(rs.getString(8));

				list.add(e);
			}
			con.close();
		} catch (Exception e1) {
			System.out.println(e1);
		}
		return list;

	}

	public static int editQn(Bean2 b) {
		int status = 0;
		try {
			Connection con = Dac.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"update test set question=?,option1=?,option2=?,option3=?,option4=?,answer=?,domain=? where id=?");
			ps.setString(1, b.getQuest());
			ps.setString(2, b.getO1());
			ps.setString(3, b.getO2());
			ps.setString(4, b.getO3());
			ps.setString(5, b.getO4());
			ps.setString(6, b.getAns());
			ps.setString(7, b.getDom());
			ps.setInt(8, b.getId());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
		}

		return status;
	}

	public static int delete(int id) {
		int status = 0;
		Connection con = Dac.getConnection();
		try {
			PreparedStatement stmt = con.prepareStatement("Delete from test where id=?");
			stmt.setInt(1, id);
			status = stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int saveMarks(int marks,String name,String domain) {
		int status = 0;
		java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
		Connection con = Dac.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("insert into marks values(?,?,?,?,?)");
			ps.setString(1, name);
			ps.setInt(2, marks);
			ps.setDate(4,date);
			ps.setString(5, domain);
			if (marks > 0) {
				ps.setString(3, "Passed");
			} else {
				ps.setString(3, "Failed");
			}
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;

	}

	public static List<Bean1> getAllCandidates(String type) {

		List<Bean1> list = new ArrayList<Bean1>();
		Connection con = Dac.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(
					"select username,password,mob,yop,email,aadhar from test1 where type=? ");
			ps.setString(1, type);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Bean1 e = new Bean1();
				e.setName(rs.getString(1));
				e.setPass2(rs.getString(2));
				e.setMob(rs.getLong(3));
				e.setYop(rs.getInt(4));
				e.setEmail(rs.getString(5));
				e.setAadhar(rs.getString(6));

				list.add(e);
			}
			System.out.println(list);
		} catch (Exception e1) {
			System.out.println(e1);
		}
		return list;
	}

	public static InputStream getResume(String name) {
		Connection con = Dac.getConnection();
		InputStream inputStream = null;

		try {
			
			PreparedStatement ps = con.prepareStatement("select resume,filename from test1 where username=?");
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				inputStream = rs.getBinaryStream(1);;
				fileName = rs.getString(2);

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return inputStream;
	}

	public static void deleteCandidate(String name) {
		Connection con = Dac.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("delete from test1 where username=?");
			ps.setString(1, name);

			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static void clearMarks() {
		Connection con = Dac.getConnection();
		try {
			

			PreparedStatement ps = con.prepareStatement(
					
					"delete from marks");
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static int check(String name) {
		Connection con = Dac.getConnection();
		int status = 0;
		try {

			PreparedStatement ps = con.prepareStatement("select * from test1 where username=?");
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				status = 1;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}
	public static int checkemail(String email) {
		Connection con = Dac.getConnection();
		int status = 0;
		try {

			PreparedStatement ps = con.prepareStatement("select * from test1 where email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				status = 1;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}
	
	public static int checkmob(long mob) {
		Connection con = Dac.getConnection();
		int status = 0;
		try {

			PreparedStatement ps = con.prepareStatement("select * from test1 where mob=?");
			ps.setLong(1, mob);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				status = 1;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}
}
