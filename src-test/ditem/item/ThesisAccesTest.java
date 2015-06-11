package ditem.item;

import com.vaadin.data.Property;

import ditem.Person;
import ditem.PersonItem;

public class ThesisAccesTest {

	public ThesisAccesTest() {
		Person person = new Person();
		PersonItem personItem = new PersonItem(person);
		Property<String> street = personItem.getAddressProp().getStreetProp();
	}

}
