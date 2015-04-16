package ditem.collection

import ditem.Quote
import ditem.QuoteItem
import org.junit.Before
import static ditem.DItemUnitTestAdFree.newQuoteMock
import ditem.Address
import ditem.AddressItem

import static extension de.tfr.xtend.testutil.AssertDoubleArrow.*
import org.junit.Test
import ditem.container.DItemContainer
import java.util.List

class PropertyItemContainerTest {
	
	var Quote quote
	var QuoteItem item

	@Before
	def void initMockQuote() {
		quote = newQuoteMock
		item = new QuoteItem(quote)
		
		address1 = new Address() => [
			city = "Karlsruhe"
			street = "Kaiserstr"
			zip = 76131
		]
		address2 = new Address() => [
			city = "Pforzheim"
			street = "Tunnelstraße"
			zip = 75172	
		]
		address3 = new Address() => [
			city = "Bretten"
			street = "Postweg"
			zip = 75015	
		]
	}
	Address address1
	Address address2
	Address address3

	
	@Test
	def void propertyItemContainer(){
		
		
		
		val addressesItems = #[address1,address2].map[new AddressItem(it)]
		
		val  container = new DItemContainer<Address, AddressItem>(AddressItem, addressesItems)
		container.getItem(0).cityProp => address1.city
		container.getIdByIndex(0) => 0
		container.getItem(0 as Integer).cityProp => address1.city
		
		container.addDItem(new AddressItem(address3))
		container.getItem(2 as Integer).cityProp => address3.city
		
	}
	
	@Test
	def void addressItemContainer(){
		
		val container = new AddressItemContainer(#[address1,address2])	
		container.getItem(0).cityProp => address1.city
	}
	
	static class AddressItemContainer extends DItemContainer<Address, AddressItem>{
		new(List<Address> addresses){
			super(AddressItem, addresses.map[new AddressItem(it)])
		}
	}
		
}