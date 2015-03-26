package metamodel.classes

import org.eclipse.xtend.lib.annotations.Data
import metamodel.flat.MetaModel

@MetaModelClasses
class Address {
	String city
	int zip
	String Street
}