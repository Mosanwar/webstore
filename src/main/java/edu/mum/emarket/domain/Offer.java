package edu.mum.emarket.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "OFFER")
public class Offer {

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@NotNull(message= "{NotEmpty}")
	@Column(name = "PRICE")
	private Double price;
	
	@NotEmpty
	@Column(name = "DESCRIPTION")
	private String description;

	@NotNull(message = "NotNull")
	@ManyToOne
	@JoinColumn(name = "PRODUCT_ID")
	@JsonIgnoreProperties(value = { "offers" })
	private Product product;

	@ManyToOne
	@JoinColumn(name = "USER_ID")
	@JsonIgnoreProperties(value = { "offers", "products", "makeReports", "hasReports" })
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
