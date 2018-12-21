package com.unicom.usm.modules.utsm.entity;

import java.util.Date;

import com.unicom.usm.common.persistence.DataEntity;

/**
 * 
 * @author vision
 * 标签同步管理
 *
 */
public class TagSynchroManage extends DataEntity<TagSynchroManage>{

	private static final long serialVersionUID = 1L;

	  
	private String   synchroMonth;  //同步月份  如 201612      
	private String   tagId;         //标签ID
	private String   tag;
	private Date     synchroStartTime;//同步开始时间  
	private Date     synchroEndTime;  //同步结束时间  
	private String   status;        //同步状态       02同步中  00成功  01失败
	private String   comment;       //同步信息记录
	private Date     createTiem;      //创建时间    
	
	public TagSynchroManage() {
		super();
	}
	public TagSynchroManage(String id) {
		super(id);
	}
	public String getSynchroMonth() {
		return synchroMonth;
	}
	public void setSynchroMonth(String synchroMonth) {
		this.synchroMonth = synchroMonth;
	}
	public String getTagId() {
		return tagId;
	}
	public void setTagId(String tagId) {
		this.tagId = tagId;
	}
	public Date getSynchroStartTime() {
		return synchroStartTime;
	}
	public void setSynchroStartTime(Date synchroStartTime) {
		this.synchroStartTime = synchroStartTime;
	}
	public Date getSynchroEndTime() {
		return synchroEndTime;
	}
	public void setSynchroEndTime(Date synchroEndTime) {
		this.synchroEndTime = synchroEndTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCreateTiem() {
		return createTiem;
	}
	public void setCreateTiem(Date createTiem) {
		this.createTiem = createTiem;
	}
	
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	@Override
	public String toString() {
		return "TagSynchroManage [synchroMonth=" + synchroMonth + ", tagId="
				+ tagId + ", synchroStartTime=" + synchroStartTime
				+ ", synchroEndTime=" + synchroEndTime + ", status=" + status
				+ ", comment=" + comment + ", createTiem=" + createTiem + "]";
	}
}
