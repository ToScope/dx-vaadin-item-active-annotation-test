package ditem

import com.vaadin.data.Item.PropertySetChangeListener
import com.vaadin.data.Property.ValueChangeListener
import ditem.item.ItemPropertySetChangeEvent
import ditem.property.IdentableValueProperty
import ditem.property.ValueProperty
import ditem.testutil.EmptyBean
import ditem.testutil.EmptyBeanItem
import org.junit.Before
import org.junit.Test

import static org.mockito.Matchers.*
import static org.hamcrest.CoreMatchers.*

import static extension de.tfr.xtend.testutil.AssertDoubleArrow.*
import static extension org.mockito.Mockito.*

/***
 * DItem Unit tests
 */
class DItemUnitTestAdFree {

	var Quote quote
	var QuoteItem item

	@Before
	def void initMockQuote() {
		quote = newQuoteMock
		item = new QuoteItem(quote)
	}

	@Test
	def beanType() {
		item.typeName => "ditem.Quote"
	}

	@Test
	def propertyID() {
		item.nameProp.ID => "name"
	}

	@Test
	def propertyType() {
		item.nameProp.type => String
	}

	@Test
	def accesProperties() {
		item.nameProp => "Quote Hard Drive"
		item.priceProp => "42.0"
	}

	@Test
	def accesBean() {
		item.bean.name => "Quote Hard Drive"
		item.bean.price => "42.0"
	}

	@Test
	def accesNestedProperties() {
		item.personProp.firstNameProp => "Max"
		item.personProp.addressProp.streetProp => "Kaiserstr"
	}

	@Test
	def accesNestedBean() {
		item.personProp.bean.firstName => "Max"
		item.personProp.addressProp.bean.street => "Kaiserstr"
	}

	@Test
	def changeProperties() {
		item.nameProp.value = "Changed"
		item.nameProp => "Changed"
		item.bean.name => "Changed"
	}

	@Test
	def changeNestedProperties() {
		item.personProp.firstNameProp.value = "Mayer"
		item.personProp.firstNameProp => "Mayer"
		item.personProp.bean.firstName => "Mayer"
	}

	@Test
	def testPropertyChangeListener() {
		val listener = mock(ValueChangeListener)
		item.nameProp.addValueChangeListener(listener)
		item.nameProp.value = "Next Quote"
		listener.verify(1.times).valueChange(any)
	}

	@Test
	def testPropertyChangeListenerOnModelAcces() {
		val listener = mock(ValueChangeListener)
		item.nameProp.addValueChangeListener(listener)
		item.bean.name = "Next Quote"
		listener.verify(1.times).valueChange(any)
	}

	@Test
	def propertySetChangeListener() {
		val listener = mock(PropertySetChangeListener)
		item.addPropertySetChangeListener(listener)
		item.addItemProperty(newProperty("test"))
		listener.verify.itemPropertySetChange(new ItemPropertySetChangeEvent(item))
	}

	@Test
	def getItemPropertyIds() {
		item.itemPropertyIds => #{"name", "price"}
	}

	@Test
	def addProperty() {
		val property = newProperty("test")
		item.addItemProperty(property)
		item.itemPropertyIds.contains("test") => true
		item.getItemProperty("test") => property
	}

	@Test
	def addDoubleProperty() {
		val property = newProperty("test")
		item.addItemProperty(property) => true
		item.addItemProperty(property) => false
	}

	@Test
	def nullProperies() {
		val bean = new EmptyBean()
		val item = new EmptyBeanItem(bean)

		item.itemPropertyIds => #{}
		item.getItemProperty("") => nullValue
		item.toString => notNullValue
		item.bean.toString => notNullValue
		item.addListener[]
		
		val emptyPerson = new PersonItem(new Person())
		emptyPerson.addressesProp => nullValue
	}
	

	@Test
	def itemToString() {
		item.toString => "Quote{name:Quote Hard Drive, price:42.0}"
		item.addItemProperty(newProperty("test"))
		item.toString => "Quote{name:Quote Hard Drive, price:42.0, test:test}"
	}

	@Test
	def derivedPropertyValue() {
		item.personProp.fullNameProp => "Max Mustermann"
		item.personProp.firstNameProp.value = "Eva"
		item.personProp.fullNameProp => "Eva Mustermann"
	}

	@Test
	def derivedPropertyListener() {
		val listener = mock(ValueChangeListener)
		item.personProp.fullNameProp.addValueChangeListener(listener)
		item.personProp.firstNameProp.value = "Eva"
		listener.verify(1.times).valueChange(any)
	}

	@Test
	def simpleListProperties() {
		item.dealerProp.head => "naumann"
		item.dealerProp.addItemProperty(new ValueProperty<String>("licotec"))
		item.dealerProp.last => "licotec"
	}

	@Test
	def changeSimpleListProperties() {
		item.dealerProp.head.value = "inventors"
		item.bean.dealer.head => "inventors"
	}

	@Test
	def accesEntityListProperties() {
		item.personProp.addressesProp.head.cityProp => "Karlsruhe"
	}
	
	@Test
	def changeEntityListProperties() {
		item.personProp.addressesProp.head.cityProp.value = "Köln"
		item.personProp.bean.addresses.head.city => "Köln"
	}

	@Test
	def changeEntityListPropertiesFromModel() {
		item.personProp.addressesProp.head.bean.city = "Köln"
		item.personProp.bean.addresses.head.city => "Köln"
	}
	
	@Test
	def changeEntityListPropertiesToModel() {
		item.personProp.addressesProp.head.cityProp.value = "Köln"
		item.personProp.addressesProp.head.bean.city => "Köln"
	}

	def static newQuoteMock() {
		val quote = new Quote() => [
			name = "Quote Hard Drive"
			price = 42
			dealer = #["naumann", "talksky", "intertech"]
		]
		val person = new Person() => [
			year = 1988
			firstName = "Max"
			lastName = "Mustermann"
		]
		val address1 = new Address() => [
			city = "Karlsruhe"
			street = "Kaiserstr"
			zip = 1234
		]
		val address2 = new Address() => [
			city = "Karlsruhe"
			street = "Kaiserstr"
			zip = 1234
		]
		quote.person = person
		quote.person.address = address1
		quote.person.addresses = #[address1, address2]
		return quote
	}

	def static <T> IdentableValueProperty<T> newProperty(T t, String id) {
		return new IdentableValueProperty(t, id)
	}

	def static <T> IdentableValueProperty<T> newProperty(T t) {
		return new IdentableValueProperty(t, t.toString)
	}

}
