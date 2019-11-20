package edu.mum.emarket.service;


import edu.mum.emarket.domain.Order;

public interface OrderService {
	
	void processOrder(String productId, long quantity);
	
	Long saveOrder(Order order);
}
