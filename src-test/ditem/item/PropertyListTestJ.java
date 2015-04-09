package ditem.item;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.junit.Before;

public class PropertyListTestJ {
	PersonLT tim;
	PersonLT bob;
	List<PersonLT> persons;
	PropertyList<PersonLT> props;
	List<PersonLTItem> items;
	Collection<PersonLTItem> items2;
	DItemPropertyList<PersonLTItem> dprops;

	@SuppressWarnings("unchecked")
	@Before
	void initPersons() {
		tim = new PersonLT("Tim", 13);
		bob = new PersonLT("Bob", 14);

		persons = new ArrayList<PersonLT>();
		persons.add(tim);
		persons.add(bob);

		props = new PropertyList(persons);

		List<PersonLTItem> items = persons.stream().map((p) -> new PersonLTItem(p)).collect(Collectors.toList());
		// map[new PersonLTItem(it)];

		DItemPropertyList<PersonLTItem> dprops = new DItemPropertyList(new PersonLTItem(tim),new PersonLTItem(bob));
		dprops = new DItemPropertyList(items2);
	}
}
