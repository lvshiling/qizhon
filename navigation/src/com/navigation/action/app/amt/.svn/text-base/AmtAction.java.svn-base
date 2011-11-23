/**
 * 
 */
package com.navigation.action.app.amt;

import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;

import javax.annotation.Resource;

import org.apache.axis.AxisFault;

import com.navigation.action.BaseAction;
import com.navigation.dao.UserLinkDao;
import com.navigation.domain.Constant;
import com.navigation.exception.SessionException;
import com.navigation.pojo.UserLink;
import com.navigation.security.SessionUtil;
import com.navigation.utils.StringUtil;
import com.workflow.web.DealWebServiceHttpBindingStub;
import com.workflow.web.DetailModel;

/**
 * @author wanghui2
 *
 * Apr 25, 2011 1:54:38 PM
 */
public class AmtAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource
	public UserLinkDao userLinkDao;
	
	/**
	 * 取AMT信息
	 * @return
	 * @throws SessionException 
	 */
	public String index() throws SessionException{
		Integer userId_login = SessionUtil.getLogonUID();
		UserLink userLink = this.userLinkDao.getUserLink(userId_login, Constant.LINKTYPE_BIND_GIANT);
		this.getRequest().setAttribute("amtLink",userLink);
		if(userLink!=null){
			String ssoDomainName = userLink.getLinkField1();
			//ssoDomainName = "wangxin";
			URL url;
			try {
				url = new URL(Constant.AMT_LINK);
				DealWebServiceHttpBindingStub web = new DealWebServiceHttpBindingStub(url,null);
				DetailModel[] detail = web.getDeallistByUsername(ssoDomainName);
				this.getRequest().setAttribute("amtList", detail);
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (AxisFault e) {
				e.printStackTrace();
			} catch (RemoteException e) {
				e.printStackTrace();
			}
			if(!StringUtil.isNullOrEmpty(_)){
				//解绑域帐户
				int targetId = Integer.parseInt(_);
				if(userLink.getId() == targetId){
					this.userLinkDao.delete(userLink);
					this.getRequest().setAttribute("amtLink",null);
				}
			}
		}
		return "index";
	}
}
