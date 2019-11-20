package edu.mum.emarket.domain;

import javax.persistence.Transient;
import java.time.LocalDate;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "PRODUCT")
public class Product {

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@Column(name = "TITLE")
	private String title;
	@Column(name = "DESCRIPTION")
	private String description;
	@Column(name = "PRICE")
	private Double price;
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Column(name = "CITY")
	private String city;
	@Column(name = "COUNTRY")
	private String country;

	@ManyToOne
	@JoinColumn(name = "CATEGORY_ID")
	private Category category;

	@ManyToOne
	@JoinColumn(name = "USER_ID")
	@JsonIgnoreProperties(value = { "offers", "products", "makeReports", "hasReports" })
	private User user;

	@OneToMany(fetch = FetchType.EAGER, targetEntity = Offer.class, mappedBy = "product")
	@JsonIgnoreProperties(value = { "product" })
	private Set<Offer> offers;

	@OneToMany(fetch = FetchType.EAGER, targetEntity = Photo.class, mappedBy = "product", cascade = CascadeType.ALL)
	@JsonIgnoreProperties(value = { "product" })
	private Set<Photo> photos;

	@Transient
	private MultipartFile productImage;
	
	

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public Product() {
	}

	public Product(long id, String title, String description, LocalDate expirDate, Double price, String city,
			String country) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.price = price;
		this.city = city;
		this.country = country;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<Offer> getOffers() {
		return offers;
	}

	public void setOffers(Set<Offer> offers) {
		this.offers = offers;
	}

	public Set<Photo> getPhotos() {
		return photos;
	}

	public void setPhotos(Set<Photo> photos) {
		this.photos = photos;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public MultipartFile getProductImage() {
		// TODO Auto-generated method stub
		return productImage;
	}

}
