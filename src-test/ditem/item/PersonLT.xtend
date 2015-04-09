package ditem.item

import ditem.processor.DItem

@DItem
class PersonLT {
	String name
		int age

		new(String name, int age) {
			this.name = name
			this.age = age
		}
}