package vaadin.model.tests

import com.vaadin.data.util.IndexedContainer
import ditem.property.ValueProperty
import com.vaadin.data.Item

class IndexedContainerTest {
	new(){
		
		val IndexedContainer container = new IndexedContainer()
		val ValueProperty<String> propName = new ValueProperty("Tom")
		val Item nameItem = container.addItem("name")
		
		 
	}
	
	def static void main(String[] args) {
		new IndexedContainerTest
	}
	
}