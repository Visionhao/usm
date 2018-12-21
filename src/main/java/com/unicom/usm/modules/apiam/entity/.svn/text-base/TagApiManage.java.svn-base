package com.unicom.usm.modules.apiam.entity;

import java.util.Date;

import com.unicom.usm.common.persistence.DataEntity;

/**
 * 
 * @author vision
 * 接口定义
 */

public class TagApiManage extends DataEntity<TagApiManage>{

	private static final long serialVersionUID = 1L;
	
	private String  apiName;          //接口名称
	private String  joinIp;           //接入机器IP   
	private String  comment;          //接口描述   
	private String  userName;         //账户名   
	private String  userPassword;     //密码  
	private String  apiStatus;        //接口  00启用/01暂停
	private Date  createTime;       //创建时间
	 
	public TagApiManage() {
		super();
	}
	public TagApiManage(String id) {
		super(id);
	}
	public String getApiName() {
		return apiName;
	}
	public void setApiName(String apiName) {
		this.apiName = apiName;
	}
	public String getJoinIp() {
		return joinIp;
	}
	public void setJoinIp(String joinIp) {
		this.joinIp = joinIp;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getApiStatus() {
		return apiStatus;
	}
	public void setApiStatus(String apiStatus) {
		this.apiStatus = apiStatus;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "TagApiManage [apiName=" + apiName + ", joinIp=" + joinIp
				+ ", comment=" + comment + ", userName=" + userName
				+ ", userPassword=" + userPassword + ", apiStatus=" + apiStatus
				+ ", createTime=" + createTime + "]";
	}
	
}
