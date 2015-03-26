/*******************************************************************************
 * Copyright (c) 2013 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package metamodel.flat

import org.junit.Test
import org.eclipse.xtend.core.compiler.batch.XtendCompilerTester

class MetamodelCompileTest {

	extension XtendCompilerTester compilerTester = XtendCompilerTester::newXtendCompilerTester(MetaModel)

	@Test def void testObservable() {
		'''
		package metamodel.flat.MetaModelMetaModel

		@MetaModel
		class Quotes {
			String names
			double price
			metamodel.flat.pa.Address address
		}
		'''.assertCompilesTo(
		'''
			
		''')
	}
}
