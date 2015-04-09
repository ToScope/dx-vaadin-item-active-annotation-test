package de.tfr.xtend.testutil

import static org.junit.Assert.*
import org.junit.Assert
import org.hamcrest.Matcher

class AssertDoubleArrow {
	def static <T extends Object, U extends T> void operator_doubleArrow(T actual, U expected) {
		assertEquals(expected, actual);
	}

	def static void operator_doubleArrow(Double actual, String expected) {
		actual.toString => expected
	}

	def static void operator_doubleArrow(com.vaadin.data.Property<?> property, String expected) {
		property.value.toString => expected
	}

	def static <T extends Object> void operator_doubleArrow(T object, Matcher<? super T> matcher) {
		Assert.assertThat(object, matcher);
	}
}