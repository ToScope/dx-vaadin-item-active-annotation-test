package serial

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import java.io.Serializable

@WithSerialVersionUID(calculateUID=true)
//@Accessors
class XQuote implements Serializable{


	Date created;
	double totalPrice
	String title

	
}
