package mysql;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class GetDb {
     public Context ctx;
     public DataSource ds;
     public Statement statement;
     public ResultSet rs;
     public Connection conn;
     public PreparedStatement preStatement;
     public GetDb(){
         try {
             ctx = new InitialContext();
             ds = (DataSource)ctx.lookup("java:comp/env/jdbc/teachingData");
             conn = ds.getConnection();
             System.out.println("********数据获取连接*******");
         }
         catch (Exception e){
             System.out.println("错误信息"+e.getMessage());
         }
     }
     public ResultSet GetResult(String sql)
     {
         try {
             ctx = new InitialContext();
             ds = (DataSource)ctx.lookup("java:comp/env/jdbc/teachingData");
             conn = ds.getConnection();
             statement = conn.createStatement();
             rs = statement.executeQuery(sql);
         }
         catch (Exception e){
                System.out.println("错误信息"+e.getMessage());
         }
         return rs;
     }
     public void GetPreparedStatement (String sql){
         try {
             ctx = new InitialContext();
             ds = (DataSource)ctx.lookup("java:comp/env/jdbc/teachingData");
             conn = ds.getConnection();
             preStatement = conn.prepareStatement(sql);
            System.out.println("********数据库获取连接******");
         }
         catch (Exception e){
             System.out.println("错误信息"+e.getMessage());
         }
     }
     public int InsertData(String sql){
         int flag=0;
         try {
             ctx = new InitialContext();
             ds = (DataSource)ctx.lookup("java:comp/env/jdbc/teachingData");
             conn = ds.getConnection();
             statement = conn.createStatement();
             flag = statement.executeUpdate(sql);

         }
         catch (Exception e){
             System.out.println("错误信息"+e.getMessage());
         }
         return flag;
     }
     public void CloseAll()throws SQLException,NamingException {
         if(rs!=null){
             rs.close();
         }
         if(preStatement!=null){
             preStatement.close();
         }
         if(statement!=null){
             statement.close();
         }
         if(conn!=null){
             conn.close();
         }
         if(ctx!=null){
             ctx.close();
         }
         System.out.println("-------------数据库释放-------------");
     }

}
