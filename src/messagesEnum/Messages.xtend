package messagesEnum

import java.util.Locale
import localization.WithMessagesKeys
import messagesEnum.mock.AbstractMessages
import messagesEnum.mock.ResourceBundles

/**
 *@see WithMessagesKeys
 */
@WithMessagesKeys(propertyFile="Messages.properties", addJavaDoc=true, sorted=false)
class Messages extends AbstractMessages {
	public static final String EMPTY = "";
	public static Messages DEFAULT_MESSAGES = new Messages(Locale.GERMANY);

	new(Locale locale) {
		super(ResourceBundles.MESSAGES, locale);
	}

	def static String get(MessageKeys key) {
		return key.toString;
	//		return RedgiantSessionContext.getMessages().getInContext(key);
	}

	def static String get(MessageKeys key, Object... parameter) {
		return key.toString;
	//		return RedgiantSessionContext.getMessages().getInContext(key, parameter);
	}

	def String getInContext(MessageKeys key) {
		return get(key.name());
	}

	def String getInContext(MessageKeys key, Object... parameter) {

		return get(key.name(), parameter);
	}

}
