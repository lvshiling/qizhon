/**
 * Copyright (c) ztgame.com All rights reserved.
 * member javascript function
 * 
 * v 0.1.0 - 2010/11/19 by xxxx
 * 
 * 快速注册页面相关JS
 *   
 * Requires jQuery 1.2+
 *
 */

if(typeof depiao == 'undefined') { depiao = {}; }
if(typeof depiao.user == 'undefined') { depiao.user = {}; }
(function($) {
	var prefix = "";  //ID前缀  
	
	function isIndexPage(){
		return window.location.href.indexOf("/depiao/index.do")!=-1;
	};

	function isRegisterPage(){
		return window.location.href.indexOf("/user/Register.do")!=-1;
	};
	
	function isLoginPage(url){
		if(url){
			return url.indexOf("/user/Login.do")!=-1;
		}else{
			return window.location.href.indexOf("/user/Login.do")!=-1;
		}
	};
	
	function $email(){
		return $("#"+prefix+"email");
	};
	
	function $password(){
		return $("#"+prefix+"password")
	};	
	
	function $verifyCode(){
		return $("#"+prefix+"verifyCode")
	};		

	function $validateCodeImg(){
		return $("#"+prefix+"validateCodeImg")
	};		
	
	/** 准备弹出登录页 */
	 depiao.user.preparePopupLogin = function(){
	    if(isRegisterPage() || isLoginPage()){
	       window.location.href = Path.domain+"/user/Login.do";
	       return;
	    }
		GiantAjax.responseHtml('#popupLogin', {
		    url: '/user/PopupLogin.do',
		    params: {},
		    error: function(xhr, status, error) {
		    },
		    before: function() {
		        return true;
		    },
		    success: function() {
		    	$("#popupLogin").dialog('open');
		    }
		});
	 };
	
	
	/** 绑定用户注册相关事件 */
	depiao.user.bindRegisterEvent = function(p){
	    prefix = p?p:"";
		bindPrompts();
		bindFormatCheck();
	};

	 /** 用户注册 */
	 depiao.user.register = function(){
		GiantAjax.formSubmit('#formUser', {
		    beforeSubmit: function() {
		        var $regBtn = $("#registerBtn");
		        if($regBtn.attr("registering")=="true"){
		        	return false;
		        }
		        if(!registerBeforeSubmit()){
		        	return false;
		        }
		    	$regBtn.attr("registering", "true");
		        return true;
		    },
		    success: function(data) {
		        if(data.status == giant.Status.success){
		            $("#register").hide();
		            $("#register_success").show();
		            //自动登录
		            autoLogin();
		        }else{
		    		alert(data.message);
		    		$("#registerBtn").attr("registering", "false");
		    	} 
		    },
		    dataType: 'json' 
		});	
	 };

	/* 绑定用户登录相关事件 */
	depiao.user.bindLoginEvent = function(p){
    	prefix = p?p:"";
	  	bindPrompts();
	  	bindLoginFormatCheck();
	  	bindKeyLoginSubmit("login");
	    //设置默认焦点
	    $email().focus();	  	
	};

	/* 绑定用户快速登录相关事件 */
	depiao.user.bindQuickLoginEvent = function(p){
	    prefix = p?p:"";
	  	bindKeyLoginSubmit("quickLogin");
	};

	 /** 用户登录 */
	 depiao.user.login = function(){
		GiantAjax.formSubmit('#formUser', {
		    beforeSubmit: function() {
		        var $loginBtn = $("#loginBtn");
		        if($loginBtn.attr("logining")=="true"){
		        	return false;
		        }
		        if(!loginBeforeSubmit()){
		        	return false;
		        }
		    	$loginBtn.attr("logining", "true");
		        return true;
		    },
		    success: function(data) {
		        if(data.status == giant.Status.success){
		           if(prefix==""){
			        	var targetUrl = $("#formUser").attr("targetUrl");
			        	if(targetUrl=="" || isLoginPage(targetUrl)){
			        	  //转到个人中心
			        	  window.location.href = Path.domain+"/user/MyAccount.do";
			        	}else{
			        	  //转到目标页面
			        	  window.location = $("#formUser").attr("targetUrl");
			        	}
		        	}else{
		        		window.location.reload();
		        	}
		        	
		        }else{
		            showLoginErrorMesasge(data.message);
		            $("#loginBtn").attr("logining", "false");
		    	} 
		    },
		    error:function(errData){
		    	alert(errData.message);
		    	$("#loginBtn").attr("logining", "false");
		    },
		    dataType: 'json' 
		});	
	 };
	 
	 /** 用户快速登录 */
	 depiao.user.quickLogin = function(){
		GiantAjax.formSubmit('#formQuickLogin', {
		    beforeSubmit: function() {
		        var $loginBtn = $("#quickLoginBtn");
		        if($loginBtn.attr("logining")=="true"){
		        	return false;
		        }
		        if(!quickLoginBeforeSubmit()){
		        	return false;
		        }
		    	$loginBtn.attr("logining", "true");
		        return true;
		    },
		    success: function(data) {
		        if(data.status == giant.Status.success){
		        	  window.location.reload();
		        }else{
		            alertLoginErrorMesasge(data.message);
		            $("#quickLoginBtn").attr("logining", "false");
		    	} 
		    },
		    error:function(errData){
		    	alert(errData.message);
		    	$("#quickLoginBtn").attr("logining", "false");
		    },
		    dataType: 'json' 
		});	
	 };
	 
	 
	 /** 登出 */
	 depiao.user.logout = function(){
		GiantAjax.responseJson({
		    async:false,
		    url: '/user/ajaxLogout.do',
		    params: {},
		    error: function(xhr, status, error) {
		    	
		    },
		    before: function() {
		        return true;
		    },
		    success: function(jsonData) {
		      window.location.reload();
		    }
		});
	 };

	/* 绑定修改密码相关事件 */
	depiao.user.bindModifyPasswordEvent = function(p){
	    prefix = p?p:"";
	  	bindPrompts();
	  	bindModifyPasswordFormatCheck();
	};

	 /** 修改密码 */
	 depiao.user.modifyPassword = function(){
		GiantAjax.formSubmit('#formUser', {
		    beforeSubmit: function() {
		        var $mpBtn = $("#mpasswordBtn");
		        if($mpBtn.attr("mping")=="true"){
		        	return false;
		        }
		        if(!modifyPasswordBeforeSubmit()){
		        	return false;
		        }
		    	$mpBtn.attr("mping", "true");
		        return true;
		    },
		    success: function(data) {
		        if(data.status == giant.Status.success){
		    		alert(data.message);
		        }else{
		    		alert(data.message);
		    	} 
		    	$("#mpasswordBtn").attr("mping", "false");
		    	$("#formUser")[0].reset();
		    },
		    dataType: 'json' 
		});
	 };
	 
	 
    /** 更换验证码图片, image参数可以不传 */
	depiao.user.changeValidateCode = function(p){
	    prefix = p?p:"";
		$validateCodeImg().attr("src", Path.domain+"/util/ValidateCodeServlet?"+Math.random());
	};

	/** 准备个人资料修改相关数据 */
	depiao.user.prepareModifyUserInfo = function(){
		//生成生日下拉列表
		var cmbBYear = new giant.ui.ComboBox({
		    id: 'bYear',
		    name: 'user.bYear',
		    cssClass: 'w100',
		    change: function() {
		    }
		});
		var cmbBMonth = new giant.ui.ComboBox({
		    id: 'bMonth',
		    name: 'user.bMonth',
		    cssClass: 'w100',
		    change: function() {
		    }
		});
		var cmbBDay = new giant.ui.ComboBox({
		    id: 'bDay',
		    name: 'user.bDay',
		    cssClass: 'w100',
		    change: function() {
		    }
		});
		for(var i=1911; i<2011; i++){
			cmbBYear.addItem({text:i, value:i});
		}
		for(var i=1; i<13; i++){
			cmbBMonth.addItem({text:i, value:i});
		}
		for(var i=1; i<32; i++){
			cmbBDay.addItem({text:i, value:i});
		}
		cmbBYear.select($("#bYear").attr("defaultValue"));
		cmbBMonth.select($("#bMonth").attr("defaultValue"));
		cmbBDay.select($("#bDay").attr("defaultValue"));
		//生成城市下拉列表
	    var cmbCity = new depiao.ui.City({
	        province: 'province',
	        city: 'city',
	        county: 'counties'
	    }, {
	        // 初始化时选中的各项的值
	        province: $("#province").attr("defaultValue"), city: $("#city").attr("defaultValue"), county: ''
	    });
	};


	/** 修改用户资料 */
	depiao.user.modifyUserInfo = function(){
		GiantAjax.formSubmit('#formUser', {
		    beforeSubmit: function() {
		        var $regBtn = $("#muserInfoBtn");
		        if($regBtn.attr("submiting")=="true"){
		        	return false;
		        }
		        if(!modifyUserInfoBeforeSubmit()){
		        	return false;
		        }
		    	$regBtn.attr("submiting", "true");
		        return true;
		    },
		    success: function(data) {
		        if(data.status == giant.Status.success){
		            $("#modifyUserInfo").hide();
		            $("#modifyUserInfo_success").show();
		            showUserInfo();
		        }else{
		    		alert(data.message);
		    		$("#muserInfoBtn").attr("submiting", "false");
		    	} 
		    },
		    dataType: 'json' 
		});	
	}
	
	 /** 返回未读消息数量 */
	 depiao.user.GetUnreadMsgNums = function(){
		GiantAjax.responseJson({
		    async:false,
		    url: '/user/ajaxGetUnreadNums.do',
		    params: {},
		    error: function(xhr, status, error) {
		    	
		    },
		    before: function() {
		        return true;
		    },
		    success: function(jsonData) {
		      if(jsonData.status == giant.Status.success){
		      	depiao.user.modifyUnreadMsgNums(jsonData.values.unreadNums);
		      }
		    }
		});
	 }	
	
	/** 修改未读消息数量 */
	depiao.user.modifyUnreadMsgNums = function(n){
        $("span[name='unreadMsgNums']").each(function(){
            var $this = $(this);
        	$this.text(parseInt($this.text(), 10)+parseInt(n, 10));
        });
	}
	
	/* 显示用户资源 */
	function showUserInfo(){
		$("#show_uname").text($("#uname").val());
		$("#show_b").text($("#bYear").val()+"年"+$("#bMonth").val()+"月"+$("#bDay").val()+"日");
		$("#show_pc").text(depiao.ui.City.getProvinceText($("#province").val())+"省"+depiao.ui.City.getCityText($("#province").val(), $("#city").val())+"市");
		$("#show_zip").text($("#zip").val());
		$("#show_addr").text($("#addr").val());
		$("#show_tel").text($("#tel").val());
		$("#show_mobile").text($("#mobile").val());
	};

	/* 检查数据空或格式 */
	function modifyUserInfoBeforeSubmit(){
		if($("#uname").val().trim()==""){
			alert("用户姓名不能为空!");
			$("#uname").focus();
			return false;
		}
		if($("#province").val().trim()==0 || $("#city").val().trim()==0){
			alert("省/市不能为空!");
			return false;
		}
		if($("#zip").val().trim()==""){
			alert("邮编不能为空!");
			$("#zip").focus();
			return false;
		}
		if($("#addr").val().trim()==""){
			alert("地址不能为空!");
			$("#addr").focus();
			return false;
		}		
		if($("#tel").val().trim()==""){
			alert("固定电话不能为空!");
			$("#tel").focus();
			return false;
		}
		if($("#mobile").val().trim()==""){
			alert("移动电话不能为空!");
			$("#mobile").focus();
			return false;
		}
		
		return true;
	};

  /** 注册后自动登录 */
  function autoLogin(){
		GiantAjax.responseJson({
		    async:false,
		    url: '/user/ajaxLogin.do',
		    params: {'user.email':$email().val(), 'user.password':$password().val(),'user.verifyCode':$verifyCode().val() },
		    error: function(xhr, status, error) {
		    },
		    before: function() {
		        return true;
		    },
		    success: function(data) {
		        if(data.status == giant.Status.success){
		        	//3秒后转到个人中心
		        	window.setTimeout(function(){
		        		window.location.href = Path.domain+"/user/MyAccount.do";
		        	}, 3000);	        
		        }else{
		            window.location.href = Path.domain+"/user/Login.do";
		    	}
		    }
		});	
  };  



   function showLoginErrorMesasge(msg){
     	var msgs = msg.split(":");
 		switch(msgs[0]){
 			case "verifyCode":
	 			$("#verifyCode_error").show();
	 			break;
 			case "email":
	 			$("#email_not_exist_error").show();
	 			break;		
 			case "password":
	 			$("#password_error").show();
	 			break;		
 		}
   };

   function alertLoginErrorMesasge(msg){
     	var msgs = msg.split(":");
     	if(msgs.length>1){
     		alert(msgs[1]);
     	}else{
     		alert(msgs[0]);
     	}
   };

	/* 绑定通过键盘, type为quickLogin或login */
	function bindKeyLoginSubmit(type){
		$email().keypress(function(event){
			return keyLogin(type, event);
		});
		$password().keypress(function(event){
			return keyLogin(type, event);
		});	
		$verifyCode().keypress(function(event){
			return keyLogin(type, event);
		});		
	}
	function keyLogin(type, event){
	  if(event.keyCode==13){
	     if(type=="quickLogin"){
	        depiao.user.quickLogin();
	     }else{
			depiao.user.login();
		 }
		 return false;
	  }
	  return true;
	}
	
	/** 绑定输入提示 */
	function bindPrompts(){
		//当焦点在输入框上时显示输入提示
		$email().focus(function(){
		    $("#email_format_error").hide();
		    $("#email_empty_error").hide();
		    $("#email_exist_error").hide();
		    $("#email_not_exist_error").hide();
		    $("#email_ok").hide();
			$("#email_prompt").show();
		});
		$email().blur(function(){
			$("#email_prompt").hide();
		});

		$password().focus(function(){
			$("#password_format_error").hide();
			$("#password_error").hide();
			$("#password_ok").hide();
			$("#password_prompt").show();
		});
		$password().blur(function(){
			$("#password_prompt").hide();
		});
		
		$("#apassword").focus(function(){
		    $("#apassword_empty_error").hide();
		    $("#apassword_error").hide();
			$("#apassword_ok").hide();
			$("#apassword_prompt").show();
		});
		$("#apassword").blur(function(){
			$("#apassword_prompt").hide();
		});

		$("#opassword").focus(function(){
			$("#opassword_error").hide();
			$("#opassword_ok").hide();
			$("#opassword_prompt").show();
		});
		$("#opassword").blur(function(){
			$("#opassword_prompt").hide();
		});
		

		$verifyCode().focus(function(){
			$("#verifyCode_empty_error").hide();
			$("#verifyCode_error").hide();
			$("#verifyCode_ok").hide();
			$("#verifyCode_prompt").show();
		});
		$verifyCode().blur(function(){
			$("#verifyCode_prompt").hide();
		});

	};

	/** 绑定注册格式检查 */
	function bindFormatCheck(){
		$email().blur(function(){
		    if(emailIsEmpty()){
				return false;
			}
			//检查帐号格式
			if(!checkEmailFormat()){
				return false;
			}
			//检查帐号是否已经存在
			if(checkEmailExist()){
				return false;
			}
			
			$("#email_ok").show();
		});

		$password().blur(function(){
			if(passwordIsEmpty()){
				return false;
			}
	
			//检查密码格式
			if(!checkPasswordFormat()){
				return false;
			}

			$("#password_ok").show();
		});
		
		$("#apassword").blur(function(){
			if(aPasswordIsEmpty()){
				return false;
			}
			
			//检查确认密码
			if(!checkAPassword()){
				return false;
			}
			
			$("#apassword_ok").show();
		});
		
		$verifyCode().blur(function(){
			if(verifyCodeIsEmpty()){
				return false;
			}
			if(!checkVerifyCode()){
				return false;
			}
			
			$("#verifyCode_ok").show();
		});
		
	};

	/** 绑定登录格式检查 */
	function bindLoginFormatCheck(){
		$email().blur(function(){
		    if(emailIsEmpty()){
				return false;
			}
			//检查帐号格式
			if(!checkEmailFormat()){
				return false;
			}
			//检查帐号是否已经存在
			asyncCheckEmailExist();

		});

		$password().blur(function(){
			if(passwordIsEmpty()){
				return false;
			}
			//检查密码格式
			//if(!checkPasswordFormat()){
			//	return false;
			//}
		});
		
		$verifyCode().blur(function(){
			if(verifyCodeIsEmpty()){
				return false;
			}
			if(!checkVerifyCode()){
				return false;
			}
		});
		
	};
	
	
	/** 绑定修改密码格式检查 */
	function bindModifyPasswordFormatCheck(){

		$("#opassword").blur(function(){
			//检查密码格式
			if(oPasswordIsEmpty()){
				return false;
			}
		});

		$password().blur(function(){
			//检查密码格式
			if(!checkPasswordFormat()){
				return false;
			}

			$("#password_ok").show();
		});
		
		$("#apassword").blur(function(){
			if(aPasswordIsEmpty()){
				return false;
			}
			
			//检查确认密码
			if(!checkAPassword()){
				return false;
			}
			
			$("#apassword_ok").show();
		});
		
	};

  /** 注册前的检查 */  
  function registerBeforeSubmit(){
		if(emailIsEmpty()){
			return false;
		}
		//检查帐号格式
		if(!checkEmailFormat()){
			return false;
		}
		//检查帐号是否已经存在
		if(checkEmailExist()){
			return false;
		}

		if(passwordIsEmpty()){
			return false;
		}
		//检查密码格式
		if(!checkPasswordFormat()){
			return false;
		}
		if(aPasswordIsEmpty()){
			return false;
		}
		//检查确认密码
		if(!checkAPassword()){
			return false;
		}
		
		if(verifyCodeIsEmpty()){
			return false;
		}
		if(!checkVerifyCode()){
			return false;
		}
		return true;		  
	};

	function loginBeforeSubmit(){
		if(emailIsEmpty()){
			return false;
		}
		//检查帐号格式
		if(!checkEmailFormat()){
			return false;
		}
		//检查帐号是否存在
		if(!checkEmailExist()){
			return false;
		}

		if(passwordIsEmpty()){
			return false;
		}
		
		if(verifyCodeIsEmpty()){
			return false;
		}
		if(!checkVerifyCode()){
			return false;
		}
		return true;		
	};

	function quickLoginBeforeSubmit(){
		if(emailIsEmpty()){
			alert("请正确输入登录帐号!", function(){
				$email().focus();
			});
			return false;
		}
		//检查帐号格式
		if(!checkEmailFormat()){
		    alert("登录帐号格式错误!", function(){
				$email().focus();
			});
			return false;
		}
		if(passwordIsEmpty()){
		    alert("请正确输入登录密码!", function(){
				$password().focus();
			});
			return false;
		}
		if(verifyCodeIsEmpty()){
		    alert("请正确输入验证码!", function(){
				$verifyCode().focus();
			});
			return false;
		}
		if(!checkVerifyCode()){
		    alert("验证码输入有误!", function(){
				$verifyCode().focus();
			});
			return false;
		}
		return true;		
	};

	function modifyPasswordBeforeSubmit(){
		if(oPasswordIsEmpty()){
			return false;
		}	
		//检查密码格式
		if(!checkPasswordFormat()){
			return false;
		}
		if(aPasswordIsEmpty()){
			return false;
		}
		//检查确认密码
		if(!checkAPassword()){
			return false;
		}
		return true;
	};

	/** 检查email帐号 空 */
	function emailIsEmpty(){
		if($email().val()==""){
		  $("#email_empty_error").show();
		  return true;
		}else{
		  $("#email_empty_error").hide();
		  return false;
		}		
	};

	/** 检查密码 空 */
	function passwordIsEmpty(){
		if($password().val()==""){
		  $("#password_format_error").show();
		  return true;
		}else{
		  $("#password_format_error").hide();
		  return false;
		}			
	};	
	
	/** 检查确认密码 空 */
	function aPasswordIsEmpty(){
		if($("#apassword").val()==""){
		  $("#apassword_empty_error").show();
		  return true;
		}else{
		  $("#apassword_empty_error").hide();
		  return false;
		}
	};	

	/** 检查当前密码 空 */
	function oPasswordIsEmpty(){
		if($("#opassword").val()==""){
		  $("#opassword_empty_error").show();
		  return true;
		}else{
		  $("#opassword_empty_error").hide();
		  return false;
		}
	};


	/** 检查验证码 空 */
	function verifyCodeIsEmpty(){
		if($verifyCode().val()==""){
		  $("#verifyCode_empty_error").show();
		  return true;
		}else{
		  $("#verifyCode_empty_error").hide();
		  return false;
		}
	};	

	/** 检查帐号格式, 验证成功返回true，否则返回false */
	function checkEmailFormat(){
		var emailFormatError = !isEmail($email().val());
		if(emailFormatError){
			$("#email_format_error").show();
			return false;
		}else{
			$("#email_format_error").hide();
			return true;
		}		
	};
	
	/** 检查帐号是否存在, 如果存在返回true, 否则返回false */
	function checkEmailExist(){
		//@TODO 调用后台检查
		var checkEmailExist = false;
		GiantAjax.responseJson({
		    async:false,
		    url: '/user/ajaxEmailIsExist.do',
		    params: {'user.email':$email().val() },
		    error: function(xhr, status, error) {
		    },
		    before: function() {
		        return true;
		    },
		    success: function(jsonData) {
		    	if(jsonData.values.isExist=="true"){
		        	checkEmailExist = true;
		        }
		    }
		});
		
		if(checkEmailExist){
			$("#email_exist_error").show();
			$("#email_not_exist_error").hide();
			
			return true;
		}else{
			$("#email_exist_error").hide();
			$("#email_not_exist_error").show();
			return false;
		}		
	};
	
	/** 检查帐号是否存在, 如果存在返回true, 否则返回false */
	function asyncCheckEmailExist(){
		//@TODO 调用后台检查
		GiantAjax.responseJson({
		    async:true,
		    url: '/user/ajaxEmailIsExist.do',
		    params: {'user.email':$email().val() },
		    error: function(xhr, status, error) {
		    },
		    before: function() {
		        return true;
		    },
		    success: function(jsonData) {
		    	if(jsonData.values.isExist=="true"){
					$("#email_exist_error").show();
					$("#email_not_exist_error").hide();
				}else{
					$("#email_exist_error").hide();
					$("#email_not_exist_error").show();
				}			    
			}
		});
	};	
	
	/** 检查密码格式, 验证成功返回true，否则返回false */
	function checkPasswordFormat(){
		var passwordError = $password().val().length<6;
		if(passwordError){
			$("#password_format_error").show();
			return false;
		}else{
			$("#password_format_error").hide();
			return true;
		}			
	};	

	/** 检查两次输入的密码是否一致, 一致返回true, 否则返回false */
	function checkAPassword(){
		if($password().val() != $("#apassword").val()){
			$("#apassword_error").show();
			return false;
		}else{
			$("#apassword_error").hide();
			return true;
		}	
	};

	/** 检查检验码输入是否正确, 正确，返回true, 否则返回false */
	function checkVerifyCode(){
		var verifyCodeError = false;
		GiantAjax.responseJson({
		    async:false,
		    url: '/user/ajaxCheckVerifyCode.do',
		    params: {'user.verifyCode':$verifyCode().val() },
		    error: function(xhr, status, error) {
		    },
		    before: function() {
		        return true;
		    },
		    success: function(jsonData) {
		    	if(jsonData.values.isCorrect=="false"){
		        	verifyCodeError = true;
		        }
		    }
		});		
		
		
		if(verifyCodeError){
			$("#verifyCode_error").show();
			return false;
		}else{
			$("#verifyCode_error").hide();
			return true;
		}	
	}
	

    function isEmail(str){
        var re = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;  
        return re.test(str);  
    }  

})(jQuery);