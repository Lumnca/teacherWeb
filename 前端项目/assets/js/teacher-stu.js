var userinfor = new Array();

var doms = document.getElementsByClassName("btn-danger");
var delName = document.getElementById("delname");
var delID = document.getElementById("delid");
for(var i = 0;i<doms.length;i++){
  doms[i].onclick = function(){
    
    delName.innerHTML = this.parentNode.parentNode.children[1].innerText;
    delID.innerHTML = this.parentNode.parentNode.children[2].innerText;
  }
}