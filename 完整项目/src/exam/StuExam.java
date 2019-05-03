package exam;

public class StuExam {
    private String name;
    private String testName;
    private int grade;
    private String date;

    public StuExam(){

    }
    public StuExam(String n,String tn,int g,String d){
        name = n;
        testName = tn;
        grade = g;
        date = d;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getGrade() {
        return grade;
    }

    public String getTestName() {
        return testName;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }
}
