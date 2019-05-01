package userInfor;

public class Teahw {
    private String id;
    private String hwName;
    private String hwFile;
    private String hwState;
    private String hwData;
    private int Nums;

    public Teahw(String i,String hn,String hf,String hs,String hd,int n){
        id = i;
        hwName = hn;
        hwFile = hf;
        hwState = hs;
        hwData = hd;
        Nums = n;
    }

    public int getNums() {
        return Nums;
    }

    public void setNums(int nums) {
        Nums = nums;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getHwFile() {
        return hwFile;
    }

    public String getHwData() {
        return hwData;
    }

    public String getHwName() {
        return hwName;
    };

    public String getHwState() {
        return hwState;
    }

    public void setHwData(String hwData) {
        this.hwData = hwData;
    }

    public void setHwFile(String hwFile) {
        this.hwFile = hwFile;
    }

    public void setHwName(String hwName) {
        this.hwName = hwName;
    }

    public void setHwState(String hwState) {
        this.hwState = hwState;
    }
}
