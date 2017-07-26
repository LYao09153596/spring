package org.fkit.model;

import javax.persistence.*;

@Table(name = "good_color")
public class GoodColor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "good_id")
    private Integer goodId;

    @Column(name = "good_name")
    private String goodName;

    @Column(name = "color_name")
    private String colorName;

    @Column(name = "color_id")
    private Integer colorId;

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
     * @return good_id
     */
    public Integer getGoodId() {
        return goodId;
    }

    /**
     * @param goodId
     */
    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
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
     * @return color_name
     */
    public String getColorName() {
        return colorName;
    }

    /**
     * @param colorName
     */
    public void setColorName(String colorName) {
        this.colorName = colorName == null ? null : colorName.trim();
    }

    /**
     * @return color_id
     */
    public Integer getColorId() {
        return colorId;
    }

    /**
     * @param colorId
     */
    public void setColorId(Integer colorId) {
        this.colorId = colorId;
    }
}