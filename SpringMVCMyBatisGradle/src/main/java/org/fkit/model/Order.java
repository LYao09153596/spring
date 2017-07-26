package org.fkit.model;

import java.util.Date;

import javax.persistence.*;

@Table(name = "tb_order")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @Column(name = "good_id")
    private Integer goodId;
    
    @Column(name = "order_id")
    private Integer orderId;

	@Column(name = "good_name")
    private String goodName;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "user_name")
    private String userName;
    
    @Column(name = "traffic")
    private String traffic;
    
    @Column(name = "buy_count")
    private Integer buyCount;

	@Column(name = "price")
    private Integer price;
    
    @Column(name = "time")
    private Date time;

    public Date getTime() {
		return time;
	}

	public void setTime(Date date) {
		this.time = date;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGoodId() {
		return goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTraffic() {
		return traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	
	public Integer getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(Integer buyCount) {
		this.buyCount = buyCount;
	}
}