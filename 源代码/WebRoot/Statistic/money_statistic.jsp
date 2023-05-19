<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/> 
<br/>&nbsp;&nbsp;
年份：
<select id="year" name="year">
<option>2019</option> 
	<option>2018</option> 
	<option>2017</option>
	<option>2016</option>
</select>
<a id="statisticBtn" class="easyui-linkbutton" onclick="statistic();">开始统计</a>

<div id="chart" style="width:auto;height:450px;"></div> 
 
<script type="text/javascript"> 

function statistic() {

	var xData = null;
	var yData = null; 
	 
	var year = $("#year").val();
	
	$.ajax({
		url: "OrderInfo/statistic?year=" + year,
		type: "post",
		dataType: "json", 
		success: function(data) { 
			obj = data;
			xData = obj.xData;
			yData = obj.yData;  
			 // 初始化图表标签
		    var myChart = echarts.init(document.getElementById('chart'));
		    var options={
		        //定义一个标题
		        title:{
		            text: year+'年月营业额统计图'
		        },
		        legend:{
		            data:['收入金额']
		        },
		        tooltip : {
		            trigger: 'axis',
		            formatter: "{c}元"
		        },
		        //X轴设置
		        xAxis:{
		            data:xData
		        },
		        yAxis:{
		        },
		        //name=legend.data的时候才能显示图例
		        series:[{
		            name:'收入',
		            type:'bar',
		            barWidth: 30,//固定柱子宽度
		            data:yData
		        }] 
		    };
		    myChart.setOption(options);
		}
	}); 
}  
     
</script>

<script src="${pageContext.request.contextPath}/js/echarts.min.js"></script> 




