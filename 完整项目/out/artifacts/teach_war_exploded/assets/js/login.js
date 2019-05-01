$(document).ready(function() {
    $('.lab_stu').click(function() {
        $('.icon_stu').attr('src', 'img/stu2.png');
        $('.icon_tea').attr('src', 'img/tea1.png');
    })
    $('.lab_tea').click(function() {
        $('.icon_tea').attr('src', 'img/tea2.png');
        $('.icon_stu').attr('src', 'img/stu1.png');
    })  
});