package userInfor;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TeacherCur {
    public List<Cur> CurList;
    private int curnum;
    private String id;
    private String name;
    public TeacherCur(){
        CurList = new ArrayList<>();

    }
    public TeacherCur(String id,String name,int n){
        CurList = new ArrayList<>();
           this.id = id;
           this.name = name;
           this.curnum = n;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void GetInfro(ResultSet rs){
        try{
            while (rs.next()){
                CurList.add(
                        new Cur(rs.getString(4),rs.getString(3),
                                rs.getInt(5),rs.getString(6))
                );
            }

        }
        catch (Exception e){
            System.out.println("错误信息:"+e.getMessage());
            e.printStackTrace();
        }
    }

}
