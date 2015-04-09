package ditem

import ditem.processor.DItem
import ditem.property.Derived
import java.util.List
import metamodel.Deep

@DItem
class Person {

	String lastName
	String firstName
	
	int year

	@Deep
	Address address
	
	List<Address> addresses
	
	//val static pack ="asd"
	
		
	@Derived(_lastName, _firstName)
	def String fullName() {
		return firstName + " " + lastName;
	}
	
}
