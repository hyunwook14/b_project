package com.java.web.vo;

public class GamelistrecordVO {
	
	private int record_no;
	private String record_assortment;
	private String record_nickname;
	private int record_twop;
	private int record_threep;
	private int record_onep;
	private int record_foul;
	private int record_assist;
	private int record_steal;
	private int record_block;
	private int record_turnover;
	private int record_totalp;
	private int record_quarter;
	private String record_date;
	
//	public GamelistrecordVO(String record_assortment, String record_nickname, int record_twop,
//			int record_threep, int record_onep, int record_foul, 
//			int record_assist, int record_steal, int record_block, int record_turnover
//			,int record_totalp) {
//		setRecord_assist(record_assist);
//		setRecord_assortment(record_assortment);
//		setRecord_block(record_block);
//		setRecord_foul(record_foul);
//		setRecord_nickname(record_nickname);
//		setRecord_onep(record_onep);
//		setRecord_steal(record_steal);
//		setRecord_threep(record_threep);
//		setRecord_turnover(record_turnover);
//		setRecord_twop(record_twop);
//		setRecord_totalp(record_totalp);
//	}
	
	public String getRecord_date() {
		return record_date;
	}
	public void setRecord_date(String record_date) {
		this.record_date = record_date;
	}
	public int getRecord_quarter() {
		return record_quarter;
	}
	public void setRecord_quarter(int record_quarter) {
		this.record_quarter = record_quarter;
	}
	public int getRecord_no() {
		return record_no;
	}
	public void setRecord_no(int record_no) {
		this.record_no = record_no;
	}
	public String getRecord_assortment() {
		return record_assortment;
	}
	public void setRecord_assortment(String record_assortment) {
		this.record_assortment = record_assortment;
	}
	public String getRecord_nickname() {
		return record_nickname;
	}
	public void setRecord_nickname(String record_nickname) {
		this.record_nickname = record_nickname;
	}
	public int getRecord_twop() {
		return record_twop;
	}
	public void setRecord_twop(int record_twop) {
		this.record_twop = record_twop;
	}
	public int getRecord_threep() {
		return record_threep;
	}
	public void setRecord_threep(int record_threep) {
		this.record_threep = record_threep;
	}
	public int getRecord_onep() {
		return record_onep;
	}
	public void setRecord_onep(int record_onep) {
		this.record_onep = record_onep;
	}
	public int getRecord_foul() {
		return record_foul;
	}
	public void setRecord_foul(int record_foul) {
		this.record_foul = record_foul;
	}
	public int getRecord_assist() {
		return record_assist;
	}
	public void setRecord_assist(int record_assist) {
		this.record_assist = record_assist;
	}
	public int getRecord_steal() {
		return record_steal;
	}
	public void setRecord_steal(int record_steal) {
		this.record_steal = record_steal;
	}
	public int getRecord_block() {
		return record_block;
	}
	public void setRecord_block(int record_block) {
		this.record_block = record_block;
	}
	public int getRecord_turnover() {
		return record_turnover;
	}
	public void setRecord_turnover(int record_turnover) {
		this.record_turnover = record_turnover;
	}
	public int getRecord_totalp() {
		return record_totalp;
	}
	public void setRecord_totalp(int record_totalp) {
		this.record_totalp = record_totalp;
	}
	@Override
	public String toString() {
		return "GamelistrecordVO [record_no=" + record_no + ", record_assortment=" + record_assortment
				+ ", record_nickname=" + record_nickname + ", record_twop=" + record_twop + ", record_threep="
				+ record_threep + ", record_onep=" + record_onep + ", record_foul=" + record_foul + ", record_assist="
				+ record_assist + ", record_steal=" + record_steal + ", record_block=" + record_block
				+ ", record_turnover=" + record_turnover + ", record_totalp=" + record_totalp + ", record_quarter="
				+ record_quarter + ", record_date=" + record_date + "]";
	}
	
	
	
	
	
	
	
}
