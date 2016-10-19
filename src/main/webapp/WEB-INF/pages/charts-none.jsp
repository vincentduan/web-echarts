<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html style="height: 100%">
   <head>
       <meta charset="utf-8">
   </head>
   <body style="height: 100%; margin: 0">
       <div id="container" style="height: 100%"></div>
       <script type="text/javascript" src="<%=basePath %>resources/jquery.js"></script>
       <script type="text/javascript" src="<%=basePath %>resources/echarts.js"></script>
       <script type="text/javascript">
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
var app = {};
option = null;
myChart.showLoading();
$.get("<%=basePath %>index/triple",  function (data) {
	myChart.hideLoading();
    //var graph = JSON.parse(data);
    var graph = data;
    //console.log(graph);
    option = {
        title: {
        	 text: '提取三元组'
        },
        /* legend: {
            data: ['HTMLElement', 'WebGL', 'SVG', 'CSS', 'Other']
        }, */
        animationDuration: 1500,
        animationEasingUpdate: 'quinticInOut',
        series : [
            {
                type: 'graph',
                layout: 'circular',
                /* focusNodeAdjacency:true, */
                label: {
                    normal: {
                        position: 'right',
                        formatter: '{b}'
                    }
                },
                /* edgeLabel:{
                	normal: {
                		
                		position:'middle'
                	}
                }, */
                data: graph.nodes.map(function (node, idx) {
                    //node.id = idx;//如果data中有id，注释此句
                    node.symbolSize = node.value;
                    node.label = {
                        normal: {
                            show: true
                        }
                    }
                    return node;
                }),
                roam: true,
                /* categories: graph.categories, */
                links: graph.links.map(function(link, index) {
                	link.label = {
                		normal:  {
                			show: true,
                			textStyle: {
                                color: 'black',
                                fontSize: 20,
                                /* fontWeight: 'bold' */
                            },
                            formatter:function(a,b,c){
                            	return a.data.relation;
                            }
                        }
                    };
                    return link
                }),
                lineStyle: {
                    normal: {
                        color: 'source',
                        curveness: 0.3
                    } 
                }
            }
        ]
    };
    myChart.setOption(option);
});
       </script>
   </body>
</html>