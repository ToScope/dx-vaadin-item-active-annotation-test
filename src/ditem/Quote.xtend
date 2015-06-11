package ditem

import ditem.processor.DItem
import metamodel.Deep
import java.util.List
import metamodel.SkipInToString

@DItem
class Quote {
	String name
	double price
	@SkipInToString
	List<String> dealer 
	@Deep
	@SkipInToString
	Person person
}