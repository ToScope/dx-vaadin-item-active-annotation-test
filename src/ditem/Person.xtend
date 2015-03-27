package ditem

import ditem.processor.DItem
import metamodel.Deep
import ditem.property.Derived
import ditem._person._lastName
import ditem._person._firstName

@DItem
class Person {

	String lastName
	String firstName
	int year

	@Deep
	Address address
	
	//val static pack ="asd"
	
		
	@Derived(_lastName, _firstName)
	def String fullName() {
		firstName + " " + lastName
	}
	
}
