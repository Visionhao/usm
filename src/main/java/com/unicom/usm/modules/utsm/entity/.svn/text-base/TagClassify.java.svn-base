package com.unicom.usm.modules.utsm.entity;

import java.util.Date;
import java.util.List;

import com.unicom.usm.common.persistence.TreeEntity;

/**
 * 标签分类实体
 * @author vision
 *
 */
public class TagClassify extends TreeEntity<TagClassify>{

	private static final long serialVersionUID = 1L;
	private String   category;   //分类名称        
	private String   comment;    //分类描述        
	private String type;
	private Date   createTime;  //创建时间
	private String code;
	private List<String> childClassifyList;//快速添加子部门
	
	public TagClassify() {
		super();
		this.type = "2";
	}
	public TagClassify(String id) {
		super(id);
	}
	public List<String> getChildClassifyList() {
		return childClassifyList;
	}
	public void setChildClassifyList(List<String> childClassifyList) {
		this.childClassifyList = childClassifyList;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public TagClassify getParent() {
		return parent;
	}

	public void setParent(TagClassify parent) {
		this.parent = parent;
	}
	
	@Override
	public String toString() {
		return name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
