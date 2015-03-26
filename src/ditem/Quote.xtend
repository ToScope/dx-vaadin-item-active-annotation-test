package ditem

import ditem.processor.DItem
import metamodel.Deep

@DItem
//@Accessors
class Quote {
	String name
	double price
	
	@Deep
	Person person
	
//	static val a = "ads"
	
}