package userInfor;

public class CurStudent {
    public  String name;
    public  String id;
    public  String cname;
    public  String sex;
    public  String school;

    public  CurStudent(){

    }
    public  CurStudent(String n,String i,String c,String s,String sc){
        name = n;
        id = i;
        cname = c;
        sex =s;
        school = sc;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
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

    public String getSchool() {
        return school;
    }

    public String getSex() {
        return sex;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
}
