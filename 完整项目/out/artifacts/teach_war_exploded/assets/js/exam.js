var  jsonText = '[{"name":"题目信息","A":"选项A","B":"选项B","C":"选项C","D":"选项D","answer":"答案"},{"name":"你几岁","A":42,"B":54,"C":15,"D":23,"answer":"D"},{"name":"爱吃不算","A":"萨","B":"d是","C":"sa擦","D":"sAC","answer":"C"},{"name":"啊女神吧","A":"f是","B":"a方式","C":"a所发生的·","D":"a一是","answer":"A"},{"name":"是大V不","A":"dafd","B":"a噶","C":"f说的","D":"f但是","answer":"B"},{"name":"爱吃不算","A":"萨","B":"d是","C":"sa擦","D":"sAC","answer":"C"},{"name":"啊女神吧","A":"f是","B":"a方式","C":"a所发生的·","D":"a一是","answer":"A"},{"name":"是大V不","A":"dafd","B":"a噶","C":"f说的","D":"f但是","answer":"B"},{"name":"ga杀得死","A":"a","B":"ga","C":"a","D":"-","answer":"D"},{"name":"fSA","A":"a感动","B":"a是更大的·","C":"fASF","D":"FDAD","answer":"D"}]';


var jsonText2 = '[{"name":"题目信息","A":"选项1","B":"选项2","C":"答案","D":"-","answer":"-"},{"name":"你是人？","A":"是","B":"不是","C":2,"D":"-","answer":"-"},{"name":"哈狗？","A":"是","B":"不是","C":1,"D":"-","answer":"-"},{"name":"a是你们？","A":"是","B":"不是","C":2,"D":"-","answer":"-"},{"name":"三层？","A":"是","B":"不是","C":1,"D":"-","answer":"-"},{"name":"发送到莫？","A":"是","B":"不是","C":2,"D":"-","answer":"-"},{"name":"文科？","A":"是","B":"不是","C":1,"D":"-","answer":"-"},{"name":"墨绿的？","A":"是","B":"不是","C":2,"D":"-","answer":"-"}]';


var jsonText3 = '[{"name":"题目信息","A":"备注","B":"-","C":"-","D":"-","answer":"-"},{"name":"是本地开局德生科技不开机不覅八大金刚不是低估基本都是激光笔VB上帝VB上代表是sjbisdbkbvkdbasMVP了吗","A":"爱吃啥","B":"-","C":"-","D":"-","answer":"-"},{"name":"大VSVN上刊登了呢是的Nov阿是大V没把那","A":"表达式","B":"-","C":"-","D":"-","answer":"-"},{"name":"a啥都没弄普拉vmodsnvadsovn爱上你都不好使宁波iasdbno","A":"a的","B":"-","C":"-","D":"-","answer":"-"}]';
var infor = JSON.parse(jsonText);
var tableheader = document.getElementsByTagName("thead")[0];
var tablebodly = document.getElementsByTagName("tbody")[0];

    tableheader.insertRow(0);
    var headerkeys = Object.keys(infor[0]);
    for(var o in headerkeys){
        tableheader.rows[0].insertCell(o);
        tableheader.rows[0].cells[o].appendChild(document.createTextNode(infor[0][headerkeys[o]])); 
    }


for(var i=1;i<infor.length;i++){
    tablebodly.insertRow(i-1);
    var keys = Object.keys(infor[i]);
    for(var o in keys){
        tablebodly.rows[i-1].insertCell(o);
        tablebodly.rows[i-1].cells[o].appendChild(document.createTextNode(infor[i][keys[o]])); 
    }
}

var doms = document.getElementsByClassName("btn-primary");
var  tab = document.getElementsByClassName("tabinfor");

for(var i = 0;i<doms.length;i++){
doms[i].onclick = function(){
    for(var j=0;j<tab.length;j++){
        tab[j].value = this.parentNode.parentNode.children[j].innerText;
    
    }
}
}

var doms2 = document.getElementsByClassName("pd");
var  tab2 = document.getElementsByClassName("tabinfor2");

for(var i = 0;i<doms2.length;i++){
doms2[i].onclick = function(){
    for(var j=0;j<tab2.length;j++){
        tab2[j].value = this.parentNode.parentNode.children[j].innerText;
    
    }
}
}


var doms3 = document.getElementsByClassName("yy");
var  tab3 = document.getElementsByClassName("tabinfor3");

for(var i = 0;i<doms3.length;i++){
doms3[i].onclick = function(){
    for(var j=0;j<tab3.length;j++){
        tab3[j].value = this.parentNode.parentNode.children[j].innerText;
    
    }
}
}




var infor2 = JSON.parse(jsonText2);
var tableheader2 = document.getElementsByTagName("thead")[1];
var tablebodly2 = document.getElementsByTagName("tbody")[1];

    tableheader2.insertRow(0);
    var headerkeys2 = Object.keys(infor2[0]);
    for(var o in headerkeys2){
        tableheader2.rows[0].insertCell(o);
        tableheader2.rows[0].cells[o].appendChild(document.createTextNode(infor2[0][headerkeys2[o]])); 
    }


for(var i=1;i<infor2.length;i++){
    tablebodly2.insertRow(i-1);
    var keys = Object.keys(infor2[i]);
    for(var o in keys){
        tablebodly2.rows[i-1].insertCell(o);
        tablebodly2.rows[i-1].cells[o].appendChild(document.createTextNode(infor2[i][keys[o]])); 
    }
}


var infor3 = JSON.parse(jsonText3);
var tableheader3 = document.getElementsByTagName("thead")[2];
var tablebodly3 = document.getElementsByTagName("tbody")[2];

    tableheader3.insertRow(0);
    var headerkeys3 = Object.keys(infor3[0]);
    for(var o in headerkeys3){
        tableheader3.rows[0].insertCell(o);
        tableheader3.rows[0].cells[o].appendChild(document.createTextNode(infor3[0][headerkeys3[o]])); 
    }


for(var i=1;i<infor.length;i++){
    tablebodly3.insertRow(i-1);
    var keys = Object.keys(infor3[i]);
    for(var o in keys){
        tablebodly3.rows[i-1].insertCell(o);
        tablebodly3.rows[i-1].cells[o].appendChild(document.createTextNode(infor3[i][keys[o]])); 
    }
}