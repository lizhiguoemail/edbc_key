/*
var $ = function (id) { 
return "string" == typeof id ? document.getElementById(id) : id; 
}; 
*/
var Class = { 
create: function() { 
return function() { 
this.initialize.apply(this, arguments); 
} 
} 
} 
Object.extend = function(destination, source) { 
for (var property in source) { 
destination[property] = source[property]; 
} 
return destination; 
} 
var Calendar = Class.create(); 
Calendar.prototype = { 
initialize: function(container, options) { 
this.Container = document.getElementById(container);//table�ṹ����
this.Days = [];//�����б� 
this.SetOptions(options); 
this.Year = this.options.Year; 
this.Month = this.options.Month; 
this.SelectDay = this.options.SelectDay ? new Date(this.options.SelectDay) : null; 
this.onSelectDay = this.options.onSelectDay; 
this.onToday = this.options.onToday; 
this.onFinish = this.options.onFinish; 
this.Draw(); 
}, 
 
SetOptions: function(options) { 
this.options = {//Ĭ��ֵ 
Year: new Date().getFullYear(), 
Month: new Date().getMonth() + 1, 
SelectDay: null,//ѡ������ 
onSelectDay: function(){}, 
onToday: function(){}, 
onFinish: function(){} 
}; 
Object.extend(this.options, options || {}); 
}, 
//���� 
PreMonth: function() { 
//ȡ���������ڶ��� 
var d = new Date(this.Year, this.Month - 2, 1); 
//�������� 
this.Year = d.getFullYear(); 
this.Month = d.getMonth() + 1; 
//�ػ����� 
this.Draw(); 
}, 
//��һ���� 
NextMonth: function() { 
var d = new Date(this.Year, this.Month, 1); 
this.Year = d.getFullYear(); 
this.Month = d.getMonth() + 1; 
this.Draw(); 
}, 

Draw: function() { 
//���������б� 
var arr = []; 
//�õ��µ�һ����һ���е�����ֵ��Ϊ�������һ������� 
for(var i = 1, firstDay = new Date(this.Year, this.Month - 1, 1).getDay(); i <= firstDay; i++){ arr.push(" "); } 
//�õ������һ����һ�����е�����ֵ��Ϊ���µ����� 
for(var i = 1, monthDay = new Date(this.Year, this.Month, 0).getDate(); i <= monthDay; i++){ arr.push(i); } 
// /
var frag = document.createDocumentFragment(); 
this.Days = []; 
while(arr.length > 0){ 
//ÿ�����ڲ���һ��tr
var row = document.createElement("tr"); 
//���� 
for(var i = 1; i <= 7; i++){ 
var cell = document.createElement("td"); 
cell.innerHTML = " "; 
if(arr.length > 0){ 
var d = arr.shift(); 
cell.innerHTML = d; 
if(d > 0){ 
this.Days[d] = cell; 
//��ȡ���� 
if(this.IsSame(new Date(this.Year, this.Month - 1, d), new Date())){ this.onToday(cell); } 
//�ж��û��Ƿ�����ѡ��
if(this.SelectDay && this.IsSame(new Date(this.Year, this.Month - 1, d), this.SelectDay)){ this.onSelectDay(cell); } 
} 
} 
row.appendChild(cell); 
} 
frag.appendChild(row); 
} 
//�������Ȼ���ٲ���(ie��table������innerHTML) 
while(this.Container.hasChildNodes()){ this.Container.removeChild(this.Container.firstChild); } 
this.Container.appendChild(frag); 
this.onFinish(); 
}, 
//�ж��Ƿ�ͬһ��
IsSame: function(d1, d2) { 
return (d1.getFullYear() == d2.getFullYear() && d1.getMonth() == d2.getMonth() && d1.getDate() == d2.getDate()); 
} 
}; 


//ͼƬ�ֲ�
var t = n = 0, count;
$(document).ready(function(){	
	
	count=$("#banner_list a").length;
	var str = '';
	$("#banner_list a").each(function(i){
		i = i+1;
		if(i==1) str += "<li class='on'>"+i+"</li>";						
		else str += "<li>"+ i +"</li>";	
	});
	$("#banner ul").html(str);

	$("#banner_list a:not(:first-child)").hide();
	$("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));
	$("#banner_info").click(function(){window.open($("#banner_list a:first-child").attr('href'), "_blank")});
	$("#banner li").click(function() {
		var i = $(this).text() - 1;//��ȡLiԪ���ڵ�ֵ����1��2��3��4
		n = i;
		if (i >= count) return;
		$("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
		$("#banner_info").unbind().click(function(){window.open($("#banner_list a").eq(i).attr('href'), "_blank")})
		$("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
		document.getElementById("banner").style.background="";
		$(this).toggleClass("on");
		$(this).siblings().removeAttr("class");
	});
	t = setInterval("showAuto()", 8000);
	$("#banner").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 8000);});
});

function showAuto()
{
	n = n >=(count - 1) ? 0 : ++n;
	$("#banner li").eq(n).trigger('click');
}


/*�����˵�*/
var timeout         = 500;
var closetimer		= 0;
var ddmenuitem      = 0;

// open hidden layer
function mopen(id)
{	
	// cancel close timer
	mcancelclosetime();

	// close old layer
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';

	// get new layer and show it
	ddmenuitem = document.getElementById(id);
	ddmenuitem.style.visibility = 'visible';
	$("#banner").attr('style', 'z-index:-1');

}
// close showed layer
function mclose()
{
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
}

// go close timer
function mclosetime()
{
	closetimer = window.setTimeout(mclose, timeout);
	$("#banner").attr('style', 'z-index:1');
}

// cancel close timer
function mcancelclosetime()
{
	if(closetimer)
	{
		window.clearTimeout(closetimer);
		closetimer = null;
	}
	$("#banner").attr('style', 'z-index:-1');
}

// close layer when click-out
document.onclick = mclose; 
