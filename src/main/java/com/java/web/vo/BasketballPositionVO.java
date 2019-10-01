package com.java.web.vo;

public class BasketballPositionVO {
	private int position_no_pk;
	private String position_name;
	private String position_explanation;
	private String position_skill1;
	private String position_skill2;
	private String position_skill3;
	public int getPosition_no_pk() {
		return position_no_pk;
	}
	public void setPosition_no_pk(int position_no_pk) {
		this.position_no_pk = position_no_pk;
	}
	public String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	public String getPosition_explanation() {
		return position_explanation;
	}
	public void setPosition_explanation(String position_explanation) {
		this.position_explanation = position_explanation;
	}
	public String getPosition_skill1() {
		return position_skill1;
	}
	public void setPosition_skill1(String position_skill1) {
		this.position_skill1 = position_skill1;
	}
	public String getPosition_skill2() {
		return position_skill2;
	}
	public void setPosition_skill2(String position_skill2) {
		this.position_skill2 = position_skill2;
	}
	public String getPosition_skill3() {
		return position_skill3;
	}
	public void setPosition_skill3(String position_skill3) {
		this.position_skill3 = position_skill3;
	}
	@Override
	public String toString() {
		return "BasketballPositionVO [position_no_pk=" + position_no_pk + ", position_name=" + position_name
				+ ", position_explanantion=" + position_explanation + ", position_skill1=" + position_skill1
				+ ", position_skill2=" + position_skill2 + ", position_skill3=" + position_skill3 + "]";
	}
	
	
}
