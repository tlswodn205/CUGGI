package com.tencoding.CUGGI.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.repository.interfaces.PersonRepository;
import com.tencoding.CUGGI.repository.model.Person;

@Service
public class PersonService {

	@Autowired
	PersonRepository personRepository;

	public Person findByuserId(int userId) {
		Person person = personRepository.findByUserId(userId);
//		int j = 0;
//		while(true) {
//
//			j++;
//			if(j*16>=person.getAddress().length()) {
//				break;
//			}
//
//			String newProductName = ""; 
//			newProductName = person.getAddress().substring(0, j*16) + "<br>" + 
//					person.getAddress().substring(j*16, person.getAddress().length());
//			person.setAddress(newProductName);
//			
//		}
		return person;
	}
}
