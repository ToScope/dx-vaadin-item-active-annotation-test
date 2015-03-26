package metamodel.deep

import metamodel.Deep
import metamodel.flat.Address

@MetaModelDeep
class Quote {
	String name
	double price
	@Deep
	Address address
}