package ditem.item

import ditem.PersonItem
import java.util.List
import org.junit.Before
import java.util.ArrayList
import org.junit.Before
import org.junit.Test

import static org.mockito.Matchers.*
import static org.hamcrest.CoreMatchers.*

import static extension de.tfr.xtend.testutil.AssertDoubleArrow.*
import static extension org.mockito.Mockito.*



class PropertyListTest {

	PersonLT tim
	PersonLT bob
	List<PersonLT> persons
	List<PersonLTItem> items
	PropertyList<PersonLT> props
	DItemPropertyList<PersonLTItem> dprops

	@Before
	def void initPersons() {
		tim = new PersonLT("Tim", 13)
		bob = new PersonLT("Bob", 14)

		persons = #[tim, bob]

		props = new PropertyList(persons)
		
		items = persons.map[new PersonLTItem(it)]
		
		dprops = new DItemPropertyList(items)
	}

	new() {
		
	}
	
	@Test
	def void listAcces() {
		dprops.head.bean.name => "Tim"
		dprops.head.nameProp.value => "Tim"
	}
	
	@Test
	def void testChangeFromBean() {
		dprops.head.bean.name = "Max"
		dprops.head.nameProp.value => "Max"
	}
	
	@Test
	def void testChangeToBean() {
		dprops.head.nameProp.value = "Max"
		dprops.head.bean.name => "Max"
	}

}