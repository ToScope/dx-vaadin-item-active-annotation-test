package ditem

import ditem.processor.DItem
import metamodel.Deep
import metamodel.flat.MetaModel
import ditem.property.Derived
import metamodel.classes.MetaModelClasses
import metamodel.classes._8quote._8price
import ditem.property.DerivedString

//@Accessors
@DItem
//@MetaModelClasses
class Person {

	String lastName
	String firstName
	int year

	@Deep
	Address address
	
//	var name ="asd"
//	
//	val static pack ="asd"
	
		
//	@Derived( _8lastName)
	@DerivedString(#["asd"])
	def fullName() {
//		val c = _person._address
		firstName + " " + lastName
	}
}
