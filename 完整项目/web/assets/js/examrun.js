var i = 0;
var items = new Array(0,0,0,0,0,0,0,0,0);


function worknum(index){
    if(items[index]==0){
        i++;
        items[index] = 1;
    }
    else{
        i = i;
    }
    document.getElementById("work1").innerHTML = i;
}