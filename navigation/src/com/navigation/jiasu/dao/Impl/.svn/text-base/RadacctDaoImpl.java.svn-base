/**
 * 
 */
package com.navigation.jiasu.dao.Impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.navigation.dao.base.DaoSupport;
import com.navigation.domain.PageBean;
import com.navigation.jiasu.dao.RadacctDao;
import com.navigation.jiasu.pojo.Radacct;
import com.navigation.utils.DateUtils;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class RadacctDaoImpl extends DaoSupport implements RadacctDao {

	/**
	 * 创建对象
	 */
	public Radacct save(Radacct user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(Radacct record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public Radacct get(Serializable id) {
        return super.get(Radacct.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(Radacct record) {
		super.update(record);
	}

	public List<Radacct> getList(String name,Integer p,Integer pageSize, String startDate, String endDate) {
		Date start = DateUtils.parse(startDate, "yyyyMMdd");
		Date end = DateUtils.addDay(DateUtils.parse(endDate, "yyyyMMdd"), 1);
		String hql = " from Radacct r where r.username = ? and r.acctstarttime > ? and r.acctstoptime < ?";
		Object[] params = new Object[]{name,start,end};
		return super.find(hql,params,(p-1)*pageSize,pageSize);
	}

	public PageBean getListByName(String name, Integer p, Integer pageSize,String startDate, String endDate) {
		Integer count = this.getListCount(name,startDate,endDate);
		if(count > 0 ){
			PageBean pb = new PageBean();
			List<Radacct> list = this.getList(name, p, pageSize,startDate,endDate);
			for (Radacct radacct : list) {
				Integer time = radacct.getAcctsessiontime();
				if(time > 0)radacct.setAcctsessiontime(time/60+1);
			}
			pb.setRecordList(list);
			pb.setRecordCount(count);
			return pb;
		}
		return null;
	}

	public Integer getListCount(String name, String startDate, String endDate) {
		Date start = DateUtils.parse(startDate, "yyyyMMdd");
		Date end = DateUtils.addDay(DateUtils.parse(endDate, "yyyyMMdd"), 1);
		String hql = "select count(*) from Radacct r where r.username = ? and r.acctstarttime > ? and r.acctstoptime < ?";
		Object[] params = new Object[]{name,start,end};
		return super.count(hql, params);
	}

	public Integer getTimeCount(String target, String startDate, String endDate) {
		Date start = DateUtils.parse(startDate, "yyyyMMdd");
		Date end = DateUtils.addDay(DateUtils.parse(endDate, "yyyyMMdd"), 1);
		String hql = "select sum(r.acctsessiontime) from Radacct r where r.username = ? and r.acctstarttime > ? and r.acctstoptime < ?";
		Object[] params = new Object[]{target,start,end};
		return super.count(hql, params);
	}


}
