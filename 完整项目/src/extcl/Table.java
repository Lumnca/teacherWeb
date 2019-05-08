package extcl;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import static javax.xml.bind.JAXBIntrospector.getValue;

public class Table {
    static public void Insert(List<TableData> data,Workbook wb,String url)throws IOException
    {
        int i = 0;
        Sheet sheet =  wb.createSheet("第一页");
        Row row = null;
        Cell cell = null;
        for (TableData td : data)
        {
            row = sheet.createRow(i);
            for(int l=0;l<15;l++){
                cell = row.createCell(l);
                cell.setCellValue(td.rowData[l]);
            }
            i++;
        }
        FileOutputStream outputStream = new FileOutputStream(url+"/in.xls");
        wb.write(outputStream);
        outputStream.close();
    }
    static  public TableData[] GetData(String url)throws IOException
    {
        TableData[] data = new TableData[52];
        InputStream in = new FileInputStream(url);   //创建一个输入流

        POIFSFileSystem fs = new POIFSFileSystem(in);

        HSSFWorkbook wb = new HSSFWorkbook(fs);            //创建一个工作簿
        HSSFSheet hssf = wb.getSheetAt(0);                  //获取sheet第一页

        if(hssf==null){
            System.out.println("该文件没有存在");
        }
        else{

            //循环遍历输出
            for(int rowNum = 0; rowNum < hssf.getLastRowNum();rowNum++){          //getLastRowNum()获取最后一行行标
                HSSFRow hssfRow = hssf.getRow(rowNum);               //获取当前行
                data[rowNum] = new TableData();
                data[rowNum].rowIndex = rowNum;
                if(hssfRow==null){
                    continue;
                }
                for(int cellNum = 0;cellNum<hssfRow.getLastCellNum();cellNum++){    //获取列
                    HSSFCell cell = hssfRow.getCell(cellNum);
                    data[rowNum].rowData[cellNum] = getValue(cell).trim();
                    if(cell==null){
                        data[rowNum].rowData[cellNum] = " ";
                        continue;
                    }
                }

            }
        }
        return data;
    }
    private  static String getValue(HSSFCell cell){

        if(cell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
            return  String.valueOf(cell.getBooleanCellValue());
        }

        else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
            return  String.valueOf(cell.getNumericCellValue());
        }

        else {
            return  String.valueOf(cell.getStringCellValue());
        }
    }
}
