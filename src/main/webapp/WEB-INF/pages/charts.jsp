<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>charts</title>
	
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 1000px;height:1000px;margin:0 auto;"></div>
    <script type="text/javascript" src="<%=basePath %>resources/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath %>resources/echarts.js"></script>
    <script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    myChart.showLoading();
    $.get('<%=basePath %>resources/webkit-dep2.json', function (webkitDep) {
    myChart.hideLoading();
    //webkitDep = JSON.parse(webkitDep)
    option = {
   		title: {
               text: '提取三元组'
           },
        legend: {
            data: ['HTMLElement', 'WebGL', 'SVG', 'CSS', 'Other']
        },
        series: [{
            type: 'graph',
            layout: 'force',
            label: {
                normal: {
                    position: 'right',
                    formatter: '{b}'
                }
            },
            data: webkitDep.nodes.map(function (node, idx) {
                node.id = idx;//如果data中有id，注释此句
                node.symbolSize = 15;
                node.label = {
                    normal: {
                        // show: true
                    }
                }
                return node;
            }),
            roam: true,
            categories: webkitDep.categories,
            force: {
                // initLayout: 'circular'
                // gravity: 0
                // repulsion: 20,
                edgeLength: 50,
                repulsion: 20
            }, 
            links: webkitDep.links.map(function(link, index) {
                // link.name = index
                link.label = {
                    normal: {
                        show: true
                    }
                }
                return link
            })
        }]
    };

    myChart.setOption(option);
});
    </script>
</body>
</html>