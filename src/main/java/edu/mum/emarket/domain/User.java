package edu.mum.emarket.domain;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "USER")
@PrimaryKeyJoinColumn(name = "ID")
public class User extends Person {

	private static final long serialVersionUID = 1L;

	@Column(name = "BLOCKED")
	private Boolean blocked = false;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user", targetEntity = Product.class)
	@JsonIgnoreProperties(value = { "user" })
	private Set<Product> products;

	@OneToMany(fetch = FetchType.LAZY, targetEntity = Product.class)
	@JsonIgnoreProperties(value = { "user" })
	private Set<Product> cartProducts;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user", targetEntity = Offer.class)
	@JsonIgnoreProperties(value = { "user" })
	private Set<Offer> offers;

//	 reports which he did it to other users
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "reporter", targetEntity = Report.class)
	@JsonIgnoreProperties(value = { "reporter", "reported" })
	private Set<Report> makeReports;

	// reports which other users did it to him
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "reported", targetEntity = Report.class)
	@JsonIgnoreProperties(value = { "reported", "reporter" })
	private Set<Report> hasReports;

	@OneToMany(fetch = FetchType.LAZY, targetEntity = Order.class)
	private Set<Order> orders;

	public User() {
	}

	public User(long id, String name, String email, String password, String phone, String address, Boolean blocked,
			PersonType role) {
		super(id, name, email, password, phone, address, role);
		this.blocked = blocked;

	}

	public Boolean getBlocked() {
		return blocked;
	}

	public void setBlocked(Boolean blocked) {
		this.blocked = blocked;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public Set<Offer> getOffers() {
		return offers;
	}

	public void setOffers(Set<Offer> offers) {
		this.offers = offers;
	}

	public Set<Report> getMakeReports() {
		return makeReports;
	}

	public void setMakeReports(Set<Report> makeReports) {
		this.makeReports = makeReports;
	}

	public Set<Report> getHasReports() {
		return hasReports;
	}

	public void setHasReports(Set<Report> hasReports) {
		this.hasReports = hasReports;
	}

	public Set<Product> getCartProducts() {
		return cartProducts;
	}

	public void setCartProducts(Set<Product> cartProducts) {
		this.cartProducts = cartProducts;
	}

	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

}
