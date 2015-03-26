package ditem

import ditem.property.IdentableValueProperty

//@JUnit
class DItemScriptingPlayground {
	
	
	new() {
		val quote = newQuoteMock
		val item = new QuoteItem(quote)
		println(item.personProp)
		println(item.personProp.addressProp.streetProp)
		println(item.personProp.firstNameProp)

		println(item.personProp.itemPropertyIds)

		println(item.personProp.getItemProperty("lastName"))

		item.personProp.addressProp.zipProp.addValueChangeListener[println("changed: " + it.property)]
		val zip = item.personProp.addressProp.zipProp
		println("model zip: " + item.personProp.addressProp.bean.zip)
		zip.value = 42
		println("model zip: " + item.personProp.addressProp.bean.zip)
		println(item.personProp.addressProp.typeName)
		println(item.personProp.addressProp.zipProp.type)
		println(item.personProp.addressProp.zipProp.ID)


		//Add Property Test
		println(item.itemPropertyIds)		
		println(item)		
		item.addItemProperty(new IdentableValueProperty("Test","test"));
		println(item)		
		println(item.itemPropertyIds)		

//		item.personProp.addPropertySetChangeListener[println("setChangeEent: " + it.item)]
//		item.personProp.addItemProperty(new IdentableValueProperty("Test", "test"))
//		println(item.personProp)

	}

	def newQuoteMock() {
		val quote = new Quote() => [
			name = "Bestellung"
			price = 42
		]

		val person = new Person() => [
			year = 1988
			firstName = "Max"
			lastName = "Mustermann"
		]
		val address = new Address() => [
			city = "Karlsruhe"
			street = "Kaiserstr"
			zip = 1234
		]
		quote.person = person
		quote.person.address = address

		return quote
	}

	def static void main(String[] args) {
		new DItemScriptingPlayground
	}

}
