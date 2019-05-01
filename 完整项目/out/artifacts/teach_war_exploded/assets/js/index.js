$(document).ready(function(){

	var win_height = $(window).innerHeight();
	$(".bg").css({"height":win_height});


	$('#login').click(function(){
		$('#box_login').fadeIn(1500);
		$('#box_reg').css('display','none');
		$('#title').css('display','none');
		$('.icon_stu').attr('src', 'img/stu1.png');
		$('.icon_tea').attr('src', 'img/tea1.png');
		$('.bg-bubbles').css('display','block');
	})
	$('#register').click(function(){
		$('#box_reg').fadeIn(1500);
		$('#box_login').css('display','none');
		$('#title').css('display','none');
		$('.icon_stu').attr('src', 'img/stu1.png');
		$('.icon_tea').attr('src', 'img/tea1.png');
		$('.bg-bubbles').css('display','block');
	})
	$('#close_login').click(function(){
		$('#box_login').css('display','none');
		$('#title').css('display','block');
		$('.icon_stu').attr('src', 'img/stu1.png');
		$('.icon_tea').attr('src', 'img/tea1.png');
		$('.bg-bubbles').css('display','none');
	})
	$('#close_reg').click(function(){
		$('#box_reg').css('display','none');
		$('#title').css('display','block');
		$('.icon_stu').attr('src', 'img/stu1.png');
		$('.icon_tea').attr('src', 'img/tea1.png');
		$('.bg-bubbles').css('display','none');
	})

	//背景自动切换
	var image=new Array(4);
	var n;
	image[1]="assets/images/bg3.jpg";
	image[2]="assets/images/bg2.jpg";
	image[3]="assets/images/bg.jpg";
	$(".bg").css({"background-image":"url("+image[1]+")"})
	n=1;
	function bg_change(){

		setInterval( function () {
			if(n<3 ){
				n++;
			}
			else{
				n=1;
			}
			$(".bg").css({"background-image":"url("+image[n]+")","transition":"2s"})
		}, 8000);
	}
	bg_change();
})