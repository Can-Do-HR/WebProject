package com.project.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PaymentController {
	
	@GetMapping(value = "/ProductPayment", produces="text/plain; charset=utf-8")
	public int ProductPayment() {
		return 1;
	}
	
}
