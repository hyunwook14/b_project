package com.java.web.vo;

public class UserCharacterVO {
	private int character_no;
	private String character_nickname;
	private int character_height;
	private int character_weight;
	
	public int getCharacter_no() {
		return character_no;
	}
	public void setCharacter_no(int character_no) {
		this.character_no = character_no;
	}
	public String getCharacter_nickname() {
		return character_nickname;
	}
	public void setCharacter_nickname(String character_nickname) {
		this.character_nickname = character_nickname;
	}
	public int getCharacter_height() {
		return character_height;
	}
	public void setCharacter_height(int character_height) {
		this.character_height = character_height;
	}
	public int getCharacter_weight() {
		return character_weight;
	}
	public void setCharacter_weight(int character_weight) {
		this.character_weight = character_weight;
	}
	public String getCharacter_position() {
		return character_position;
	}
	public void setCharacter_position(String character_position) {
		this.character_position = character_position;
	}
	public String getCharacter_explanation() {
		return character_explanation;
	}
	public void setCharacter_explanation(String character_explanation) {
		this.character_explanation = character_explanation;
	}
	private String character_position;
	private String character_explanation;

	@Override
	public String toString() {
		return "UserCharacterVO [character_no=" + character_no + ", character_nickname=" + character_nickname
				+ ", character_height=" + character_height + ", character_weight=" + character_weight
				+ ", character_position=" + character_position + ", character_explanation=" + character_explanation
				+ "]";
	}
	
	
}
