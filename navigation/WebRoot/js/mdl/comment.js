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
if(typeof depiao.comment == 'undefined') { depiao.comment = {}; }
(function($) {

	//标记是否正在输入内容
	var writing = false;

	/** 绑定评论相关事件 */
	depiao.comment.bindCommentEvent = function(){
	    //去掉“我也来说两句..”
		$("#cmtContent").focus(function(){
			if(!writing){
				writing = true;
				this.value = "";
			}
		});
	};

   /** 分类列表评论 */
   depiao.comment.sortComments = function(sortId){
     $('#commentSortId').val(sortId);
     depiao.comment.loadComments();
   };
   

	/** 生成评论列表 */
	depiao.comment.loadComments = function(p){
		p = p?p:1;
		var tid = $("#tid").val();
		var pageSize = $("#commentPageSize").val();
		var userId = $("#commentUserId").val();
		var sortId = $("#commentSortId").val();
		
		GiantAjax.responseHtml('#comments', {
		    url: '/comment/loadComments.do',
		    params: {userId:userId, tid:tid, sortId:sortId, p:p, pageSize:pageSize},
		    error: function(xhr, status, error) {
		    },
		    before: function() {
		        return true;
		    },
		    success: function() {
		    }
		});
	};

	/** 创建一条评论 */
	depiao.comment.create = function(){
	    var $commentBtn = $("#commentBtn");
		GiantAjax.formSubmit('#formComment', {
		    beforeSubmit: function() {
		        if($commentBtn.attr("submiting")=="true"){
		        	return false;
		        }
		        if(!commentBeforeSubmit()){
		        	return false;
		        }
		    	$commentBtn.attr("submiting", "true");
		        return true;
		    },
		    success: function(data) {
		        if(data.status == giant.Status.success){
		        	  $("#cmtContent").val("");
		        	  alert("评论成功", function(){
		        	  	$("#cmtContent").focus();
		        	  });
		        	  depiao.comment.loadComments();
		        }else{
		            alert(data.message);
		    	} 
		    	$commentBtn.attr("submiting", "false");
		    },
		    error:function(errData){
		    	alert(data.message);
		    	$commentBtn.attr("submiting", "false");
		    },
		    dataType: 'json' 
		});	
	};

	function commentBeforeSubmit(){
	    var content =  $("#cmtContent").val().trim();
	    var len = content.length;
		if(!writing || len==0){
			alert("评论内容不能为空!", function(){
				$("#cmtContent").focus();
			});
			return false;
		}
		if(len<50){
			alert("您还需要输入"+(50-len)+"字, 至少输入50字!", function(){
				$("#cmtContent").focus();
			});
			return false;
		}
		if(len>500){
			alert("您的评价超过"+(len-500)+"字, 最多只能输入500字!", function(){
				$("#cmtContent").focus();
			});
			return false;
		}
		
		return true;
	};

})(jQuery);