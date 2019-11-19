package edu.mum.emarket.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "OFFER")
public class Offer{

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	@Column(name = "PRICE")
	private Double price;

	@ManyToOne
	@JoinColumn(name = "POST_ID")
	@JsonIgnoreProperties(value = { "offers" })
	private Product product;

	@ManyToOne
	@JoinColumn(name = "USER_ID")
	@JsonIgnoreProperties(value = { "offers","products", "makeReports","hasReports" })
	private User user;

	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}


	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
