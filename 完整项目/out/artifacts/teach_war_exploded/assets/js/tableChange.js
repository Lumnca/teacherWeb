
var userinfor = new Array();
var set = document.getElementsByClassName("set")[0];

var doms = document.getElementsByClassName("get");

for(var i = 0;i<doms.length;i++){
  doms[i].onclick = function(){
    var u = this.parentNode.parentNode;
    for(var j=0;j<u.children.length;j++){
      if(j!=u.children.length-1){
        set.children[j].children[0].value = u.children[j].innerText;    
      }

    }
  }
}


