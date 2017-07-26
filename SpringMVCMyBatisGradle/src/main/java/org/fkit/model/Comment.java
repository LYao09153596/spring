package org.fkit.model;

import javax.persistence.*;

@Table(name = "comment")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "good_id")
    private Integer goodId;

    @Column(name = "good_name")
    private String goodName;
    
    @Column(name = "comment")
    private String comment;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "user_name")
    private String userName;
    
    @Column(name = "picture")
    private Integer picture;
    
    @Column(name = "t_comment")
    private Integer tComment;
    
    public Integer getPicture() {
		return picture;
	}

	public void setPicture(Integer picture) {
		this.picture = picture;
	}

	public Integer gettComment() {
		return tComment;
	}

	public void settComment(Integer tComment) {
		this.tComment = tComment;
	}

	public Integer getqComment() {
		return qComment;
	}

	public void setqComment(Integer qComment) {
		this.qComment = qComment;
	}

	public Integer getsComment() {
		return sComment;
	}

	public void setsComment(Integer sComment) {
		this.sComment = sComment;
	}

	@Column(name = "q_comment")
    private Integer qComment;
    
    @Column(name = "s_comment")
    private Integer sComment;
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
     * @return comment
     */
    public String getComment() {
        return comment;
    }

    /**
     * @param comment
     */
    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    /**
     * @return user_id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * @param userId
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * @return user_name
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName
     */
    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }
}