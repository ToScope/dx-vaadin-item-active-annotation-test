package livetest

import com.vaadin.data.Property.ValueChangeEvent
import com.vaadin.data.Property.ValueChangeListener

class Test implements ValueChangeListener{
	new (){
		var person = new Person()=>[
			firstName = "Max"
			age = 42
		]
		
		var item = new PersonItem(person)
		
		item.ageProp.addValueChangeListener(this)
		
		item.ageProp.setValue(43)
		
	}
	
	def static void main(String[] args) {
		new Test()
	}
	
	override valueChange(ValueChangeEvent event) {
		println(event)
	}
	
}