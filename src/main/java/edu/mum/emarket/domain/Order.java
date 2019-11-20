package edu.mum.emarket.domain;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Set;

import javax.persistence.*;


@Entity(name = "ORDERK")
public class Order implements Serializable{

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private Long orderId;

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	@OneToOne
	private ShippingDetail shippingDetail;


	public ShippingDetail getShippingDetail() {
		return shippingDetail;
	}

	public void setShippingDetail(ShippingDetail shippingDetail) {
		this.shippingDetail = shippingDetail;
	}


	@OneToOne
	private Cart cart;

	public Order() {
		this.customer = new User();
		this.shippingDetail = new ShippingDetail();
	}

	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	private User customer;

	public User getCustomer() {
		return customer;
	}

	public void setCustomer(User customer) {
		this.customer = customer;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	private String address;
	
	private LocalDate createdDate;
	
	private Long cardNumber;
	
	@OneToMany(fetch = FetchType.LAZY, targetEntity = Product.class)
	private Set<Product> cartProducts;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public LocalDate getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDate createdDate) {
		this.createdDate = createdDate;
	}

	public Long getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(Long cardNumber) {
		this.cardNumber = cardNumber;
	}
	

}
