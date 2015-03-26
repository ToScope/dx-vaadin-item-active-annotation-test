/*******************************************************************************
 * Copyright (c) 2013 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package metamodel.classes

import metamodel.Deep
import org.eclipse.xtend.core.compiler.batch.XtendCompilerTester
import org.junit.Test

import static org.eclipse.xtend.core.compiler.batch.XtendCompilerTester.newXtendCompilerTester

class MetaModelClassesCompileTest {
	
	val classpath = #[MetaModelClasses, Address, Deep] 

	extension XtendCompilerTester compilerTester = newXtendCompilerTester(classpath)

	@Test def void testObservable() {
		'''
		«imports(classpath)»

		@«MetaModelClasses.simpleName»
		class Quote {
			String name
			double price
			@Deep
			Address addresss
		}
		'''.assertCompilesTo(
		'''
			
		''')
	}
	
	def static imports(Class<?>... classes){
		return '''
		«FOR imp : classes»
		import «imp.name»
		«ENDFOR»
		'''
	}
}
