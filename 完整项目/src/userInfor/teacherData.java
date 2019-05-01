package userInfor;

import java.sql.ResultSet;
import java.sql.SQLException;

public class teacherData {

    public String id;
    public int good;
    public int classNum;
    public int shareNum;
    public int quesNum;
    public int stuNum;

    public  teacherData(){

    }
    public  teacherData(String i,int g,int c,int s,int q,int num){
        id = i;
        good = g;
        classNum = c;
        shareNum = s;
        quesNum = q;
        stuNum = num;
    }
    public void GetInfor(ResultSet rs)throws SQLException {
        while(rs.next()){
            this.id = rs.getString(1);
            this.good = rs.getInt(3);
            this.classNum = rs.getInt(2);
            this.shareNum = rs.getInt(6);
            this.quesNum = rs.getInt(5);
            this.stuNum = rs.getInt(4);
        }
    }
}
