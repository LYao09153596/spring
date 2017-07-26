package org.fkit.model;

import javax.persistence.*;

@Table(name = "collect")
public class Collect {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "good_id")
    private Integer goodId;

    @Column(name = "good_name")
    private String goodName;

    @Column(name = "good_product")
    private String goodProduct;

    @Column(name = "good_picture")
    private String goodPicture;

    @Column(name = "good_price")
    private Integer goodPrice;
    
    @Column(name="user_id")
    private Integer userId;

    public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getGoodPrice() {
		return goodPrice;
	}

	public void setGoodPrice(Integer goodPrice) {
		this.goodPrice = goodPrice;
	}

	/**
     * @return id
     */
    
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return good_name
     */
    public String getGoodName() {
        return goodName;
    }

    /**
     * @param goodName
     */
    public void setGoodName(String goodName) {
        this.goodName = goodName == null ? null : goodName.trim();
    }

    /**
     * @return good_price
     */

    /**
     * @return good_product
     */
    public String getGoodProduct() {
        return goodProduct;
    }

    /**
     * @param goodProduct
     */
    public void setGoodProduct(String goodProduct) {
        this.goodProduct = goodProduct == null ? null : goodProduct.trim();
    }

    /**
     * @return good_picture
     */
    public String getGoodPicture() {
        return goodPicture;
    }

    /**
     * @param goodPicture
     */
    public void setGoodPicture(String goodPicture) {
        this.goodPicture = goodPicture == null ? null : goodPicture.trim();
    }

    /**
     * @return good_id
     */
    public Integer getGoodId() {
        return goodId;
    }

}
   