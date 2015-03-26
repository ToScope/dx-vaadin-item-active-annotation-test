package metamodel.flat

import metamodel.Deep
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@MetaModel
class Quote {
	String name
	double price
	@Deep
	Address address
	@Deep
	metamodel.flat.Address addresss

}
