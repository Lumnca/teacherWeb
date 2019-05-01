package userInfor;

public class User {

    public String ID;
    public String Name;
    public String sex;
    public String sfn;
    public String tel;
    public String school;
    public String infor;
    private String password;
    public Object data;
    public Object cur;
    public  User(){

    }
    public  User(String id,String n,String password,String sf){
        ID =id;
        Name = n;
        this.password = password;
        sfn = sf;
    }
    public String getID() {
        return ID;
    }
    public void setID(String ID) {
        this.ID = ID;
    }
    public void setName(String Name) {
        this.Name = Name;
    }
    public String getName() {
        return Name;
    }

    public void setSfn(String sfn) {
        this.sfn = sfn;
    }

    public String getSfn() {
        return sfn;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
