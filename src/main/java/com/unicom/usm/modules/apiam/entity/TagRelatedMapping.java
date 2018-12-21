package com.unicom.usm.modules.apiam.entity;

import java.util.Date;

import com.unicom.usm.common.persistence.DataEntity;
import com.unicom.usm.modules.utsm.entity.TagClassify;
import com.unicom.usm.modules.utsm.entity.TagManage;

/**
 * 
*
* 项目名称：usm
* 类名称：TagRelatedMapping
* 类描述：标签相关词映射
* 创建人：vision
* 创建时间：2016年12月27日 上午9:51:47
* @version
*
 */
public class TagRelatedMapping extends DataEntity<TagRelatedMapping>{

	private static final long serialVersionUID = 3836825902921366205L;
	
	private String  tagId;              //标签ID 
	private String  tagName;            //标签名 
	private String  keyword;            //关键词  
	private String  relatedWord;        //关键词的相关词
	private String  relatedType;        //相关词类型
	private Date  createTime;           //创建时间
	private TagManage tagManage;
	private TagClassify tagClassify;
	
	public TagRelatedMapping() {
		super();
	}
	public TagRelatedMapping(String id) {
		super(id);
	}
	public String getTagId() {
		return tagId;
	}
	public void setTagId(String tagId) {
		this.tagId = tagId;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getRelatedWord() {
		return relatedWord;
	}
	public void setRelatedWord(String relatedWord) {
		this.relatedWord = relatedWord;
	}
	public String getRelatedType() {
		return relatedType;
	}
	public void setRelatedType(String relatedType) {
		this.relatedType = relatedType;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public TagManage getTagManage() {
		return tagManage;
	}
	public void setTagManage(TagManage tagManage) {
		this.tagManage = tagManage;
	}
	
	public TagClassify getTagClassify() {
		return tagClassify;
	}
	public void setTagClassify(TagClassify tagClassify) {
		this.tagClassify = tagClassify;
	}
	@Override
	public String toString() {
		return "TagRelatedMapping [tagId=" + tagId + ", tagName=" + tagName
				+ ", keyword=" + keyword + ", relatedWord=" + relatedWord
				+ ", relatedType=" + relatedType + ", createTime=" + createTime
				+ "]";
	}
	
}	
