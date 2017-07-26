package org.fkit.model;

import javax.persistence.*;

@Table(name = "good")
public class Good {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "good_name")
    private String goodName;

    @Column(name = "good_price")
    private Integer goodPrice;

	@Column(name = "good_product")
    private String goodProduct;

    @Column(name = "good_picture")
    private String goodPicture;

    @Column(name = "good_rating")
    private String goodRating;

    @Column(name = "good_count")
    private String goodCount;

    @Column(name = "good_saled")
    private String goodSaled;
    
    @Column(name = "good_relation")
    private String goodRelation;
    /**
     * @return id
     */
    public void setGoodPrice(Integer goodPrice) {
		this.goodPrice = goodPrice;
	}
    
    public void setGoodRelation(String goodRelation){
    	this.goodRelation= goodRelation;
    }
    
    public String getGoodRelation(){
    	return goodRelation;
    }
    
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
    public Integer getGoodPrice() {
        return goodPrice;
    }

    /**
     * @param goodPrice
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
     * @return good_rating
     */
    public String getGoodRating() {
        return goodRating;
    }

    /**
     * @param goodRating
     */
    public void setGoodRating(String goodRating) {
        this.goodRating = goodRating == null ? null : goodRating.trim();
    }

    /**
     * @return good_count
     */
    public String getGoodCount() {
        return goodCount;
    }

    /**
     * @param goodCount
     */
    public void setGoodCount(String goodCount) {
        this.goodCount = goodCount == null ? null : goodCount.trim();
    }

    /**
     * @return good_saled
     */
    public String getGoodSaled() {
        return goodSaled;
    }

    /**
     * @param goodSaled
     */
    public void setGoodSaled(String goodSaled) {
        this.goodSaled = goodSaled == null ? null : goodSaled.trim();
    }
}