package userInfor;

import java.sql.ResultSet;

public class Cur {
    private String cno;
    private String cname;
    private int cnum;
    private   String state;
    public Cur(){

    }
    public Cur(String s1, String s2, int s3, String s4){
        cno = s1;
        cname = s2;
        cnum = s3;
        state = s4;
    }

    public int getCnum() {
        return cnum;
    }

    public void setCnum(int cnum) {
        this.cnum = cnum;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }
}
