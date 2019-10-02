package com.java.web.vo;

public class KblPlayerVO {
	private int player_no_pk;
	private String player_name;
	private String player_height;
	private int player_teamnumber;
	private String player_team;
	private String player_position;
	private String player_img;
	
	public KblPlayerVO(String player_name, String player_height, int player_teamnumber,
			String player_team, String player_position,String  player_img) {
		setPlayer_name(player_name);
		setPlayer_height(player_height);
		setPlayer_teamnumber(player_teamnumber);
		setPlayer_team(player_team);
		setPlayer_position(player_position);
		setPlayer_img(player_img);
	}
	
	public int getPlayer_no_pk() {
		return player_no_pk;
	}
	public void setPlayer_no_pk(int player_no_pk) {
		this.player_no_pk = player_no_pk;
	}
	public String getPlayer_name() {
		return player_name;
	}
	public void setPlayer_name(String player_name) {
		this.player_name = player_name;
	}
	public String getPlayer_height() {
		return player_height;
	}
	public void setPlayer_height(String player_height) {
		this.player_height = player_height;
	}
	public int getPlayer_teamnumber() {
		return player_teamnumber;
	}
	public void setPlayer_teamnumber(int player_teamnumber) {
		this.player_teamnumber = player_teamnumber;
	}
	public String getPlayer_team() {
		return player_team;
	}
	public void setPlayer_team(String player_team) {
		this.player_team = player_team;
	}
	public String getPlayer_position() {
		return player_position;
	}
	public void setPlayer_position(String player_position) {
		this.player_position = player_position;
	}
	public String getPlayer_img() {
		return player_img;
	}
	public void setPlayer_img(String player_img) {
		this.player_img = player_img;
	}
	@Override
	public String toString() {
		return "KblPlayer [player_no_pk=" + player_no_pk + ", player_name=" + player_name + ", player_height="
				+ player_height + ", player_teamnumber=" + player_teamnumber + ", player_team=" + player_team
				+ ", player_position=" + player_position + ", player_img=" + player_img + "]";
	}
	
	
}
