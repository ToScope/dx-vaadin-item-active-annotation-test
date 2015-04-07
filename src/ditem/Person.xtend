package ditem

import ditem.processor.DItem
import metamodel.Deep
import ditem.property.Derived
import java.util.List

@DItem
class Person {

	String lastName;
	String firstName;
	int year
//	List<String> items

	@Deep
	Address address
	
	//val static pack ="asd"
	
		
	@Derived(_lastName, _firstName)
	def String fullName() {
		return firstName + " " + lastName;
	}
	
}
