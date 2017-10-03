$(function(){
	var objStr = ".main_map_left ul li";
	$(objStr + ":not(:first)").css("display","none");
	setInterval(function(){
		if($(objStr + ":last").is(":visible")){
			$(objStr + ":first").fadeIn("slow").addClass("in");
			$(objStr + ":last").removeClass("in").hide();
		}
		else{
			$(objStr + ":visible").addClass("in");
			$(objStr + ".in").next().fadeIn("slow");
			$(objStr + ".in").removeClass("in").hide();
		}},3000) 
})

function mouseOver(obj){
	$(obj).removeClass("bodyfooter").addClass("bodyfootersecond");
}
	
function mouseOut(obj){
	$(obj).removeClass("bodyfootersecond").addClass("bodyfooter");
}