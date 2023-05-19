<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/> 
<br/>&nbsp;&nbsp;
  
<div id="chart2" style="width:auto;height:450px;"></div> 
 
<script type="text/javascript"> 

function statistic() {

	var xData = null;
	var yData = null;  
	
	$.ajax({
		url: "OrderInfo/statistic2",
		type: "post",
		dataType: "json", 
		success: function(data) { 
			obj = data;
			xData = obj.xData;
			yData = obj.yData;  
			 // 初始化图表标签
		    var myChart = echarts.init(document.getElementById('chart2'));
		    var options={
		        //定义一个标题
		        title:{
		            text: '销售数量统计图'
		        },
		        legend:{
		            data:['销售数量']
		        },
		        tooltip : {
		            trigger: 'axis',
		            formatter: "{c}个"
		        },
		        //X轴设置
		        xAxis:{
		            data:xData
		        },
		        yAxis:{
		        },
		        //name=legend.data的时候才能显示图例
		        series:[{
		            name:'销售数量',
		            type:'bar',
		            barWidth: 30,//固定柱子宽度
		            data:yData
		        }] 
		    };
		    myChart.setOption(options);
		}
	}); 
}  

statistic();
     
</script>

<script src="${pageContext.request.contextPath}/js/echarts.min.js"></script> 



