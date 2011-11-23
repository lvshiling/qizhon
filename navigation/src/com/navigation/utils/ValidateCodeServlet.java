package com.navigation.utils; 

import java.awt.Color; 
import java.awt.Font; 
import java.awt.Graphics2D; 
import java.awt.image.BufferedImage; 
import java.util.Date;
import java.util.Random; 

import javax.imageio.ImageIO; 
import javax.servlet.ServletException; 
import javax.servlet.ServletOutputStream; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession; 

/**
 * 生成随机验证码
 * 
 * @author bitiliu
 * 
 */
public class ValidateCodeServlet extends HttpServlet 
{

	private static final long serialVersionUID = 1L; 
	
	// 验证码图片的宽度。
	private int width=60; 
	// 验证码图片的高度。
	private int height=20; 
	// 验证码字符个数
	private int codeCount=4; 
	// 验证码超时时间, 单位：毫秒
	private static long overtime=120*1000; //2分钟
	
	// 验证码在session中的Key名, 默认validateCode
	public static final String DefaultValidateCodeKey = "validateCode";
	// 生成验证码时间在session中的Key名, 默认validateCodeDate
	public static final String DefaultValidateCodeDateKey = "validateCodeDate";
	
	private int x=0; 
	// 字体高度
	private int fontHeight; 
	private int codeY; 
	
	char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J',
	'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
	'X', 'Y', 'Z', '2', '3', '4', '5', '6', '7', '8', '9' }; 
	
	Color[] colorSequence = {Color.BLACK,Color.BLUE,Color.CYAN,Color.DARK_GRAY,Color.GRAY,Color.GREEN,
			Color.ORANGE,Color.RED};
	
	
	/**
	 * 检查验证码是否正确, 正确，返回true
	 */
	public static boolean checkValidateCode(HttpSession session, String userVCode, String validateCodeKey, String validateCodeDateKey){
        String sessionVCode = (String)session.getAttribute(validateCodeKey);
        Long sessionVCodeDate = (Long)session.getAttribute(validateCodeDateKey);
        return sessionVCodeDate!=null && (sessionVCodeDate.longValue()+ overtime)>new Date().getTime()
            && !StringUtils.isNullOrEmpty(userVCode) 
            && !StringUtils.isNullOrEmpty(sessionVCode)
            && userVCode.equalsIgnoreCase(sessionVCode);        
	}
    /**
     * 检查验证码是否正确, 正确，返回true
     */
    public static boolean checkValidateCode(HttpSession session, String userVCode){
        return checkValidateCode(session, userVCode, DefaultValidateCodeKey, DefaultValidateCodeDateKey);
    }
	
	/**
	 * 初始化验证图片属性
	 */
	public void init() throws ServletException
	{
		// 从web.xml中获取初始信息
		// 宽度
		String strWidth=this.getInitParameter("width"); 
		// 高度
		String strHeight=this.getInitParameter("height"); 
		// 字符个数
		String strCodeCount=this.getInitParameter("codeCount"); 
		
		// 将配置的信息转换成数值
		try
		{
			if(strWidth!=null && strWidth.length()!=0)
			{
				width=Integer.parseInt(strWidth); 
			}
			if(strHeight!=null && strHeight.length()!=0)
			{
				height=Integer.parseInt(strHeight); 
			}
			if(strCodeCount!=null && strCodeCount.length()!=0)
			{
				codeCount=Integer.parseInt(strCodeCount); 
			}
		}
		catch(NumberFormatException e)
		{}
		
		x=width/(codeCount); 
		fontHeight=height-2; 
		codeY=height-4; 
	
	}
	
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, java.io.IOException {
	    String vCodeKey = req.getParameter("validateCodeKey");
	    String vCodeDateKey = req.getParameter("validateCodeDateKey");
	    if(StringUtils.isNullOrEmpty(vCodeKey)){
	        vCodeKey = DefaultValidateCodeKey;
	    }
        if(StringUtils.isNullOrEmpty(vCodeDateKey)){
            vCodeDateKey = DefaultValidateCodeDateKey;
        }
        
		// 定义图像buffer
		BufferedImage buffImg = new BufferedImage(
		width, height,BufferedImage.TYPE_INT_RGB); 
		Graphics2D g = buffImg.createGraphics(); 
		
		// 创建一个随机数生成器类
		Random random = new Random(); 
		
		// 将图像填充为白色
		g.setColor(Color.WHITE); 
		g.fillRect(0, 0, width, height); 
		
		// 创建字体，字体的大小应该根据图片的高度来定。
		Font font = new Font("Arial", Font.BOLD, fontHeight); 
		// 设置字体。
		g.setFont(font); 
		
		// 画边框。
		g.setColor(Color.BLACK); 
		g.drawRect(0, 0, width - 1, height - 1); 
		
		// randomCode用于保存随机产生的验证码，以便用户登录后进行验证。
		StringBuffer randomCode = new StringBuffer(); 
		int red = 0, green = 0, blue = 0; 
		
		// 随机产生160条干扰线，使图象中的认证码不易被其它程序探测到。
		g.setColor(Color.PINK); 
		for(int i = 0; i < 50; i++) 
		{
			int x = random.nextInt(width); 
			int y = random.nextInt(height); 
			int xl = random.nextInt(12); 
			int yl = random.nextInt(12); 
//			// 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。
//			red = random.nextInt(255); 
//			green = random.nextInt(255); 
//			blue = random.nextInt(255); 
//			
//			// 用随机产生的颜色将验证码绘制到图像中。
//			g.setColor(new Color(red, green, blue)); 
			g.drawLine(x, y, x + xl, y + yl); 
		}
		// 随机产生codeCount数字的验证码。
		for (int i = 0; i < codeCount; i++) {
			// 得到随机产生的验证码数字。
			String strRand = String.valueOf(codeSequence[random.nextInt(codeSequence.length)]); 
			// 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。
//			red = random.nextInt(255); 
//			green = random.nextInt(255); 
//			blue = random.nextInt(255); 
			
			// 用随机产生的颜色将验证码绘制到图像中。
			//g.setColor(new Color(red, green, blue)); 
			g.setColor(colorSequence[random.nextInt(colorSequence.length)]);
			//g.setColor(Color.BLACK);
			g.drawString(strRand, i*x+1, codeY); 
			
			// 将产生的四个随机数组合在一起。
			randomCode.append(strRand); 
		}
		
		
		// 将四位数字的验证码保存到Session中。
		HttpSession session = req.getSession(); 
		session.setAttribute(vCodeKey, randomCode.toString()); 
		session.setAttribute(vCodeDateKey, (new Date()).getTime()); 
		
		// 禁止图像缓存。
		resp.setHeader("Pragma", "no-cache"); 
		resp.setHeader("Cache-Control", "no-cache"); 
		resp.setDateHeader("Expires", 0); 
		resp.setContentType("image/jpeg"); 
		
		// 将图像输出到Servlet输出流中。
		ServletOutputStream sos = resp.getOutputStream(); 
		ImageIO.write(buffImg, "jpeg", sos); 
		sos.close(); 
	}
}