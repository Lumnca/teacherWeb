package userInfor;

public class Stuhw {
    private String hwName;
    private String cname;
    private String teaName;
    private String state;
    private String hwData;
    private String fileurl;
    private String filename;
    private String infor;
    private String myfile;
    public  Stuhw(){

    }
    public  Stuhw(String hw,String fn,String n,String hd,String cn,String f,String in){
        hwName = hw;
        filename = fn;
        teaName = n;
        hwData = hd;
        cname = cn;
        state = f;
        infor = in;
    }
    public  Stuhw(String hw,String c,String th,String s,String hd,String pa,String ch,String in,String my){
        hwName = hw;
        cname = c;
        teaName = th;
        state = s;
        hwData = hd;
        fileurl = pa+"/"+ch;
        filename = ch;
        infor = in;
        myfile = my;
    }

    public String getMyfile() {
        return myfile;
    }

    public void setMyfile(String myfile) {
        this.myfile = myfile;
    }

    public String getInfor() {
        return infor;
    }

    public void setInfor(String infor) {
        this.infor = infor;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFileurl() {
        return fileurl;
    }

    public void setFileurl(String fileurl) {
        this.fileurl = fileurl;
    }

    public void setHwName(String hwName) {
        this.hwName = hwName;
    }

    public String getHwName() {
        return hwName;
    }

    public void setHwData(String hwData) {
        this.hwData = hwData;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCname() {
        return cname;
    }

    public String getHwData() {
        return hwData;
    }

    public String getTeaName() {
        return teaName;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setTeaName(String teaName) {
        this.teaName = teaName;
    }
}
