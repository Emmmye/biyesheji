<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
	<title>软件提测与发布系统</title>
	<meta charset="utf-8" />
</head>

<!--图标样式-->
<link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/skins/_all-skins.css">

<link rel="stylesheet" href="/css/index.css" />
<script type="text/javascript">

	function createTableWithoutButton_1(width, height, line, arr) {
		var table = document.createElement("table");
		var tbody = document.createElement("tbody");
		table.style.width = width;
		table.style.height = height;
		table.style.border = 4;
		var td;
		for (var i = 0; i <= arr.length; i++) {
			var tr = document.createElement("tr");
			for (var j = 0; j < line; ++j) {
				td = document.createElement("td");

				if(i > 0){
					var tmparr = arr[i-1].split(",");
				}

				if (j == 0) {
					if(i == 0){
						td.innerHTML = "问题编号";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "100px";
						td.style.fontSize = "20px"
					} else {
						td.innerHTML = "第" + i + "题";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "100px";
						td.style.fontSize = "20px"
					}

				} else if (j == 1) {
					if(i == 0){
						td.innerHTML = "选择是的人数";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "300px";
						td.style.fontSize = "20px"
					}else {
						td.innerHTML = tmparr[0];
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "300px";
						td.style.fontSize = "20px"
					}

				} else {
					if(i == 0){
						td.innerHTML = "选择否的人数";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.fontSize = "20px"
						td.style.width = "300px"
					}else {
						td.innerHTML = tmparr[1];
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.fontSize = "20px"
						td.style.width = "300px"
					}
				}
				tr.appendChild(td);
			}
			tbody.appendChild(tr);
		}
		table.appendChild(tbody);
		tbody.style.backgroundColor = "#F0FBCD";
		table.style.margin = "46px 120px";
		return table;
	}


	function createNaireTable(width, height, line, arr, res, subject) {
		var table = document.createElement("table");
		var tbody = document.createElement("tbody");

		table.style.width = width;
		table.style.height = height;
		table.style.border = 4;

		for (var i = 0; i < 2 * arr.length; i++) {
		    if (i % 2 == 0) {
		        var rd = document.createElement("input");
				rd.type = "radio";
				rd.value = "yes";
				rd.style.margin = "7px 30px 7px 30px";
				rd.name = arr[i / 2];
				rd.checked = true;
				res.push(rd);
			} else {
				var rd = document.createElement("input");
				rd.type = "radio";
				rd.value = "no";
				rd.style.margin = "7px 30px 7px 30px";
				rd.name = arr[i / 2];
				rd.checked = false;
				res.push(rd);
			}
		}

		var td;

		for (var i = 0; i < arr.length + 1; i++) {
			var tr = document.createElement("tr");

			if (i > 0) {
				res[2 * (i - 1)] = document.createElement("input");
				res[2 * (i - 1)].type = "radio";
				res[2 * (i - 1)].style.margin = "7px 30px 7px 30px";
				res[2 * (i - 1)].value = "yes";
				(function (i) {
					res[2 * (i - 1)].name = arr[i - 1];
				})(i);
				res[2 * (i - 1)].checked = true;

				res[2 * (i - 1) + 1] = document.createElement("input");
				res[2 * (i - 1) + 1].type = "radio";
				res[2 * (i - 1) + 1].style.margin = "7px 30px 7px 30px";
				res[2 * (i - 1) + 1].value = "no";
				(function (i) {
					res[2 * (i - 1) + 1].name = arr[(i - 1)];
				})(i);
				res[2 * (i - 1) + 1].checked = false;
			}

			for (var j = 0; j < line; ++j) {
				td = document.createElement("td");

				if (j == 0) {
					if (i == 0) {
						td.innerHTML = "问题";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "580px"
					} else {
						td.innerHTML = i + "." + arr[i - 1];
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "580px"
					}
				} else if (j == 1) {
					if (i == 0) {
						td.innerHTML = "是"
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "60px"
					} else {
						td.appendChild(res[2 * (i - 1)]);
					}
				} else if (j == 2) {
					if (i == 0) {
						td.innerHTML = "否"
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "60px"
					} else {
						td.appendChild(res[2 * (i - 1) + 1]);
					}
				}
				tr.appendChild(td);
			}
			tbody.appendChild(tr);
		}

		var but = document.createElement("input");
		but.type = "button";
		but.value = "提交";
		but.setAttribute("onmouseover","style.backgroundColor='#A9A9A9'");
		but.setAttribute("onmouseout","style.backgroundColor='#9ACD32'");
		but.style.color = "white";
		but.style.fontSize = "12px";
		but.style.backgroundColor = "#9ACD32";
		but.style.borderColor = "#D3D3D3";
		but.style.cursor = "pointer";
		but.style.margin = "7px 80px 7px 80px";
		but.style.width = "75px";
		but.style.height = "25px";

		but.onclick = function () {
		    getAnswer(res, subject);
		};

		table.appendChild(but);
		table.appendChild(tbody);
		tbody.style.backgroundColor = "#F0FBCD";
		table.style.margin = "46px 120px";

		return table;
	}




	function GetQuesInfo(id, arr) {
		$.ajax({
			type: 'POST',
			url: '/add',
			data: { project: arr[id] },
			success: function (result) {
				$("#myDiv").empty();
				if (result == "nosubjects") {
					document.getElementById("myDiv").innerHTML="还没有项目！";
					return;
				}
				var arr = result.split("\3");
				var type = "查看";
				var table = createTable_1(700, 130, 3, arr, type);
				document.getElementById("myDiv").innerHTML="相关问题如下:";
				$("#myDiv").append(table);
			},
			error:function(result) {
				alert(result);
			}
		});
	}

	function createTable_2(width, height, line, arr, type) {
		alert("into 2")
		var table = document.createElement("table");
		var tbody = document.createElement("tbody");

		table.style.width = width;
		table.style.height = height;
		table.style.border = 4;

		var td;

		for (var i = 0; i <= 1; i++) {
			var tr = document.createElement("tr");
			for (var j = 0; j < line; ++j) {
				td = document.createElement("td");
				var but = document.createElement("input");
				but.type = "button";
				but.value = type;
				but.setAttribute("onmouseover","style.backgroundColor='#A9A9A9'");
				but.setAttribute("onmouseout","style.backgroundColor='#9ACD32'");
				but.style.color = "white";
				but.style.fontSize = "12px";
				but.style.backgroundColor = "#9ACD32";
				but.style.borderColor = "#D3D3D3";
				but.style.cursor = "pointer";
				but.style.margin = "7px 80px 7px 80px";
				but.style.width = "75px";
				but.style.height = "25px";

				if(i == 0){
					if (j == 0) {
						td.innerHTML = "问题";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "200px"
					} else if (j == 1) {
						td.innerHTML = "状态";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 2) {
						td.innerHTML = "优先级";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 3) {
						td.innerHTML = "附件列表";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 4) {
						td.innerHTML = "经办人";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 5) {
						td.innerHTML = "关注人";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 6) {
						td.innerHTML = "创建日期";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 7) {
						td.innerHTML = "修改日期";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 8) {
						td.innerHTML = "修改记录";
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}
				}else{
					if (j == 0) {
						if(arr.size() <= j){
							td.innerHTML = arr[0]
						}else{
							td.innerHTML = "问题为空";
						}
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "200px"
					} else if (j == 1) {
						if(arr.size() <= j){
							td.innerHTML = arr[1]
						}else{
							td.innerHTML = "无状态";
						}
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 2) {
						if(arr.size() <= j){
							td.innerHTML = arr[2]
						}else{
							td.innerHTML = "无优先级";
						}
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 3) {
						if(arr.size() <= j){
							td.innerHTML = arr[5]
						}else{
							td.innerHTML = "无附件列表";
						}
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 4) {
						if(arr.size() <= j){
							td.innerHTML = arr[4]
						}else{
							td.innerHTML = "经办人未空";
						}
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 5) {
						if(arr.size() <= j){
							td.innerHTML = arr[5]
						}else{
							td.innerHTML = "无关注人";
						}
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 6) {
						if(arr.size() <= j){
							td.innerHTML = arr[6]
						}else{
							td.innerHTML = "无创建时间";
						}
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 7) {
						if(arr.size() <= j){
							td.innerHTML = arr[7]
						}else{
							td.innerHTML = "无修改时间";
						}
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}else if (j == 8) {
						if(arr.size() <= j){
							td.innerHTML = arr[8]
						}else{
							td.innerHTML = "无记录";
						}
						td.style.textAlign = "center";
						td.style.color = "#292929";
						td.style.width = "260px"
					}
				}

				tr.appendChild(td);
			}
			td.appendChild(but);
			tbody.appendChild(tr);
		}
		table.appendChild(tbody);
		tbody.style.backgroundColor = "#F0FBCD";
		table.style.margin = "46px 120px";
		return table;
	}

	function getqueinfo(id, arr) {
		$.ajax({
			type: 'POST',
			url: '/getqueinfo',
			data: { question: arr[id] },
			success: function (result) {
				$("#myDiv").empty();
				if (result == "nosubjects") {
					document.getElementById("myDiv").innerHTML="还没有项目！";
					return;
				}

				alert(result);
				var arr = result.split("\3");
				alert(arr.length)
				var type = "查看";
				var table = createTable_2(700, 130, 9, arr, type);
				document.getElementById("myDiv").innerHTML="问题详细情况图下如下:";
				$("#myDiv").append(table);
			},
			error:function(result) {
				alert(result);
			}
		});
	}

	function createTable_1(width, height, line, arr, type) {
		var table = document.createElement("table");
		var tbody = document.createElement("tbody");

		table.style.width = width;
		table.style.height = height;
		table.style.border = 4;

		var td;

		for (var i = 0; i < arr.length; i++) {
			var tr = document.createElement("tr");
			for (var j = 0; j < line; ++j) {
				td = document.createElement("td");
				var but = document.createElement("input");
				but.type = "button";
				but.value = type;
				but.setAttribute("onmouseover","style.backgroundColor='#A9A9A9'");
				but.setAttribute("onmouseout","style.backgroundColor='#9ACD32'");
				but.style.color = "white";
				but.style.fontSize = "12px";
				but.style.backgroundColor = "#9ACD32";
				but.style.borderColor = "#D3D3D3";
				but.style.cursor = "pointer";
				but.style.margin = "7px 80px 7px 80px";
				but.style.width = "75px";
				but.style.height = "25px";

				// js 的闭包问题，需要注意，必须以下面的解法来解决闭包问题
				(function(i){
					but.onclick = function() {
						if (type == "查看") {
							getqueinfo(i, arr);
						} else if (type == "删除 -") {
							deleteSubject(i, arr);
						} else if (type == "浏览") {
							seeNaire(i, arr);
						} else if (type == "查看结果") {
							seeResult(i, arr);
						}
					}
				})(i);

				if (j == 0) {
					td.innerHTML = "问题";
					td.style.textAlign = "center";
					td.style.color = "#292929";
					td.style.width = "200px"
				} else if (j == 1) {
					td.innerHTML = arr[i];
					td.style.textAlign = "center";
					td.style.color = "#292929";
					td.style.width = "260px"
				}
				tr.appendChild(td);
			}
			td.appendChild(but);
			tbody.appendChild(tr);
		}
		table.appendChild(tbody);
		tbody.style.backgroundColor = "#F0FBCD";
		table.style.margin = "46px 120px";
		return table;
	}

	function GetProInfo(id, arr) {
		$.ajax({
			type: 'POST',
			url: '/add',
			data: { project: arr[id] },
			success: function (result) {
				$("#myDiv").empty();
				if (result == "nosubjects") {
					document.getElementById("myDiv").innerHTML="还没有项目！";
					return;
				}
				var arr = result.split("\3");
				var type = "查看";
				var table = createTable_1(700, 130, 3, arr, type);
				document.getElementById("myDiv").innerHTML="相关问题如下:";
				$("#myDiv").append(table);
			},
			error:function(result) {
			    alert(result);
			}
		});
	}

	function createChooseTable(width, height, line, arr) {
		var table = document.createElement("table");
		var tbody = document.createElement("tbody");

		table.style.width = width;
		table.style.height = height;
		table.style.border = 4;

		var td;

		for (var i = 0; i < arr.length; i++) {
			var tr = document.createElement("tr");
			for (var j = 0; j < line; ++j) {
				td = document.createElement("td");
				if (j == 0) {
					td.innerHTML = "科目";
					td.style.textAlign = "center";
					td.style.color = "#292929";
					td.style.width = "200px"
				} else if (j == 1) {
					td.innerHTML = arr[i];
					td.style.textAlign = "center";
					td.style.color = "#292929";
					td.style.width = "260px"
				}
				tr.appendChild(td);
			}
			tbody.appendChild(tr);
		}
		table.appendChild(tbody);
		tbody.style.backgroundColor = "#F0FBCD";
		table.style.margin = "46px 120px";
		return table;
	}

	/**
	 * 创建表格
	 * @param width 宽度
	 * @param height 高度
	 * @param line 列数
	 * @param arr 表内数据
	 * @param type button 类型名
	 */
	function createTable(width, height, line, arr, type) {
	    var table = document.createElement("table");
	    var tbody = document.createElement("tbody");

	    table.style.width = width;
	    table.style.height = height;
	    table.style.border = 4;

	    var td;

	    for (var i = 0; i < arr.length; i++) {
	    	var tr = document.createElement("tr");
	    	for (var j = 0; j < line; ++j) {
	    	    td = document.createElement("td");
	    	    var but = document.createElement("input");
	    	    but.type = "button";
	    	    but.value = type;
				but.setAttribute("onmouseover","style.backgroundColor='#A9A9A9'");
				but.setAttribute("onmouseout","style.backgroundColor='#9ACD32'");
				but.style.color = "white";
				but.style.fontSize = "12px";
				but.style.backgroundColor = "#9ACD32";
				but.style.borderColor = "#D3D3D3";
				but.style.cursor = "pointer";
				but.style.margin = "7px 80px 7px 80px";
				but.style.width = "75px";
				but.style.height = "25px";

				// js 的闭包问题，需要注意，必须以下面的解法来解决闭包问题
				(function(i){
				    but.onclick = function() {
				    	if (type == "查看") {
							GetProInfo(i, arr);
						} else if (type == "删除 -") {
				    		deleteSubject(i, arr);
						} else if (type == "浏览") {
				    	    seeNaire(i, arr);
						} else if (type == "查看结果") {
				    	    seeResult(i, arr);
						}
					}
				})(i);

				if (j == 0) {
	    		    td.innerHTML = "项目";
	    		    td.style.textAlign = "center";
	    		    td.style.color = "#292929";
	    		    td.style.width = "200px"
				} else if (j == 1) {
	    		    td.innerHTML = arr[i];
					td.style.textAlign = "center";
					td.style.color = "#292929";
					td.style.width = "260px"
				}
	    		tr.appendChild(td);
			}
	    	td.appendChild(but);
	    	tbody.appendChild(tr);
		}
	    table.appendChild(tbody);
	    tbody.style.backgroundColor = "#F0FBCD";
	    table.style.margin = "46px 120px";
	    return table;
	}

	function loadXMLDoc(e) {
	    $("#myDiv").empty();
		var type=e.getAttribute("data-type");
		var xmlhttp;
		if (window.XMLHttpRequest)
		{
			// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			xmlhttp=new XMLHttpRequest();
		}
		else
		{
			// IE6, IE5 浏览器执行代码
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		/**
		 * 分流
		 */
		if (type == "getinfo") {
			xmlhttp.onreadystatechange=function()
			{
				if (xmlhttp.readyState==4 && xmlhttp.status==200)
				{
					/**
					 * 这个 result 是一个 String,里面的各种科目是由 '\3' 分隔
					 * @type {string}
					 */
					var result = xmlhttp.responseText;
					if (result == "nosubjects") {
						document.getElementById("myDiv").innerHTML="没有相关项目！";
					    return;
					}
					var arr = result.split("\3");
					/**
					 * arr.length 就可以获取到分隔后的元素每一个元素就是一个科目
					 * @type {string}
					 */
					var type = "查看";
					var table = createTable(700, 130, 3, arr, type);
					document.getElementById("myDiv").innerHTML="相关项目如下:";
					$("#myDiv").append(table);
				}
			}
			xmlhttp.open("GET","/getinfo?t=" + Math.random(),false);
			xmlhttp.send();
		} else if (type == "delete") {
			xmlhttp.onreadystatechange=function()
			{
				if (xmlhttp.readyState==4 && xmlhttp.status==200)
				{
					var result = xmlhttp.responseText;
					if (result == "nosubjects") {
						document.getElementById("myDiv").innerHTML="还没有选择任何课程哦！快去选课吧！"
						return;
					}
					var arr = result.split("\3");
					/**
					 * arr.length 就可以获取到分隔后的元素每一个元素就是一个科目
					 * @type {string}
					 */
					var type = "删除 -";
					var table = createTable(700, 130, 3, arr, type);
					document.getElementById("myDiv").innerHTML="以下课程可删除:";
					$("#myDiv").append(table);
				}
			}
			xmlhttp.open("GET", "/choosed", false);
			xmlhttp.send();
		} else if (type == "choosed") {
			xmlhttp.onreadystatechange=function()
			{
				if (xmlhttp.readyState==4 && xmlhttp.status==200)
				{
					var result = xmlhttp.responseText;
					if (result == "nosubjects") {
						document.getElementById("myDiv").innerHTML="还没有选择任何课程呢，快去选课哦！";
						return;
					}
					var arr = result.split("\3");
					var table = createChooseTable(700, 130, 2, arr);
					document.getElementById("myDiv").innerHTML="以下课程已经选择:";
					$("#myDiv").append(table);
				}
			}
			xmlhttp.open("GET", "/choosed", false);
			xmlhttp.send();
		} else if (type == "see") {
			xmlhttp.onreadystatechange=function()
			{
				if (xmlhttp.readyState==4 && xmlhttp.status==200)
				{
					var result = xmlhttp.responseText;
					if (result == "nosubjects") {
						document.getElementById("myDiv").innerHTML="没有问卷可以浏览！请检查你是否选课或者已经答完了所有问卷！";
						return;
					}
					var arr = result.split("\3");
					var type = "浏览";
					var table = createTable(700,130, 3, arr, type);
					document.getElementById("myDiv").innerHTML="以下问卷可浏览:";
					$("#myDiv").append(table);
				}
			}
			xmlhttp.open("GET", "/uncomplete", false);
			xmlhttp.send();
		} else {
			xmlhttp.onreadystatechange=function()
			{
				if (xmlhttp.readyState==4 && xmlhttp.status==200)
				{
					var result = xmlhttp.responseText;
					if (result == "nosubjects") {
						document.getElementById("myDiv").innerHTML="还没有选择任何课程呢，是看不到别的同学回答的结果的?";
						return;
					}
					var arr = result.split("\3");
					var type = "查看结果";
					var table = createTable(700,130, 3, arr, type);
					document.getElementById("myDiv").innerHTML="下面的问卷可查看结果:";
					$("#myDiv").append(table);
				}
			}
			xmlhttp.open("GET", "/choosed", false);
			xmlhttp.send();
		}
	}
</script>

<body>

		<div class="t-side">
			<p class="b">软件提测与发布系统</p>
		</div>
		<div class="l-side" id="myDiv">点击查看可以查看具体信息！
			<br>
			${list}
		</div>

<div class="s-side">
	<ul>


		<li class="first">
				<li class="s-secondItem">
					<i class="fa fa-minus-square-o"></i>
					<button class="but" data-type="getinfo" onclick="loadXMLDoc(this)" onmouseover="this.style.backgroundColor='#A9A9A9';"onmouseout="this.style.backgroundColor='#292929';">查看信息</button>
				</li>

		</li>
	</ul>
</div>
	
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/index.js" ></script>
<div style="text-align:center;">
</div>
</body>	
</html>