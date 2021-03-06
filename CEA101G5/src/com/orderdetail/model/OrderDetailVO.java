package com.orderdetail.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import org.hibernate.annotations.CreationTimestamp;

import com.ordermaster.model.OrderMasterVO;

@Entity
@Table(name="ORDER_DETAIL")
public class OrderDetailVO implements Serializable {
	
	@Id
	@Column(name="ORDER_ID")
	private Integer orderId;
	
	@Id
	@Column(name="PRODUCT_ID")
	private String productId;
	
	@Column(name="PRODUCT_PRICE")
	private Integer productPrice;
	
	@Column(name="QUANTITY")
	private Integer quantity;
	
	@Column(name="PRODUCT_REVIEW")
	private String productReview;
	
	@Column(name="PRODUCT_REVIEW_PHOTO")
	private byte[] productReviewPhoto;
	
	@Column(name="PRODUCT_REVIEW_TS")
	private Date productReviewTS;
	
	@Column(name="PRODUCT_REVIEW_STATUS")
	private Integer productReviewStatus;
	
	@ManyToOne
	@JoinColumn(name="ORDER_ID")
	private OrderMasterVO orderMasterVO;
	
	public OrderDetailVO() {
		super();
	}
	
	public OrderDetailVO(Integer orderId, String productId) {
		this.orderId = orderId;
		this.productId = productId;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getProductReview() {
		return productReview;
	}

	public void setProductReview(String productReview) {
		this.productReview = productReview;
	}

	public byte[] getProductReviewPhoto() {
		return productReviewPhoto;
	}

	public void setProductReviewPhoto(byte[] productReviewPhoto) {
		this.productReviewPhoto = productReviewPhoto;
	}

	public Date getProductReviewTS() {
		return productReviewTS;
	}

	public void setProductReviewTS(Date productReviewTS) {
		this.productReviewTS = productReviewTS;
	}

	public Integer getProductReviewStatus() {
		return productReviewStatus;
	}

	public void setProductReviewStatus(Integer productReviewStatus) {
		this.productReviewStatus = productReviewStatus;
	}

	public void setOrderMasterVO(OrderMasterVO orderMasterVO) {
		this.orderMasterVO = orderMasterVO;
	}
	
	public OrderMasterVO getOrderMasterVO() {
		return orderMasterVO;
	}
	
}
