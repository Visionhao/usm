package com.unicom.usm.modules.utsm.entity;

import java.util.Date;

import com.unicom.usm.common.persistence.DataEntity;

/**
 * 标签管理实体
 * @author vision
 *
 */
public class TagManage extends DataEntity<TagManage>{

	private static final long serialVersionUID = 1L;
	//private Integer  id;                   
	private String   tag;                  //标签名称
	private String   comment;              //标签描述
	private String   categoryId;          //标签分类ID
	private String   verifyStatus;        //02未审核  03审核中  00审核通过  01审核不通过
	private String   tagStatus;           //00启用  01暂停
	private String   synchroTestResult;  //00成功  01失败
	private String   searchTestResult;   //00成功  01失败
	private String   connectType;         //FTP
	private String   connectIp;           //接口机IP
	private String   connectPort;         //接口机端口
	private String   connectUser;         //FTP连接账户
	private String   connectPassword;     //FTP连接密码
	private String   connectFilePath;    //FTP文件目录
	private String   dayTagNameRule;    //日标签文件命名规范
	private String   monthTagNameRule;  //月标签文件命名规范
	private String   synchroFrequency;    //标签同步频率   月/日
	private String   synchroDate;         //标签同步日期
	private String   updateType;          //标签数据更新方式   00全量覆盖  01按日期覆盖  02增量更新
	private String   odsTableName;       //ODS新增表名
	private String   tagShowName;        //标签显示中文名
	private String   tagColumnName;      //标签字段名
	private String   tagColumnDatatype;  //标签字段取值类型   00Varchar  01Number
	private Integer  tagColumnLength;    //标签字段长度
	private String   synchroType;         //同步类型 00定时同步  01手工同步
	private Date     createTime;          //创建时间
	private TagClassify tagClassify; //标签分类
	
	
	public TagManage() {
		super();
	}
	public TagManage(String id) {
		super(id);
	}
	
	/*public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}*/
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getVerifyStatus() {
		return verifyStatus;
	}
	public void setVerifyStatus(String verifyStatus) {
		this.verifyStatus = verifyStatus;
	}
	public String getTagStatus() {
		return tagStatus;
	}
	public void setTagStatus(String tagStatus) {
		this.tagStatus = tagStatus;
	}
	public String getSynchroTestResult() {
		return synchroTestResult;
	}
	public void setSynchroTestResult(String synchroTestResult) {
		this.synchroTestResult = synchroTestResult;
	}
	public String getSearchTestResult() {
		return searchTestResult;
	}
	public void setSearchTestResult(String searchTestResult) {
		this.searchTestResult = searchTestResult;
	}
	public String getConnectType() {
		return connectType;
	}
	public void setConnectType(String connectType) {
		this.connectType = connectType;
	}
	public String getConnectIp() {
		return connectIp;
	}
	public void setConnectIp(String connectIp) {
		this.connectIp = connectIp;
	}
	public String getConnectPort() {
		return connectPort;
	}
	public void setConnectPort(String connectPort) {
		this.connectPort = connectPort;
	}
	public String getConnectUser() {
		return connectUser;
	}
	public void setConnectUser(String connectUser) {
		this.connectUser = connectUser;
	}
	public String getConnectPassword() {
		return connectPassword;
	}
	public void setConnectPassword(String connectPassword) {
		this.connectPassword = connectPassword;
	}
	public String getConnectFilePath() {
		return connectFilePath;
	}
	public void setConnectFilePath(String connectFilePath) {
		this.connectFilePath = connectFilePath;
	}
	public String getDayTagNameRule() {
		return dayTagNameRule;
	}
	public void setDayTagNameRule(String dayTagNameRule) {
		this.dayTagNameRule = dayTagNameRule;
	}
	public String getMonthTagNameRule() {
		return monthTagNameRule;
	}
	public void setMonthTagNameRule(String monthTagNameRule) {
		this.monthTagNameRule = monthTagNameRule;
	}
	public String getSynchroFrequency() {
		return synchroFrequency;
	}
	public void setSynchroFrequency(String synchroFrequency) {
		this.synchroFrequency = synchroFrequency;
	}
	public String getSynchroDate() {
		return synchroDate;
	}
	public void setSynchroDate(String synchroDate) {
		this.synchroDate = synchroDate;
	}
	public String getUpdateType() {
		return updateType;
	}
	public void setUpdateType(String updateType) {
		this.updateType = updateType;
	}
	public String getOdsTableName() {
		return odsTableName;
	}
	public void setOdsTableName(String odsTableName) {
		this.odsTableName = odsTableName;
	}
	public String getTagShowName() {
		return tagShowName;
	}
	public void setTagShowName(String tagShowName) {
		this.tagShowName = tagShowName;
	}
	public String getTagColumnName() {
		return tagColumnName;
	}
	public void setTagColumnName(String tagColumnName) {
		this.tagColumnName = tagColumnName;
	}
	public String getTagColumnDatatype() {
		return tagColumnDatatype;
	}
	public void setTagColumnDatatype(String tagColumnDatatype) {
		this.tagColumnDatatype = tagColumnDatatype;
	}
	public Integer getTagColumnLength() {
		return tagColumnLength;
	}
	public void setTagColumnLength(Integer tagColumnLength) {
		this.tagColumnLength = tagColumnLength;
	}
	public String getSynchroType() {
		return synchroType;
	}
	public void setSynchroType(String synchroType) {
		this.synchroType = synchroType;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public TagClassify getTagClassify() {
		return tagClassify;
	}
	public void setTagClassify(TagClassify tagClassify) {
		this.tagClassify = tagClassify;
	}
	@Override
	public String toString() {
		return "TagManage [tag=" + tag + ", comment=" + comment
				+ ", categoryId=" + categoryId + ", verifyStatus="
				+ verifyStatus + ", tagStatus=" + tagStatus
				+ ", synchroTestResult=" + synchroTestResult
				+ ", searchTestResult=" + searchTestResult + ", connectType="
				+ connectType + ", connectIp=" + connectIp + ", connectPort="
				+ connectPort + ", connectUser=" + connectUser
				+ ", connectPassword=" + connectPassword + ", connectFilePath="
				+ connectFilePath + ", dayTagNameRule=" + dayTagNameRule
				+ ", monthTagNameRule=" + monthTagNameRule
				+ ", synchroFrequency=" + synchroFrequency + ", synchroDate="
				+ synchroDate + ", updateType=" + updateType
				+ ", odsTableName=" + odsTableName + ", tagShowName="
				+ tagShowName + ", tagColumnName=" + tagColumnName
				+ ", tagColumnDatatype=" + tagColumnDatatype
				+ ", tagColumnLength=" + tagColumnLength + ", synchroType="
				+ synchroType + ", createTime=" + createTime + ", tagClassify="
				+ tagClassify + "]";
	}
}
