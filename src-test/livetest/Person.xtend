package livetest

import ditem.processor.DItem
import metamodel.Deep
import ditem.property.Derived

@DItem
class Person {
	String firstName
	String lastName
	int age
	
	@Deep
	Address address
	
//	@Derived(_person._firstName, _person._lastName)
	def String fullName(){
		return firstName + lastName
	}
	
}