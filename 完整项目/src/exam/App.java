package exam;

public class App {
    private  String id;
    private  String aid;
    private  String title;
    private  String mark;
    private  int no;
    public App(){

    }
    public App(String i,String a,String t,String ma,int n){
        id = i;
        aid = a;
        title = t;
        mark = ma;
        no = n;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getNo() {
        return no;
    }

    public String getTitle() {
        return title;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAid() {
        return aid;
    }

    public String getMark() {
        return mark;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }
}
