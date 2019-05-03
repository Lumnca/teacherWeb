package exam;

public class Judge {
    private String id;
    private int   no;
    private String jid;
    private String title;
    private String op_One;
    private String op_Two;
    private int answer;
    public Judge(){

    }
    public Judge(String i,String j,String t,String one,String teo,int a,int n){
        id =i;
        no =n;
        jid = j;
        title = t;
        op_One = one;
        op_Two = teo;
        answer = a;
    }

    public String getJid() {
        return jid;
    }

    public void setJid(String jid) {
        this.jid = jid;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public void setAnswer(int answer) {
        this.answer = answer;
    }

    public String getTitle() {
        return title;
    }

    public int getNo() {
        return no;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public int getAnswer() {
        return answer;
    }

    public String getOp_One() {
        return op_One;
    }

    public String getOp_Two() {
        return op_Two;
    }

    public void setOp_One(String op_One) {
        this.op_One = op_One;
    }

    public void setOp_Two(String op_Two) {
        this.op_Two = op_Two;
    }
}
