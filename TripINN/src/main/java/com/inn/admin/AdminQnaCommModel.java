package com.inn.admin;

import java.util.Date;

public class AdminQnaCommModel {
	private int content_num;//�����ȣ????????
	private int comment_num; //�ڸ�Ʈ ��ȣ
	private String commenter; //�ڸ�Ʈ �ۼ���
	private String commentt; //�ڸ�Ʈ...t?
	private Date reg_date;   //�ۼ�����
	private int comment_count;//��۰���?
	

	public int getContent_num() {
		return content_num;
	}
	public void setContent_num(int content_num) {
		this.content_num = content_num;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getCommenter() {
		return commenter;
	}
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	public String getCommentt() {
		return commentt;
	}
	public void setCommentt(String commentt) {
		this.commentt = commentt;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	

}
