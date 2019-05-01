package userInfor;

import java.sql.ResultSet;
import java.sql.SQLException;

public class studentData {
    public String id;
    public int classNum;
    public int workNum;
    public int talkNum;
    public int examNum;
    public int quseNuml;
    public int shareNum;

    public  studentData(){

    }
    public studentData(String i,int c,int w,int t,int e,int q2,int s){
        id = i;
        classNum = c;
        workNum = w;
        talkNum = t;
        examNum = e;
        quseNuml = q2;
        shareNum = s;
    }
    public void GetInfor(ResultSet rs)throws SQLException {
        while(rs.next()){
            this.id = rs.getString(1);
            this.classNum = rs.getInt(2);
            this.examNum = rs.getInt(3);
            this.workNum = rs.getInt(4);
            this.talkNum = rs.getInt(5);
            this.quseNuml = rs.getInt(6);
            this.shareNum = rs.getInt(7);
        }
    }
}
