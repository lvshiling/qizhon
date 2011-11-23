/**
 * 
 */
package com.navigation.service;

import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.transaction.annotation.Transactional;

import weibo4j.http.AccessToken;

import com.mime.qweibo.OauthKey;
import com.navigation.exception.ServiceException;
import com.navigation.exception.SessionException;
import com.navigation.pojo.Room;
import com.navigation.pojo.User;
import com.navigation.pojo.UserAuth;
import com.navigation.pojo.UserCredit;
import com.navigation.pojo.UserInfo;
import com.navigation.pojo.UserLink;
import com.navigation.pojo.UserLogState;
import com.navigation.pojo.UserMail;
import com.navigation.pojo.UserNews;
import com.navigation.pojo.UserNotice;
import com.navigation.pojo.UserPicture;
import com.navigation.pojo.UserRecordVideo;

/**
 * @author WANGHUI Apr 8, 2011 11:25:36 AM
 */
public interface UserService {

	/**
	 * 根据ID 取得用户
	 * 
	 * @param id
	 * @return
	 */
	public User getUser(Integer id);

	/**
	 * 根据EMAIL 取得用户
	 * 
	 * @param email
	 * @return
	 */
	public User getUserByEmail(String email);

	/**
	 * 创建 新用户
	 * 
	 * @param user
	 * @return
	 */
	public User createNewUser(User user);

	@Transactional
	public User createNewUser(String emailOrPhone, String password, String userName, Integer areaId);

	/**
	 * 用户登录
	 * 
	 * @param user
	 */
	@Transactional
	public User login(User user);

	/**
	 * 贴子订阅
	 * 
	 * @param userId
	 * @param topicId
	 * @param title
	 */
	public void subTopic(Integer userId, Integer topicId, String title);

	/**
	 * 取得用户通知
	 * 
	 * @param userId
	 * @param pageSize
	 * @param p
	 * @return
	 */
	public List<UserNotice> getUserNotice(Integer userId, Integer noticeTpye, boolean isUnRead, Integer p, Integer pageSize);

	/**
	 * 取消订阅
	 * 
	 * @param userId
	 * @param targetId
	 */
	public void subTopicCancle(Integer userId, Integer targetId);

	/**
	 * 设置已读
	 * 
	 * @param userId
	 * @param noticeId
	 */
	public void noticeReaded(Integer userId, Integer noticeId);

	/**
	 * 修改密码
	 * 
	 * @param userId
	 * @param oldpassword
	 * @param newpassword
	 */
	public void changePassword(Integer userId, String oldpassword, String newpassword);

	/**
	 * 修改头像
	 * 
	 * @param userId
	 * @param userIcon
	 */
	public User changeUserIcon(Integer userId, String userIcon);

	/**
	 * 修改用户海报
	 * 
	 * @param userId
	 * @param poster
	 */
	public void changeUserPoster(Integer userId, String poster);

	/**
	 * 绑定微博帐户
	 * 
	 * @param userId
	 * @param accessToken
	 */
	public void bindSinaUser(Integer userId, AccessToken accessToken);

	/**
	 * 取得对应的新浪绑定用户
	 * 
	 * @param userId
	 * @return
	 */
	public UserLink getUserLink(Integer userId, Integer bindType);

	/**
	 * 绑定用户邮箱
	 * 
	 * @param userId
	 * @param account
	 * @param passWord
	 * @param hostAndPort
	 * @param protocol
	 * @return
	 * @throws MessagingException
	 */
	public UserLink bindUserMail(Integer userId, String account, String passWord, String hostAndPort, String protocol)
			throws MessagingException;

	/**
	 * 取得用户MAIL
	 * 
	 * @param userId
	 * @return
	 */
	public List<UserMail> checkUserMail(Integer userId);

	/**
	 * 取得用户邮件
	 * 
	 * @param userId
	 * @param link
	 * @return
	 */
	public List<UserMail> getUserMail(Integer userId, UserLink link);

	public List<UserMail> getUserMail(Integer userId, Integer p, Integer pageSize);

	public UserLink getUserLink(Integer targetId);

	/**
	 * 解绑
	 * 
	 * @param userId
	 * @param targetId
	 */
	public void unBindId(Integer userId, Integer targetId);

	/**
	 * 改名字
	 * 
	 * @param userId
	 * @param title
	 */
	public void changeUserName(Integer userId, String title);

	/**
	 * 新浪用户登录，有用户 则登录，没有用户则创建
	 * 
	 * @param accessToken
	 */
	public User sinaUserLogin(AccessToken accessToken);

	/**
	 * 域用户登录
	 * 
	 * @param user
	 * @return
	 */
	public User adLogin(User user);

	/**
	 * 更新用户在线状态
	 * 
	 * @param userId
	 */
	public void updateUserLogState(Integer userId);

	/**
	 * 取用户在线状态 HASHCODE
	 * 
	 * @param hashCode
	 * @return
	 */
	public UserLogState getUserLogStateByHashCode(String hashCode);

	/**
	 * 绑定腾讯微博
	 * 
	 * @param userId
	 * @param oauth
	 */
	public void bindTencentUser(Integer userId, OauthKey oauth);

	/**
	 * 搜索用户邮件
	 * 
	 * @param userId
	 * @param keyWord
	 * @param p
	 * @param pageSize
	 * @return
	 */
	public List<UserMail> searchUserMail(Integer userId, String keyWord, Integer p, Integer pageSize);

	/**
	 * 绑定网易微博
	 * 
	 * @param userId
	 * @param accessToken
	 */
	public void bind163User(Integer userId, t4j.http.AccessToken accessToken);

	/**
	 * 取得绑定帐户
	 * 
	 * @param userId
	 * @return
	 */
	public List<UserLink> getUserLinks(Integer userId, Integer[] types);

	/**
	 * 完善用户资料
	 * 
	 * @param userInfo
	 * @param id
	 */
	public void updateUserInfo(UserInfo userInfo, Integer id);

	/**
	 * 保存用户照片
	 * 
	 * @param userId
	 * @param fileName
	 */
	public void saveUserPicture(Integer userId, String fileName);

	/**
	 * 取用户照片
	 * 
	 * @param userId
	 * @param p
	 * @param pageSize
	 * @return
	 */
	public List<UserPicture> getUserPics(Integer userId, Integer p, Integer pageSize);

	/**
	 * 发消息
	 * 
	 * @param userId
	 * @param toUserId
	 * @param msg
	 */
	public void sendMsg(Integer userId, Integer toUserId, String msg);

	/**
	 * 取用户信息
	 * 
	 * @param userId
	 * @return
	 */
	public UserInfo getuserInfo(Integer userId);

	/**
	 * 只取UserInfo 不取User
	 * 
	 * @param userId
	 * @return
	 */
	public UserInfo findUserInfo(Integer userId);

	/**
	 * 保存用户上传视频
	 * 
	 * @param record
	 */
	public void saveUserRecordVideo(UserRecordVideo record);

	/**
	 * 获得明星排行榜
	 * 
	 * @param num
	 * @return
	 */
	public List<UserCredit> getUserSpendCreditList(int num);

	/**
	 * 获得富豪排行榜
	 * 
	 * @param num
	 * @return
	 */
	public List<UserCredit> getUserEarnCreditList(int num);

	/**
	 * 更新用户直播状态
	 * 
	 * @param userId
	 *            用户id
	 * @param state
	 *            直播状态（0:结束直播 1:正在直播）
	 */
	public void updateUserLiveState(Integer userId, Integer state, Integer camNum) throws SessionException;

	/**
	 * 获取正在直播的用户列表
	 * 
	 * @param num
	 *            获取人数
	 * @return
	 */
	public List<User> getLiveUserList(int num);

	/**
	 * 获取用户及用户账户信息
	 * 
	 * @param userId
	 * @return
	 */
	public User getUserWithCredit(Integer userId);

	/**
	 * 取出用户关联账户和状态信息
	 * 
	 * @param userId
	 * @return
	 */
	public User getUserWithCreditAndState(Integer userId);

	/**
	 * 增加一次uv
	 * 
	 * @param hostId
	 * @param guestId
	 * @param pageId
	 */
	public void addVisit(Integer ownerId, Integer pageId, Date date);

	/**
	 * 加关注
	 * 
	 * @param userId
	 * @param targetUser
	 * @throws ServiceException
	 */
	@Transactional
	public void addAttention(Integer userId, User targetUser) throws ServiceException;

	/**
	 * 获取人气排名列表
	 * 
	 * @param num
	 * @return
	 */
	public List<UserCredit> getPopUserCreditList(int num);

	/**
	 * 创建一个普通房间
	 * 
	 * @return
	 */
	public Room createRoom(Integer userId, String roomName);

	/**
	 * 根据房号取得房间对象
	 * 
	 * @param roomNo
	 * @return
	 */
	public Room getRoomByNo(Integer roomNo);

	/**
	 * 根据拥有者取得房间对象
	 * 
	 * @param userId
	 * @return
	 */
	public Room getRoomByOwner(Integer userId);

	public User getUserWithCreditAndRoom(Integer userId);

	public User getUserAllInfo(Integer userId);

	public UserNews addUserNews(UserNews userNews);

	/**
	 * 用户上传图片动态
	 * 
	 * @param userId
	 * @param imgSrc
	 * @param imgNum
	 */
	public UserNews uploadImgUserNews(Integer userId, String imgSrc, int imgNum);

	public UserNews msgUserNews(Integer userId, String content);

	public UserNews refUserNews(Integer userId, String content, Integer refId);

	public UserNews commentImgUserNews(Integer userId, String comment, String refImg, Integer refUid);

	public List<UserAuth> getAwaitAuthList(Integer p, Integer pageSize);

	public void submitAuth(Integer userId, String photoNames);

	public boolean neededAuth(Integer userId);

	public List<User> getUserScoreList(int num);

	public void updateUser(User user);

	public User changeUserPic(Integer userId, String pic, boolean override);

	public List<User> randUsersWithPic(Integer userId, int num);

	public Double giveScore(Integer userId, Integer scorer, Double score);
}
