package com.example.tacocloud.repository;

import com.example.tacocloud.model.Order;
import org.springframework.data.repository.CrudRepository;

import java.util.Date;
import java.util.List;

public interface OrderRepository extends CrudRepository<Order, Long> {
    List<Order> findByZip(String zip);

    List<Order> readOrderByZipAndPlacedAtBetween(String zip, Date startDate, Date endDate);

}
