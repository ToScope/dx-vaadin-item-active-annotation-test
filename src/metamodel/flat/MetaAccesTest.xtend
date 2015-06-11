package metamodel.flat

class MetaAccesTest {
//		val AbstractReference v3 = $quote2.$this

	new() {
		val		Reference addressR = _quote._address;
		val		Reference city = _address._city;
//		val		Reference cityR = _quote._address._city; //$city should be accessed in a static way
		print(#[addressR,city])
	}
}
