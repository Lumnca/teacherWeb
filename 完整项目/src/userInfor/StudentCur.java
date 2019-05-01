package userInfor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentCur {

    public List<StuCur> StuList;
    public StudentCur(){
        StuList = new ArrayList<>();
    }
    public void GetStuCurList(ResultSet rs)throws SQLException {
        while (rs.next()){
                StuList.add(new StuCur(rs.getString(1),rs.getString(2),rs.getString(3),
                        rs.getString(4),rs.getString(5)));
        }

    }
}
