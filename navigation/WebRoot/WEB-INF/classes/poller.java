import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class poller {

	/**
database: 192.168.32.250:1433

username: ITILuser

password: user@itil

dbname: ztgame

select * from store_ITIL  --存放地

select * from orgunit_ITIL  --组织信息

select * from human_ITIL  --人员信息

select * from project_ITIL --项目信息

 
select * from (select * from MEP_ADDR m left join  alndomain a on a.domainid ='MEP_ADDR' and m.address = a.value ) x where x.domainid is null

insert into alndomain values ('MEP_ADDR','aaaa','2222',null,null,alndomainseq.nextval,null);

select * from (select * from mep_project m left join  alndomain a on a.domainid ='MEP_PROJECT' and m.project = a.value ) x where x.domainid is null

insert into alndomain values ('MEP_PROJECT','aaaa','2222',null,null,alndomainseq.nextval,null);

	 */
	
	static Connection con= null;
	static Connection consql= null;
	static Connection consql2;
	
	public poller(){
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			consql = DriverManager.getConnection("jdbc:sqlserver://192.168.32.250:1433;databaseName=ztgame;user=ITILuser;password=user@itil;");
//			consql2 = DriverManager.getConnection("jdbc:sqlserver://192.168.32.253:1433;databaseName=ztgame253;user=sa;password=zt123@game+;");
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.29.25:1521:orcl","maximo","orcl531");
		}catch (Exception e){
			e.printStackTrace();
		}

	}
	
	
	 public void chkAddr() throws SQLException{
		Statement st = con.createStatement();
		Statement st2 = con.createStatement();
		ResultSet rs = st.executeQuery("select address,code from (select * from MEP_ADDR m left join  alndomain a on a.domainid ='MEP_ADDR' and m.address = a.value ) x where x.domainid is null");
		while(rs.next()){
			st2.execute("insert into alndomain values ('MEP_ADDR','"+rs.getString("address")+"','"+rs.getString("code")+"',null,null,alndomainseq.nextval,null)");
			System.out.println("insert into alndomain values ('MEP_ADDR','"+rs.getString("address")+"','"+rs.getString("code")+"',null,null,alndomainseq.nextval,null)");
		}
		st.close();
		st2.close();
	}
	public void chkProj() throws SQLException{
		Statement st = con.createStatement();
		Statement st2 = con.createStatement();
		ResultSet rs2 = 
			st.executeQuery("select code,project from (select * from mep_project m left join  alndomain a on a.domainid ='MEP_PROJECT' and m.project = a.value ) x where x.domainid is null");
		while(rs2.next()){
			st2.execute("insert into alndomain values ('MEP_PROJECT','"+rs2.getString("project")+"','"+rs2.getString("code")+"',null,null,alndomainseq.nextval,null)");
			System.out.println("insert into alndomain values ('MEP_PROJECT','"+rs2.getString("project")+"','"+rs2.getString("code")+"',null,null,alndomainseq.nextval,null)");
		}
		st.close();
		st2.close();
	}
	public void updateAddr()throws SQLException{
//		Statement st = 
//			consql.createStatement();
//		Statement st2 = 
//			con.createStatement();
//		ResultSet rs = st.executeQuery("select storeno,storename from store_ITIL");
//		st2.execute("truncate table MEP_ADDR");
//		st2.execute("insert into MEP_ADDR values('0','借用归还')");
//		st2.execute("insert into MEP_ADDR values('0','已退库')");
//		while(rs.next()){
//			st2.execute("insert into MEP_ADDR values('"+rs.getString("storeno")+"','"+rs.getString("storename")+"')");
//		}
//		rs.close();
//		st.close();
//		st2.close();
		Statement st = 
			consql.createStatement();
		Statement st2 = 
			con.createStatement();
		Statement st3 = 
			con.createStatement();
		ResultSet rs = st.executeQuery("select storeno,storename from store_ITIL order by storeno ");
		String sql;
		/*
		ResultSet rs2 = st2.executeQuery("select code,address from mep_addr order by code ");
		boolean next = true;
		while(rs2.next()){
			if(!"0".equals(rs2.getString("code"))){
				next=false;
				break;
			}
		}
		
		
		while(rs.next()){
			String c1=rs.getString("storeno"),p1=rs.getString("storename");
			if(next){
				if(!rs2.next()){
					//
					do{
						//insert into 
						sql = "insert into mep_addr values('"+rs.getString("storeno")+"','"+rs.getString("storename")+"')";
						st3.execute(sql);
						System.out.println(sql);
					}
					while(rs.next());
					break;
				}
			}
			String c2=rs2.getString("code"),p2=rs2.getString("address");
			if(c1.equals(c2)){
				next = true;
				if(!p1.equals(p2)){
					//update
					sql = "update mep_addr set address ='"+p1+"' where code = '"+c1+"'";
					System.out.println(sql+"  "+st3.executeUpdate(sql ));
					sql = "update asset set ASSETROOM_MEP   ='"+p1+"' where ASSETROOM_MEP   = '"+p2+"'";
					System.out.println(sql+"  "+st3.executeUpdate(sql ));

				}
			}
			else{
				//insert
				next = false;
				sql = "insert into mep_addr values('"+rs.getString("storeno")+"','"+rs.getString("storename")+"')";
				st3.execute(sql);
				System.out.println(sql);
			}
			
//			st2.execute("insert into MEP_project values('"+rs.getString("projectno")+"','"+rs.getString("projectname")+"')");
		}
		
		while(rs2.next()){
			sql = "delete from  mep_addr where code = '"+rs2.getString("code")+"'";
			st3.execute(sql);
			System.out.println(sql);
		}
		*/
		
		//全部删除然后添加
		sql = "delete from  mep_addr";
		st3.execute(sql);
		System.out.println(sql);
		
		while(rs.next()){
			sql = "insert into mep_addr values('"+rs.getString("storeno")+"','"+rs.getString("storename")+"')";
			st3.execute(sql);
			System.out.println(sql);
		}
		
		
		st.close();
		st2.close();
		st3.close();	
		
	}
	public void updateProj()throws SQLException{
		Statement st = 
			consql.createStatement();
		Statement st2 = 
			con.createStatement();
		Statement st3 = 
			con.createStatement();
		ResultSet rs = st.executeQuery("select projectno,projectname from project_ITIL order by projectno ");
		ResultSet rs2 = st2.executeQuery("select code,project from mep_project order by code ");
		String sql;
		boolean next = true;
		while(rs.next()){
			String c1=rs.getString("projectno"),p1=rs.getString("projectname");
			if(next){
				if(!rs2.next()){
					//
					do{
						//insert into 
						sql = "insert into MEP_project values('"+rs.getString("projectno")+"','"+rs.getString("projectname")+"')";
						st3.execute(sql);
						System.out.println(sql);
					}
					while(rs.next());
					break;
				}
			}
			String c2=rs2.getString("code"),p2=rs2.getString("project");
			if(c1.equals(c2)){
				next = true;
				if(!p1.equals(p2)){
					//update
					sql = "update MEP_project set project ='"+p1+"' where code = '"+c1+"'";
					System.out.println(sql+"  "+st3.executeUpdate(sql ));
					sql = "update asset set PROJECT_MEP  ='"+p1+"' where PROJECT_MEP  = '"+p2+"'";
					System.out.println(sql+"  "+st3.executeUpdate(sql ));

				}
			}
			else{
				//insert
				next = false;
				sql = "insert into MEP_project values('"+rs.getString("projectno")+"','"+rs.getString("projectname")+"')";
				st3.execute(sql);
				System.out.println(sql);
			}
			
//			st2.execute("insert into MEP_project values('"+rs.getString("projectno")+"','"+rs.getString("projectname")+"')");
		}
		while(rs2.next()){
			sql = "delete from  MEP_project where code = '"+rs2.getString("code")+"'";
			st3.execute(sql);
			System.out.println(sql);

		}
		st.close();
		st2.close();
		st3.close();
	}
	public void updatePerson()throws SQLException{
		Statement st = 
			consql.createStatement();
		
		PreparedStatement ps = 
			con.prepareStatement("select * from mep_person where personcode=?");
		ResultSet rs = st.executeQuery("select humno,humname,deptno,deptname from human_ITIL");
		ResultSet rs2 =null;
//		st2.execute("truncate table MEP_project");
		while(rs.next()){
			ps.setString(1, rs.getString("humno"));
			rs2 = ps.executeQuery();
			if(!rs2.next()){
//				st2.execute("insert into MEP_project values('"+rs.getString("projectno")+"','"+rs.getString("projectname")+"')");
				insertorupdateperson(true,rs.getString("humno"),rs.getString("humname"),rs.getString("deptno"));
			}
			else if(rs2.getString("deptcode").equals(rs.getString("deptno"))
						&&rs2.getString("name").equals(rs.getString("humname")))
			{
			}
			else{
				insertorupdateperson(false,rs.getString("humno"),rs.getString("humname"),rs.getString("deptno"));
			}
		}
		rs.close();
		st.close();
		ps.close();
	}
	public void insertorupdateperson(boolean insert ,String personcode,String personname,String deptcode)throws SQLException{
		Statement st = 
			consql.createStatement();
		ResultSet rs = st.executeQuery("select * from orgunit_ITIL where deptno ='"+deptcode+"'");
		String dept= "";
		if(rs.next()){
			dept = rs.getString("coname")+"-"+rs.getString("centername")+"-"+rs.getString("deptname");
		}
		Statement st2 = 
			con.createStatement();
		if(insert)
		{
			st2.execute("insert into mep_person values(mep_personidseq.nextval,'"+personname+"','"+deptcode+"','"+dept+"','"+personcode+"')");
			System.out.println("insert into mep_person values(mep_personidseq.nextval,'"+personname+"','"+deptcode+"','"+dept+"','"+personcode+"')");
		}
		else{
			st2.execute("update mep_person set name='"+personname+"',deptcode='"+deptcode+"',dept='"+dept+"' where personcode ='"+personcode+"'");
			System.out.println("update mep_person set name='"+personname+"',deptcode='"+deptcode+"',dept='"+dept+"' where personcode ='"+personcode+"'");
		}
		st2.close();
	}
//	public void insertperson()throws SQLException{
//		Statement st2 = 
//			con.createStatement();
//		st2.execute("insert into mep_person values()");
//		st2.close();
//	}
	
	public void sysinfo()throws SQLException{
		Statement st = consql.createStatement(); 
		Statement st2 = con.createStatement(); 
		PreparedStatement storcl = con.prepareStatement("insert into sysinfo values(sysinfoidseq.nextval,?,?)"); 
		ResultSet rs = st.executeQuery("select * from sysinfo_ITIL");
		System.out.println(rs.getMetaData().getColumnName(1));
		System.out.println(rs.getMetaData().getColumnName(2));
//		storcl.executeUpdate(sql)
		boolean b = true;
		while(rs.next()){
			if(b){
				st2.execute("truncate table sysinfo");
				b = false;
			}
			System.out.println(rs.getString("sysno")+"   "+rs.getString("sysno"));
			storcl.setString(1, rs.getString("sysno"));
			storcl.setString(2, rs.getString("sysname"));
			storcl.executeUpdate();
		}
	}
	public void run (){
		try{
			
			//系统信息
			sysinfo();
			//机房
			updateAddr();
			chkAddr();
			//核算项目
			updateProj();
			chkProj();
			//人员
			updatePerson();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				con.close();
				consql.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
	}

	public void close(){
		try{
			con.close();
			consql.close();
		}catch (Exception e){
			e.printStackTrace();
		}
		
	}
	public static void main(String[] args) {
//		poller.sqlserver();
//		poller.oracle();
		
		while(true){
			System.out.println("start "+(new java.sql.Date(System.currentTimeMillis())).toString());
			poller p = new poller();
			p.run();
			p.close();
			System.out.println("end ");
			
			try{
				Thread.sleep(1000*60*60*24);
			}catch(Exception e ){
				
			}
		}
		
		
	}
}
