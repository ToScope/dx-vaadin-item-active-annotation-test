package metamodel.flat;

import metamodel.AbstractReference;
import metamodel.MetaModelOf;


@SuppressWarnings("all")
public class $quote2 extends AbstractReference {
//	public static final $quote $this = new $quote();

	public $quote2() {
		super("metamodel.$quote", "$quote");
	}
//	static final $privateAddress $privateAddress= $privateAddress::

	public static final AbstractReference $name = new AbstractReference("java.lang.String", "name");

	public static final AbstractReference $price = new AbstractReference("double", "price");

	public static final AbstractReference $address = new AbstractReference("metamodel.Address", "address");
	public static final AbstractReference $address3 = new AbstractReference("metamodel.Address", "address");
	
	public static final class foo extends AbstractReference {

		public final static AbstractReference $city = new AbstractReference("java.lang.String", "city");

		public foo() {
			super("", "");
			// TODO Auto-generated constructor stub
		}

		public static class $city extends AbstractReference {

			public $city() {
				super("", "");
				// TODO Auto-generated constructor stub
			}

		}

	}

	public static final class $address2 extends AbstractReference {

		public $address2() {
			super("$quote2.$address2", "this");
		}
		
		public  static enum $EA implements Reference{
			city, zip, street;

			@Override
			public String getType() {
				return "";
			}

			@Override
			public String getName() {
				return "";
			}
		}

		public  static enum $E implements Reference{
			city, zip, street;

			@Override
			public String getType() {
				return "";
			}

			@Override
			public String getName() {
				return "";
			}
		}

		@MetaModelOf("$quote2.$address2")
		public static final String $aField = "$quote2.$address2.$aField";

		public final static $address2 $ = new $address2();
		public final static AbstractReference $city = new AbstractReference("java.lang.String", "city");
		public final static AbstractReference $zip = new AbstractReference("int", "zip");
		public final static AbstractReference $street = new AbstractReference("java.lang.String", "Street");

		public static class $city extends AbstractReference {

			public $city() {
				super("quote.address.city", "city");
			}

			public static final $city $ = new $city();

		}

		public static class zipC {

		}

		public static class streetC {

		}

	}

	public static final class Address2 extends AbstractReference {

		public Address2() {
			super("$quote2.$address2", "this");
		}
	}

	public static final class AddressX extends AbstractReference {

		public AddressX() {
			super("$quote2.$address2", "this");
		}
	}

}
