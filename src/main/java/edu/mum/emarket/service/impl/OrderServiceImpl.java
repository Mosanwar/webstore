package edu.mum.emarket.service.impl;

import edu.mum.emarket.domain.Customer;
import edu.mum.emarket.domain.Order;
import edu.mum.emarket.domain.Product;
import edu.mum.emarket.domain.User;
import edu.mum.emarket.repository.*;
import edu.mum.emarket.service.CartService;
import edu.mum.emarket.service.OrderService;
import edu.mum.emarket.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private ProductRepository productRepository;


	@Autowired
	private UserService userService;


	@Autowired
	private UserRepository userRepository;

	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private CartService cartService;

	@Autowired
	private ShippingRepository shippingRepository;

	
	public void processOrder(String productId, long quantity) {
		Product productById = productRepository.getProductByProductId(productId);
		
		if(productById.getUnitsInStock() < quantity){
			throw new IllegalArgumentException("Out of Stock. Available Units in stock"+ productById.getUnitsInStock());
		}
		
		productById.setUnitsInStock(productById.getUnitsInStock() - quantity);
	}
	
	public Long saveOrder(Order  order) {

		User customer = userRepository.findByEmail(userService.getLoggedInPerson().getEmail());
		order.setCustomer(customer);
		order.setShippingDetail(shippingRepository.save(order.getShippingDetail()));
		Order orderId = orderRepository.save(order);
		return orderId.getId();
	}

}
