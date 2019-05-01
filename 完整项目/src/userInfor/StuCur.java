package userInfor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StuCur {
    private String name;
    private String id;
    private String teaname;
    private String teasex;
    private String cno;
    private String cname;
    private String teascl;
    public StuCur(){

    }
    public StuCur(String tn, String ts, String co, String cn, String tsc){
        teaname = tn;
        cname = ts;
        cno = co;
        teasex = cn;
        teascl = tsc;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getTeaname() {
        return teaname;
    }

    public void setTeaname(String teaname) {
        this.teaname = teaname;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCno() {
        return cno;
    }

    public String getCname() {
        return cname;
    }

    public void setTeascl(String teascl) {
        this.teascl = teascl;
    }

    public String getTeascl() {
        return teascl;
    }

    public String getTeasex() {
        return teasex;
    }

    public void setTeasex(String teasex) {
        this.teasex = teasex;
    }
}
