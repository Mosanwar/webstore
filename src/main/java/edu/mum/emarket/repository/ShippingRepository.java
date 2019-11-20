package edu.mum.emarket.repository;

import edu.mum.emarket.domain.ShippingDetail;
import org.springframework.data.repository.CrudRepository;

public interface ShippingRepository extends CrudRepository<ShippingDetail,Long> {
}
