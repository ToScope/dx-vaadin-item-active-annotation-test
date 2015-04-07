package ditem

import ditem.processor.DItem
import metamodel.Deep
import java.util.List

@DItem
class Quote {
	String name
	double price
	List<String> dealer 
	@Deep
	Person person
}