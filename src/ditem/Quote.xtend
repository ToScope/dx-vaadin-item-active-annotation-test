package ditem

import ditem.processor.DItem
import metamodel.Deep

@DItem
class Quote {
	String name
	double price
	
	@Deep
	Person person
}