package annotations

import annotation.RefMock
import ditem.property.Derived
import annotation.TestAnnotationProcessing
import annotation.RefMock2

@TestAnnotationProcessing
class Quote {
	@Derived(RefMock, RefMock2)
	def String nameWithPrice() {
		return "test"
	}
}
