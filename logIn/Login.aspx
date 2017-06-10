<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Manage_Login" %>
<!DOCTYPE html>
<html>
<head>
	<title>登录</title>
	<meta charset = "UTF-8"/>
	<link rel="stylesheet" type="text/css" href="css/loinCss.css">
     <script type="text/javascript" src="JsRsa/jquery-3.1.1.min.js"></script>
    <script src="JsRsa/jQuery.md5.js" type="text/javascript"></script>
    <script src="JsRsa/BigInt.js" type="text/javascript"></script>
    <script src="JsRsa/RSA.js" type="text/javascript"></script>
    <script src="JsRsa/Barrett.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            //强制清空密码框
            $("#password").val('');
            $("#form1").submit(function (e) {
                //验证密码长度
                if ($("#password").val().length > 25) {
                    alert("输入有误，刷新中！");
                    window.location.replace(window.location.href);
                    return false;
                }
                var c = $.cookie('_RSA'); // 读取 cookie 
                var keyPair = new Object();
                if (c) {
                    var str = c;
                    var arr = str.split("&");
                    for (var i = 0; i < arr.length; i++) {
                        var tmp_arr = arr[i].split("=");
                        keyPair[decodeURIComponent(tmp_arr[0])] = decodeURIComponent(tmp_arr[1]);
                    }
                    //encryptBegin
                    setMaxDigits(129);
                    var key = new RSAKeyPair(keyPair['Exponent'], "", keyPair['Modulus']);
                    var pwd = $("#password").val();
                    var pwdRtn = encryptedString(key, pwd).toUpperCase();
                    $("#password").val(pwdRtn);
                }
                else {
                    alert("登录页面过期，刷新中！");
                    window.location.replace(window.location.href);
                    return false;
                }

            });
            
            ////取出有clear类的input域
            ////(注: "clear once" 是两个class clear 和 once)
            //$('.txtfield').each(function () {
            //    //使用data方法存储数据
            //    $(this).data("txt", $.trim($(this).val()));
            //}).focus(function () {
            //    // 获得焦点时判断域内的值是否和默认值相同，如果相同则清空
            //    if ($.trim($(this).val()) === $(this).data("txt")) {
            //        $(this).val("");
            //    }
            //}).blur(function () {
            //    // 为有class clear的域添加blur时间来恢复默认值
            //    // 但如果class是once则忽略
            //    if ($.trim($(this).val()) === "" && !$(this).hasClass("once")) {
            //        //Restore saved data
            //        $(this).val($(this).data("txt"));
            //    }
            //});
            
        });
    </script>

</head>
<body>
	<canvas class="login-bg" id="bg" height="617" width="1280">
	</canvas>
	<div class="logIn-cont">

	<div class="logIn-main">
		<div class="logIn-title">
			<div class="logIn-maintitle">
				<div>
				<img src="images/lineer.png">
				<h1>信息科学与工程学院管理登录</h1>
				<img src="images/lineer.png">
				</div>
			</div>
			<div class="logIn-secondtitle">
				<h2>Colege of Information Science and Engineering Administrator Login</h2>
			</div>			
		</div>
    
<%--        <script>

            function adjust(obj) {
                var hight = document.documentElement.clientHeight;
                var mainHight = $(".logIn-main").height();
                var endhight = (hight - mainHight) / 2 + "px";

                $(".logIn-cont").css("padding-top", endhight);
            }
            window.onload = function () {
                window.onresize = adjust;
                adjust();
            }
        </script>--%>

           <form id="form1" runat="server" >
		<div class="lodIn-cont">

			<div>
                <%--<input type="text" name="username" id="username" class="txtfield" tabindex="1" value="请输入用户名">--%>
                <asp:TextBox ID="username"  runat ="server"  CssClass="txtfield" TabIndex="1" Text="请输入用户名"></asp:TextBox>
				<asp:RequiredFieldValidator ID="valrName" runat="server" ErrorMessage="学号/工号不能为空" ControlToValidate="username" ForeColor="Red" ValidationGroup="valid"></asp:RequiredFieldValidator>

			</div>
     	 	<div class="pass">

     	 		<span id="password_text" onclick="this.style.display='none';document.getElementById('password').style.display='inline-block';document.getElementById('password').focus();" >密码</span>
				<%--<input name="password" type="password" id="password" style="display:none;" onblur="if(this.value==''){document.getElementById('password_text').style.display='inline-block';this.style.display='none'};"/>--%>
                  <asp:TextBox ID="password" runat ="server" MaxLength="20" TextMode="Password"  style="display:none;" onblur="if(this.value==''){document.getElementById('password_text').style.display='inline-block';this.style.display='none'};" />
				<asp:RequiredFieldValidator ID="valrPassword" runat="server" ErrorMessage="密码不能为空" ControlToValidate="password" ForeColor="Red" ValidationGroup="valid" ></asp:RequiredFieldValidator>



     	 		</div>


     	 	<div class="logIn-check">

  


     	 		<div>
                      <%--<input type="text" name="check" id="check" class="txtfield" value="请输入验证码" />--%>
                      <asp:TextBox ID="check" runat ="server" CssClass="txtfield" Text ="请输入验证码 " MaxLength="5"></asp:TextBox>

                                 <img  src ="captcha.aspx"  id="valiImg" alt="validate" width="170" height="40" onclick="reflash();"/>
                <script>
            function reflash() {
                $("#valiImg").attr("src", 'captcha.aspx?time=' + Math.random());
            }
        </script>

     	 		<%--<img src="images/logIn.jpg">--%>

     	 		</div>
     	 	</div>
		</div>
		<div class="logIn-button">
          	<div>
                  <%--<input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="登录" tabindex="4">--%>

                  <asp:Button ID="loginbtn" runat ="server" CssClass="flatbtn-blu hidemodal" Text="登录" TabIndex="4" ValidationGroup="valid" OnClick="BtnLogin_Click" />
          	</div>
          	<div>
                <asp:Button ID="rntHome" runat ="server" CssClass="flatbtn-blu hidemodal" Text ="返回首页" PostBackUrl="www.baidu.com" TabIndex="5" />
                   <%--<input type="submit" name="zhubtn" id="zhubtn" class="flatbtn-blu hidemodal" value="返回" tabindex="5" >--%>
          	</div>
      	</div>

            </form>

      </div>
	</div>
	<script type="text/javascript" src="jsRsa/logInJs.js"></script>
	<script type="text/javascript">
		var bg = document.getElementById("bg");
		var ctx = bg.getContext("2d");
		
		//making the canvas full screen
		bg.height = window.innerHeight;
		bg.width = window.innerWidth;
		
		//chinese characters - taken from the unicode charset
		var chinese = "01";
		//converting the string into an array of single characters
		chinese = chinese.split("");
		
		var font_size = 14;
		var line_height = 18;
		var columns = bg.width/(font_size + line_height); //number of columns for the rain
		//an array of drops - one per column
		var drops = [];
		//x below is the x coordinate
		//1 = y co-ordinate of the drop(same for every drop initially)
		for(var x = 0; x < columns; x++) {
			drops[x] = 1; 
		}
		
		var loop = 0;
		//drawing the characters
		function draw()
		{
			loop++;
			if (loop > 100) {
				//清空背景
				ctx.fillStyle = "rgba(245, 249, 250, .5)";
				//ctx.fillStyle = "rgba(0, 0, 0, .5)";
				ctx.fillRect(0, 0, bg.width, bg.height);
				loop = 0;
			} else {
				//Black BG for the canvas
				//translucent BG to show trail
				ctx.fillStyle = "rgba(245, 249, 250, .12)"; //字符消失速度
				//ctx.fillStyle = "rgba(0, 0, 0, .12)";
				ctx.fillRect(0, 0, bg.width, bg.height);
			}
			
			ctx.fillStyle = "#9ba0a3"; //green text
			//ctx.fillStyle = "#2ECC71";
			ctx.font = font_size + "px arial";
			//looping over drops
			var dropsL = drops.length
			for(var i = 0; i < dropsL; i++)
			{
				//a random chinese character to print
				var text = chinese[Math.floor(Math.random()*chinese.length)];
				//x = i*font_size, y = value of drops[i]*font_size
				ctx.fillText(text, i*(font_size + line_height), drops[i]*(font_size + 4));
				
				//sending the drop back to the top randomly after it has crossed the screen
				//adding a randomness to the reset to make the drops scattered on the Y axis
				if(drops[i]*font_size > bg.height && Math.random() > 0.995) //密集程度，越大越稀疏
					drops[i] = 0;
				
				//incrementing Y coordinate
				drops[i]++;
			}
		}
		setInterval(draw, 40);  //重复绘制，下降速度


    
    </script>
        <script type="text/javascript" src="JsRsa/jquery.cookie-1.4.1.min.js"></script>
</body>
</html>