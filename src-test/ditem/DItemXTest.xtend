package ditem

import com.vaadin.data.Item.PropertySetChangeListener
import com.vaadin.data.Property.ValueChangeListener
import de.oehme.xtend.junit.Hamcrest
import de.oehme.xtend.junit.JUnit
import ditem.property.IdentableValueProperty
import ditem.testutil.EmptyBean
import ditem.testutil.EmptyBeanItem
import org.junit.Before

import static org.mockito.Matchers.*

import static extension org.mockito.Mockito.*
import ditem.item.ItemPropertySetChangeEvent
import ditem.property.ValueProperty

/***
 * Tests for the Do
 */
@JUnit
@Hamcrest
class DItemUnitTest {

	var Quote quote
	var QuoteItem item

	@Before
	def void initMockQuote() {
		quote = newQuoteMock
		item = new QuoteItem(quote)
	}

	def beanType() {
		item.typeName => "ditem.Quote"
	}

	def propertyID() {
		item.nameProp.ID => "name"
	}

	def propertyType() {
		item.nameProp.type => String
	}

	def accesProperties() {
		item.nameProp => "Quote Hard Drive"
		item.priceProp => "42.0"
	}

	def accesBean() {
		item.bean.name => "Quote Hard Drive"
		item.bean.price => "42.0"
	}

	def accesNestedProperties() {
		item.personProp.firstNameProp => "Max"
		item.personProp.addressProp.streetProp => "Kaiserstr"
	}

	def accesNestedBean() {
		item.personProp.bean.firstName => "Max"
		item.personProp.addressProp.bean.street => "Kaiserstr"
	}

	def changeProperties() {
		item.nameProp.value = "Changed"
		item.nameProp => "Changed"
		item.bean.name => "Changed"
	}

	def changeNestedProperties() {
		item.personProp.firstNameProp.value = "Mayer"
		item.personProp.firstNameProp => "Mayer"
		item.personProp.bean.firstName => "Mayer"
	}

	def testPropertyChangeListener() {
		val listener = mock(ValueChangeListener)
		item.nameProp.addValueChangeListener(listener)
		item.nameProp.value = "Next Quote"
		listener.verify(1.times).valueChange(any)
	}

	def testPropertyChangeListenerOnModelAcces() {
		val listener = mock(ValueChangeListener)
		item.nameProp.addValueChangeListener(listener)
		item.bean.name = "Next Quote"
		listener.verify(1.times).valueChange(any)
	}

	def propertySetChangeListener() {
		val listener = mock(PropertySetChangeListener)
		item.addPropertySetChangeListener(listener)
		item.addItemProperty(newProperty("test"))
		listener.verify.itemPropertySetChange(new ItemPropertySetChangeEvent(item))
	}

	def getItemPropertyIds() {
		item.itemPropertyIds => #{"name", "price"}
	}

	def addProperty() {
		val property = newProperty("test")
		item.addItemProperty(property)
		item.itemPropertyIds.contains("test") => true
		item.getItemProperty("test") => property
	}

	def addDoubleProperty() {
		val property = newProperty("test")
		item.addItemProperty(property) => true
		item.addItemProperty(property) => false
	}

	def nullProperies() {
		val bean = new EmptyBean()
		val item = new EmptyBeanItem(bean)

		item.itemPropertyIds => #{}
		item.getItemProperty("") => is(nullValue)
		item.toString => notNullValue
		item.bean.toString => notNullValue
	}

	def itemToString() {
		item.toString => "Quote{name:Quote Hard Drive, price:42.0}"
		item.addItemProperty(newProperty("test"))
		item.toString => "Quote{name:Quote Hard Drive, price:42.0, test:test}"
	}

	def derivedPropertyValue() {
		item.personProp.fullNameProp => "Max Mustermann"
		item.personProp.firstNameProp.value = "Eva"
		item.personProp.fullNameProp => "Eva Mustermann"
	}

	def derivedPropertyListener() {
		val listener = mock(ValueChangeListener)
		item.personProp.fullNameProp.addValueChangeListener(listener)
		item.personProp.firstNameProp.value = "Eva"
		listener.verify(1.times).valueChange(any)
	}

	def listProperties() {
		item.dealerProp.head => "naumann"
		item.dealerProp.addItemProperty(new ValueProperty<String>("licotec"))
		item.dealerProp.last => "licotec"
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
		val address = new Address() => [
			city = "Karlsruhe"
			street = "Kaiserstr"
			zip = 1234
		]
		quote.person = person
		quote.person.address = address
		return quote
	}

	def static void operator_doubleArrow(Double actual, String expected) {
		actual.toString => expected
	}

	def static void operator_doubleArrow(com.vaadin.data.Property<?> property, String expected) {
		property.value.toString => expected
	}

	def static <T> IdentableValueProperty<T> newProperty(T t, String id) {
		return new IdentableValueProperty(t, id)
	}

	def static <T> IdentableValueProperty<T> newProperty(T t) {
		return new IdentableValueProperty(t, t.toString)
	}
}
