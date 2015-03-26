package metamodel.classes

import metamodel.Deep
import org.eclipse.xtend.lib.annotations.Accessors

@MetaModelClasses
class Quote {
	String name
	double price
	@Deep
	Address addresss
}
