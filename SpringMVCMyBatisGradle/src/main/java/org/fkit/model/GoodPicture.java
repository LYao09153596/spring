package org.fkit.model;

import javax.persistence.Column;
import javax.persistence.Table;

@Table(name="good_picture")
public class GoodPicture {
	@Column(name="good_id")
	private int goodId;
	
	@Column(name="good_picture")
	private String goodPicture;
	
	public int getGoodId() {
		return goodId;
	}

	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}

	public String getGoodPicture() {
		return goodPicture;
	}

	public void setGoodPicture(String goodPicture) {
		this.goodPicture = goodPicture;
	}

	
}
