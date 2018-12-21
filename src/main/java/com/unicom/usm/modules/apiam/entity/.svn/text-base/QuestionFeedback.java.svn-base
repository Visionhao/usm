package com.unicom.usm.modules.apiam.entity;

import java.util.Date;

import com.unicom.usm.common.persistence.DataEntity;
import com.unicom.usm.modules.sys.entity.User;

/**
 * 
*
* 项目名称：usm
* 类名称：QuestionFeedback
* 类描述：问题反馈实体类
* 创建人：vision
* 创建时间：2017年1月6日 下午1:58:19
* 修改备注：
* @version
*
 */
public class QuestionFeedback extends DataEntity<QuestionFeedback>{

	private static final long serialVersionUID = 3758759674032307212L;
	
	private String content;//提出问题
	private String name;
	private String email;
	private String phone;//电话
	private String workunit;//单位
	private String ip;
	private Date createDate;//创建时间
	private User reUser; 		// 回复人
	//private String reUserId;//回复人
	private Date reDate;//回复时间
	private String reContent;//回复内容
	
	public QuestionFeedback() {
		super();
	}
	public QuestionFeedback(String id) {
		super(id);
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getWorkunit() {
		return workunit;
	}
	public void setWorkunit(String workunit) {
		this.workunit = workunit;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public User getReUser() {
		return reUser;
	}
	public void setReUser(User reUser) {
		this.reUser = reUser;
	}
	public Date getReDate() {
		return reDate;
	}
	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	
}
