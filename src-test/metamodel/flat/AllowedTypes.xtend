package metamodel.flat

import java.io.Serializable

annotation AllowedTypes {
	val String string = ""
	val Class<?> classe = NestedTest.Nested
	val Class<? extends Serializable> classeS = NestedTest.Nested
	val Class<? extends Reference> ref = $quote2.foo
	val Class<? extends Reference> ref2 = $quote2.Address2
}