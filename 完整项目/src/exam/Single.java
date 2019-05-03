package exam;

public class Single {
    private String id;
    private int no;
    private  String sid;
    private String title;
    private String op_A;
    private String op_B;
    private String op_C;
    private String op_D;
    private String op_E;
    private String answer;

    public Single(){

    }
    public Single(String i,String sid,String t,String a,String b,String c,String d,String an,int n){
        id = i;
        this.sid = sid;
        no = n;
        title = t;
        op_A = a;
        op_B = b;
        op_C = c;
        op_D = d;
        answer = an;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
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

    public String getAnswer() {
        return answer;
    }

    public String getOp_A() {
        return op_A;
    }

    public String getOp_B() {
        return op_B;
    }

    public String getOp_C() {
        return op_C;
    }

    public String getOp_D() {
        return op_D;
    }

    public String getOp_E() {
        return op_E;
    }

    public String getTitle() {
        return title;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public void setOp_A(String op_A) {
        this.op_A = op_A;
    }

    public void setOp_B(String op_B) {
        this.op_B = op_B;
    }

    public void setOp_C(String op_C) {
        this.op_C = op_C;
    }

    public void setOp_D(String op_D) {
        this.op_D = op_D;
    }

    public void setOp_E(String op_E) {
        this.op_E = op_E;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
