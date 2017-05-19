$(function(){
  goToPage('home');
  //****选框点击事件begin****
$('.side-menu')
.delegate('li','click',function(){//点击切换选中状态
  $(this).addClass('active').siblings().removeClass('active');
});

});
function goToPage(tag) {
  if(tag == 'home') {
    $('.right-main').load('/hncm/app/tableList/template/tmp1.jsp');
  }
  if(tag=='company'){
	  $('.right-main').load('/hncm/app/tableList/template/tmp2.jsp');
  }
}
