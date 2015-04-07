package eventlistener

import java.beans.PropertyChangeListener
import java.util.List
import javax.lang.model.type.NullType

class EventListenerTest {
//	@EventListenerTet
	@EventListener
	List<PropertyChangeListener> listener;


	annotation EventListenerTet {
		Class<?> event = NullType
	}
}