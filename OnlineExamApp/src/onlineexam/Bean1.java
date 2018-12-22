package onlineexam;
import java.io.Serializable;
import java.util.Date;

import javax.servlet.http.Part;

public class Bean1 implements Serializable {
	
	private String name,pass2,email,aadhar,pan,dob, fileName;
	private long mob;
	Part filePart;
	int yop;
	
	
	
	public void setName(String name)
	{
		this.name=name;
	}
	public void setPass2(String pass2)
	{
		this.pass2=pass2;
	}
	public void setEmail(String email)
	{
		this.email=email;
	}
	public void setMob(long mob)
	{
		this.mob=mob;
	}
	public void setYop(int yop)
	{
		this.yop=yop;
	}
	
	public void setDob(String dob)
	{
		this.dob=dob;
	}
	
	public void setAadhar(String aadhar)
	{
		this.aadhar=aadhar;
	}
	
	public void setPan(String pan)
	{
		this.pan=pan;
	}
	
	public void setResume(Part filePart )
	{
		this.filePart=filePart;
	}
	
	

	public String getName()
	{
		return name;
	}
	public String getPass2()
	{
		return pass2;
	}
	public String getEmail()
	{
		return email;
	}
	public long getMob()
	{
		return mob;
	}
	public int getYop()
	{
		return yop;
	}
	
	public String getDob()
	{
		return dob;
	}
	
	public String getAadhar()
	{
		return aadhar;
	}
	
	public String getPan()
	{
		return pan;
	}
	public Part getResume()
	{
		return filePart;
	}
	


}
