package metamodel.flat;

import metamodel.AbstractReference;


public class MetaAccesJTest {
	@SuppressWarnings("unused")
	public MetaAccesJTest() {
		quote2();
		
		Reference city = _quote._address._city;
	}

	private void quote2() {
		Reference name = $quote2.$name;
//		Reference city1 = $address.$city;
		// Geht nicht: Reference city = $quote2.$address2.$city;
		
		Class<? extends AbstractReference> a =$quote2.$address2.class ;
		
		Reference city = $quote2.$address2.$city;
		Reference address = $quote2.$address2.$;
		
		Class<? extends AbstractReference> cityC = $quote2.$address2.$city.class;
		
		Reference address2 = $quote2.$address2.$;
		Reference street = $quote2.$address2.$street;
		
		Object asd= $quoteXT.privateAddress.$street;
		Object asd2= $quoteXT.privateAddress2.$street;
	}

}
