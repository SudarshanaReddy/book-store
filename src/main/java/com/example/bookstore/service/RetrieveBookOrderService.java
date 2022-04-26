package com.example.bookstore.service;

import com.example.bookstore.model.BookCatalogue;
import com.example.bookstore.model.OrdersResponse;
import com.example.bookstore.model.Users;

import java.util.List;

public interface RetrieveBookOrderService {
     List<BookCatalogue> getBookCatalogue();
     List<OrdersResponse> getAllOrders();
     List<OrdersResponse> getOrdersByKeyAndValue(final String key, final String userName);
     List<Users> getUsers();
}
