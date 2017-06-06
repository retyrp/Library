	/*function ctrlYC() {
		var d1 = document.getElementById('div_table');//获取该div节点
		d1.style.display = 'none';//值为'none'设置为隐藏。
	}
	function ctrlXS() {
		var d1 = document.getElementById('div_table');//获取该div节点
		d1.style.display = '';//值为'none'设置为隐藏。
	}*/	

	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();

			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});


	var xmlHttp;
	var xmlHttp5;
	var xmlHttp2;
	var xmlHttp3;
	var xmlHttp4;
	var xmlHttp6;
	var xmlHttp7;
	var xmlHttp8;
	var xmlHttp9;
	var xmlHttp10;
	function createXMLHttpRequest() {
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
	}
	function createXMLHttpRequest7() {
		if (window.ActiveXObject) {
			xmlHttp7 = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp7 = new XMLHttpRequest();
		}
	}
	function createXMLHttpRequest9() {
		if (window.ActiveXObject) {
			xmlHttp9 = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp9 = new XMLHttpRequest();
		}
	}
	function createXMLHttpRequest10() {
		if (window.ActiveXObject) {
			xmlHttp10 = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp10 = new XMLHttpRequest();
		}
	}
	function createXMLHttpRequest8() {
		if (window.ActiveXObject) {
			xmlHttp8 = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp8 = new XMLHttpRequest();
		}
	}
	function createXMLHttpRequest4() {
		if (window.ActiveXObject) {
			xmlHttp4 = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp4 = new XMLHttpRequest();
		}
	}
	function createXMLHttpRequest6() {
		if (window.ActiveXObject) {
			xmlHttp6 = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp6 = new XMLHttpRequest();
		}
	}
	function createXMLHttpRequest5() {
		if (window.ActiveXObject) {
			xmlHttp5 = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp5 = new XMLHttpRequest();
		}
	}
	function createXMLHttpRequest2() {
		if (window.ActiveXObject) {
			xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp2 = new XMLHttpRequest();
		}
	}
	function searchuser()
	{
		opendiv3();
		createXMLHttpRequest4();
		var value = document.getElementById("key2").value;
		xmlHttp4.onreadystatechange = callback4;
		xmlHttp4.open("POST", "search_u", true);
		xmlHttp4.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp4.send("value=" + value);
	}
	function callback4() {
		if (xmlHttp4.readyState == 4) {
			if (xmlHttp4.status == 200) {
				makeTable4();
			}
		}
	}
	function callback10() {
		if (xmlHttp10.readyState == 4) {
			if (xmlHttp10.status == 200) {
				makeTable10();
			}
		}
	}
	function clearTable4() {
		var mybody = document.getElementById("mybody2");
		while (mybody.childNodes.length > 0) {
			mybody.removeChild(mybody.childNodes[0]);
		}
	}
	function makeTable4() {
		clearTable4();
		var mybody = document.getElementById("mybody2");
		var results = xmlHttp4.responseXML.getElementsByTagName("user");
		for (i = 0; i < results.length; i++) {
			var row = document.createElement("tr");
			var cellPname = document.createElement("td");
			var cellPwd = document.createElement("td");
			var cellEmail = document.createElement("td");
			var cellPhone = document.createElement("td");
			var cellD = document.createElement("td");
			cellPname.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("uname")[0].firstChild.nodeValue));
			cellPwd.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("upwd")[0].firstChild.nodeValue));
			cellEmail.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("uemail")[0].firstChild.nodeValue));
			cellPhone.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("uphone")[0].firstChild.nodeValue));


			var o = document.createElement('input');
			o.type = 'button';
			o.name = results[i].getElementsByTagName("uname")[0].firstChild.nodeValue;
			o.value = '编辑';
			o.setAttribute("onclick", "test4(this.name)");

			cellD.appendChild(o);
			row.appendChild(cellPname);
			row.appendChild(cellEmail);
			row.appendChild(cellPhone);

			row.appendChild(cellD);

			mybody2.appendChild(row);
		}

	}
	function searchbook() {
		opendiv();
		createXMLHttpRequest();
		var value = document.getElementById("key").value;
		xmlHttp.onreadystatechange = callback;
		xmlHttp.open("POST", "search_m", true);
		xmlHttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp.send("value=" + value);
	}
	function searchbook2(value) {
		createXMLHttpRequest2();
		xmlHttp2.onreadystatechange = callback2;
		xmlHttp2.open("POST", "search_m_m", true);
		xmlHttp2.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp2.send("value=" + value);
	}
	function searchuser2(value) {
		createXMLHttpRequest5();
		xmlHttp5.onreadystatechange = callback5;
		xmlHttp5.open("POST", "search_u_u", true);
		xmlHttp5.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp5.send("value=" + value);
	}
	function callback5() {

		if (xmlHttp5.readyState == 4) {
			if (xmlHttp5.status == 200) {
				makeTable5();
			}
		}
	}
	function callback() {

		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				makeTable();
			}
		}
	}
	function callback7() {

		if (xmlHttp7.readyState == 4) {
			if (xmlHttp7.status == 200) {
				makeTable7();
			}
		}
	}
	function callback8() {

		if (xmlHttp8.readyState == 4) {
			if (xmlHttp8.status == 200) {
				makeTable8();
			}
		}
	}
	function callback9() {

		if (xmlHttp9.readyState == 4) {
			if (xmlHttp9.status == 200) {
				makeTable9();
			}
		}
	}
	function callback6() {
		if (xmlHttp6.readyState == 4) {
			if (xmlHttp6.status == 200) {
				makeTable6();
			}
		}
	}
	function callback2() {
		if (xmlHttp2.readyState == 4) {
			if (xmlHttp2.status == 200) {
				makeTable2();
			}
		}
	}
	function makeTable2() {
		var results = xmlHttp2.responseXML.getElementsByTagName("t")[0].firstChild.nodeValue;
		var s = results.split("--");
		document.getElementById('b1').placeholder = ("直接输入即可:" + s[0]);
		document.getElementById('b2').placeholder = (s[1]);
		document.getElementById('b3').placeholder = (s[2]);
		document.getElementById('b4').placeholder = (s[3]);
		document.getElementById('b5').placeholder = (s[4]);
		document.getElementById('b6').placeholder = (s[5]);
		document.getElementById('b7').placeholder = (s[6]);
	}
	function makeTable5() {
		var results = xmlHttp5.responseXML.getElementsByTagName("t")[0].firstChild.nodeValue;
		var s = results.split("--");
		document.getElementById('u1').placeholder = ("直接输入即可:" + s[0]);
		document.getElementById('u2').placeholder = (s[1]);
		document.getElementById('u3').placeholder = (s[2]);
		document.getElementById('u4').placeholder = (s[3]);
	}
	function makeTable9() {
		clearTable9();
		var mybody = document.getElementById("mybody4");
		var results = xmlHttp9.responseXML.getElementsByTagName("give");
		for (i = 0; i < results.length; i++) {
			var row = document.createElement("tr");
			var cellusername = document.createElement("td");
			var cellTime = document.createElement("td");
			var cellD = document.createElement("td");
	
			cellusername.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("bname")[0].firstChild.nodeValue));

			cellD.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("bd")[0].firstChild.nodeValue));
			cellTime.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("btime")[0].firstChild.nodeValue));

			row.appendChild(cellusername);
			row.appendChild(cellD);
			row.appendChild(cellTime);

			mybody.appendChild(row);
		}

	}
	function makeTable7() {
		clearTable7();
		var mybody = document.getElementById("mybody3");
		var results = xmlHttp7.responseXML.getElementsByTagName("book");
		for (i = 0; i < results.length; i++) {
			var row = document.createElement("tr");
			var cellPname = document.createElement("td");
			var cellphone = document.createElement("td");
			var cellusername = document.createElement("td");
			var cellTime = document.createElement("td");
			var cellD = document.createElement("td");
			cellPname.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("bname")[0].firstChild.nodeValue));			
			cellphone.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("bphone")[0].firstChild.nodeValue));
			cellusername.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("busername")[0].firstChild.nodeValue));
			cellTime.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("btime")[0].firstChild.nodeValue));

			var o = document.createElement('input');
			o.type = 'button';
			o.name = results[i].getElementsByTagName("btime")[0].firstChild.nodeValue;
			alert(o.name);
			o.value = '处理';
			o.setAttribute("onclick", "test7(this.name)");

			cellD.appendChild(o);
			row.appendChild(cellPname);
			row.appendChild(cellphone);
			row.appendChild(cellusername);
			row.appendChild(cellTime);
			row.appendChild(cellD);

			mybody.appendChild(row);
		}

	}
	function makeTable() {
		clearTable();
		var mybody = document.getElementById("mybody");
		var results = xmlHttp.responseXML.getElementsByTagName("book");
		for (i = 0; i < results.length; i++) {
			var row = document.createElement("tr");
			var cellPid = document.createElement("td");
			var cellPname = document.createElement("td");
			var cellCla = document.createElement("td");
			var cellPre = document.createElement("td");
			var cellAll = document.createElement("td");
			var cellTime = document.createElement("td");
			var cellN = document.createElement("td");
			var cellD = document.createElement("td");
			cellPid.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("bid")[0].firstChild.nodeValue));
			cellPname.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("bname")[0].firstChild.nodeValue));
			cellCla.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("bcla")[0].firstChild.nodeValue));
			cellPre.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("bpre")[0].firstChild.nodeValue));
			cellAll.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("ball")[0].firstChild.nodeValue));
			cellTime.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("btime")[0].firstChild.nodeValue));
			cellN.appendChild(document.createTextNode(results[i]
					.getElementsByTagName("bn")[0].firstChild.nodeValue));

			var o = document.createElement('input');
			o.type = 'button';
			o.name = results[i].getElementsByTagName("bid")[0].firstChild.nodeValue;
			o.value = '编辑';
			o.setAttribute("onclick", "test(this.name)");

			cellD.appendChild(o);
			row.appendChild(cellPid);
			row.appendChild(cellPname);
			row.appendChild(cellCla);
			row.appendChild(cellPre);
			row.appendChild(cellTime);
			row.appendChild(cellAll);
			row.appendChild(cellN);
			row.appendChild(cellD);

			mybody.appendChild(row);
		}

	}

	function test4(a) {	
		opendiv4();
		searchuser2(a);
	};
	
	var delGiveHelper="";
	function test7(a) {
		delGiveHelper=a;
		closediv5();
		opendiv6();
	};
	
	function test(a) {
		opendiv2();
		searchbook2(a);
	};

	function clearTable() {
		var mybody = document.getElementById("mybody");
		while (mybody.childNodes.length > 0) {
			mybody.removeChild(mybody.childNodes[0]);
		}
	}
	function clearTable7() {
		var mybody = document.getElementById("mybody3");
		while (mybody.childNodes.length > 0) {
			mybody.removeChild(mybody.childNodes[0]);
		}
	}
	function clearTable9() {
		var mybody = document.getElementById("mybody4");
		while (mybody.childNodes.length > 0) {
			mybody.removeChild(mybody.childNodes[0]);
		}
	}
	function opendiv11() {
		document.getElementById('light11').style.display = 'block';
	}
	function closediv11() {
		document.getElementById('light11').style.display = 'none';
	}
	function opendiv6() {
		closediv5();
		document.getElementById('light6').style.display = 'block';
	}
	function closediv6() {
		document.getElementById('light6').style.display = 'none';
	}
	function opendiv5() {
		document.getElementById('light5').style.display = 'block';
	}
	function closediv5() {
		document.getElementById('light5').style.display = 'none';
	}
	function opendiv4() {
		closediv3();
		document.getElementById('light4').style.display = 'block';
	}
	function closediv4() {
		document.getElementById('light4').style.display = 'none';
	}
	function opendiv3() {
		document.getElementById('light3').style.display = 'block';
	}
	function closediv3() {
		document.getElementById('light3').style.display = 'none';
	}
	function init() {
		//ctrlYC();
	}
	function opendiv2() {
		colsediv();
		document.getElementById('light2').style.display = 'block';
	}
	function closediv2() {
		document.getElementById('light2').style.display = 'none';
	}
	function opendiv() {
		document.getElementById('light').style.display = 'block';
	}
	function colsediv() {
		document.getElementById('light').style.display = 'none';
	}
	var delay = 7;//in milliseconds
	var scroll_amount = 22;// in pixels
	var interval;
	function scroller() {
		var old = document.body.scrollTop;//保存当前滚动条到顶端的距离
		document.body.scrollTop += scroll_amount;//让滚动条继续往下滚动	 
		if (scroll_amount > 1)
			scroll_amount -= 3;
		if (document.body.scrollTop <= old) {//到底部后就无法再增加scrollTop的值
			clearInterval(interval);
		}
	}
	function scrollToBottom() {
		interval = setInterval("scroller()", delay);
	}
	function dobr() {
		document.getElementById('form1').submit();
	}
	function searchuser3(s)
	{
		createXMLHttpRequest6();
		xmlHttp6.onreadystatechange = callback6;
		xmlHttp6.open("POST", "search_u_updateuser", true);
		xmlHttp6.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp6.send("value=" + s);
	}
	function searchbook3(s) {
		createXMLHttpRequest3();
		xmlHttp3.onreadystatechange = callback3;
		xmlHttp3.open("POST", "search_m_updatebook", true);
		xmlHttp3.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp3.send("value=" + s);
	}
	function callback3() {
		if (xmlHttp3.readyState == 4) {
			if (xmlHttp3.status == 200) {
				makeTable3();
			}
		}
	}
	function createXMLHttpRequest3() {
		if (window.ActiveXObject) {
			xmlHttp3 = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp3 = new XMLHttpRequest();
		}
	}
	function makeTable3() {
		var results = xmlHttp3.responseXML.getElementsByTagName("t")[0].firstChild.nodeValue;
		alert(results);
	}
	function makeTable10() {
		var results = xmlHttp10.responseXML.getElementsByTagName("t")[0].firstChild.nodeValue;
		alert(results);
	}
	function makeTable8() {
		var results = xmlHttp8.responseXML.getElementsByTagName("t")[0].firstChild.nodeValue;
		alert(results);
	}
	function makeTable6() {
		var results = xmlHttp6.responseXML.getElementsByTagName("t")[0].firstChild.nodeValue;
		alert(results);
	}
	function DeleteBook() {
		var s="";
		s += document.getElementById('b1').placeholder.split(":")[1] + "--";
		s+="delete";
		searchbook3(s);
		closediv2();
	}
	function DeleteUser()
	{
		var s="";
		s += document.getElementById('u1').placeholder.split(":")[1] + "--";
		s+="delete";
		searchuser3(s);
		closediv4();
	}
	function UpdateUser()
	{
		var s="";
		if(document.getElementById('u1').value=="")
			s += document.getElementById('u1').placeholder.split(":")[1] + "--";
		else
			s += document.getElementById('u1').value+ "--";
		if(document.getElementById('u2').value=="")
			s += document.getElementById('u2').placeholder + "--";
		else
			s += document.getElementById('u2').value+ "--";
		if(document.getElementById('u3').value=="")
			s += document.getElementById('u3').placeholder + "--";
		else
			s += document.getElementById('u3').value+ "--";
		if(document.getElementById('u4').value=="")
			s += document.getElementById('u4').placeholder + "--";
		else
			s += document.getElementById('u4').value+ "--";
		s+=document.getElementById('u1').placeholder.split(":")[1] + "--";
		searchuser3(s);
		closediv4();
	}
	function UpdateBook() {
		var s="";
		if(document.getElementById('b1').value=="")
			s += document.getElementById('b1').placeholder.split(":")[1] + "--";
		else
			s += document.getElementById('b1').value+ "--";
		if(document.getElementById('b2').value=="")
			s += document.getElementById('b2').placeholder + "--";
		else
			s += document.getElementById('b2').value+ "--";
		if(document.getElementById('b3').value=="")
			s += document.getElementById('b3').placeholder + "--";
		else
			s += document.getElementById('b3').value+ "--";
		if(document.getElementById('b4').value=="")
			s += document.getElementById('b4').placeholder + "--";
		else
			s += document.getElementById('b4').value+ "--";
		if(document.getElementById('b5').value=="")
			s += document.getElementById('b5').placeholder + "--";
		else
			s += document.getElementById('b5').value+ "--";
		if(document.getElementById('b6').value=="")
			s += document.getElementById('b6').placeholder + "--";
		else
			s += document.getElementById('b6').value+ "--";
		if(document.getElementById('b7').value=="")
			s += document.getElementById('b7').placeholder;
		else
			s += document.getElementById('b7').value+ "--";
		s += document.getElementById('b1').placeholder.split(":")[1] + "--";
		searchbook3(s);
		closediv2();
	}
	
	
	
	function searchjz()
	{
		opendiv5();
		createXMLHttpRequest7();
		xmlHttp7.onreadystatechange = callback7;
		xmlHttp7.open("POST", "search_jz", true);
		xmlHttp7.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp7.send(null);
	}
	function clearInsert()
	{
		document.getElementById('b1').value="";
		document.getElementById('b2').value="";
		document.getElementById('b3').value="";
		document.getElementById('b4').value="";
		document.getElementById('b5').value="";
		document.getElementById('b6').value="";
		document.getElementById('b7').value="";
	}
	function dojz()
	{
		closediv6();
		clearInsert();
		opendiv2();
	}
	
	function DeleteGive()
	{
		createXMLHttpRequest8();
		xmlHttp8.onreadystatechange = callback8;
		xmlHttp8.open("POST", "search_jz_del", true);
		xmlHttp8.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp8.send("value="+delGiveHelper);
	}
	
	function doyd()
	{
		createXMLHttpRequest10();
		xmlHttp10.onreadystatechange = callback10;
		xmlHttp10.open("POST", "search_ly", true);
		xmlHttp10.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp10.send(null);
	}
	function searchmsg()
	{
		opendiv11();
		createXMLHttpRequest9();
		xmlHttp9.onreadystatechange = callback9;
		xmlHttp9.open("POST", "search_ly", true);
		xmlHttp9.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp9.send("value=select");
	}