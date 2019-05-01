package userInfor;

import org.apache.poi.ss.formula.functions.Na;

import java.io.Reader;

public class TalkInfor {

    private String id;
    private String name;
    private String text;
    private String date;
    private int good;
    private int retalk;
    private String rename;
    public TalkInfor(){

    }
    public TalkInfor(String id,String name,String text,String date,int good,int retalk,String rename){
        this.id = id;
        this.name = name;
        this.text = text;
        this.date = date;
        this.good = good;
        this.retalk = retalk;
        this.rename = rename;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public int getGood() {
        return good;
    }

    public int getRetalk() {
        return retalk;
    }

    public String getDate() {
        return date;
    }

    public String getText() {
        return text;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getRename() {
        return rename;
    }

    public void setGood(int good) {
        this.good = good;
    }

    public void setRename(String rename) {
        this.rename = rename;
    }

    public void setRetalk(int retalk) {
        this.retalk = retalk;
    }
}
