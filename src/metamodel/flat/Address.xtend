package metamodel.flat

import org.eclipse.xtend.lib.annotations.Data
import metamodel.flat.MetaModel

@MetaModel
class Address {
	String city
	int zip
	String Street
	java.util.ArrayList arrayList =  new  java.util.ArrayList();
}