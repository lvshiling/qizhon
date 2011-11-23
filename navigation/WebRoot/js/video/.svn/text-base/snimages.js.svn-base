var suningImages = function(){
	var box = $('#bigpics');
	var image = $('#pics');
	var btn = image.find('li');
	var len = btn.length ;
	var ul = image.find('ul');
	
	return{
		init:function(){
			var that = this ;
			var posx ;
			var posy ;
			var i = 0 ;
			ul.css('width',97);
			image.prev('div').click(function(e){
				//alert($(this));
				if(i<=0){
					return false;
				}
				i--;
				that.scroll(i);
				e.preventDefault();
			})
			
			image.next('div').click(function(e){
				if(i>= parseInt(len/5) || len<=5 ){
					return false;
				}
				i++;	
				that.scroll(i);
				e.preventDefault();
			})
			
			
			btn.each(function(i){
				$(this).find('a').click(function(e){
					index = i ;							 
					that.addbk(i);
					that.loadimg(i);
					e.preventDefault();
				})
			})

			var index = 0 ;
			box.click(function(e){
				var e = e || window.event ;
				posx = e.clientY ;
				//判断鼠标位置，鼠标位置大于图片1/2处加
				if(posx>document.documentElement.clientHeight/2){
					index++;
					if(index>=len)
					{
						index=0;
						ul.stop().animate({marginTop: 0 },300);
					}
					that.next(index);
				}else{
					index--;
					if(index<0){
						index=len-1;
						ul.stop().animate({marginTop: -100*parseInt(index/5)*5 },300);
					};
					that.prev(index);
				}	
				e.preventDefault();
			}).mousemove(function(e){
				var e = e || window.event ;
				posx = e.clientY ;
				if(posx>document.documentElement.clientHeight/2){
					box.css('cursor','url("http://img.baidu.com/img/image/mousedown_is.cur"), pointer');
					box.attr('title','下一张');
				}else{
					box.css('cursor','url("http://img.baidu.com/img/image/mouseup_is.cur"), pointer');
					box.attr('title','上一张');
				}
			});
			
			$(document).keyup(function(e){
				var e = e || window.event ;
				if(e.which == 39){
					index++;
					if(index>=len){
						index=0;
						ul.stop().animate({marginTop: 0 },300);
					}
					that.next(index);
					
				}else if(e.which== 37 ){
					index--;
					if(index<0){
						index=len-1;
						ul.stop().animate({marginTop: -100*parseInt(index/5)*5 },300);
					};
					that.prev(index);
				}
			});
			
		},
		loadimg:function(i){
			box.html('<div class="loading"></div>');
			var src = btn.eq(i).find('img').attr('src');
			var maxlen = src.length;
			newsrc = src.slice(0,maxlen-4)+".jpg";
			box.html('<img src = ' +newsrc+'  />' ).find('img').hide();
			box.find('img').fadeIn(250);
				var oHeight = $("td").find('img');
				if(oHeight.height()>550){
					oHeight.css('height',550);	
				}
		},
		addbk:function(i){
			btn.eq(i).find('a').addClass('on').parent().siblings().find('a').removeClass('on');
		},
		scroll:function(i){
			ul.stop().animate({marginTop: -100*5*i },300);
		},
		next:function(index){
			var that = this ;
			if(((index)%5)==0){
				ul.stop().animate({marginTop: -100*(index) },300);
			}
			that.addbk(index);
			setTimeout(function(){that.loadimg(index);},400);
		},
		prev:function(index){
			var that = this ;
			if((index+1)%5==0){
				ul.stop().animate({marginTop: -100*parseInt(index/5)*5 },300);
			}
			that.addbk(index);
			setTimeout(function(){that.loadimg(index);},400);
		}
	}
}
$(document).ready(function(){
	suningImages().init();
})