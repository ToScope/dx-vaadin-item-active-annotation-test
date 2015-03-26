package messagesEnum.mock;

import java.text.FieldPosition;
import java.text.MessageFormat;
import java.util.Locale;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import com.google.common.collect.Maps;


/**
 * Provides access to the message resource bundle containing i18n messages of
 * the provided {@code ResourceBundles}.
 * 
 * Allows to change to locale on runtime changing the resource bundle.
 * 
 * @author Andy Görnt (ag@itscope.de)
 */
public class AbstractMessages {

	private static final Map<Locale, ResourceBundle> resourceBundles = Maps.newHashMap();
	private ResourceBundle resourceBundle;
	private final ResourceBundles bundle;

	public AbstractMessages(ResourceBundles bundle, Locale locale) {
		this.bundle = bundle;
		setLocale(locale);
	}

	public void setLocale(Locale locale) {
		if (locale == null) {
			resourceBundle = ResourceBundle.getBundle(bundle.getBundleName());
		} else if (resourceBundles.containsKey(locale)) {
			resourceBundle = resourceBundles.get(locale);
		} else {
			ResourceBundle rb = ResourceBundle.getBundle(bundle.getBundleName(), locale);
			resourceBundles.put(locale, rb);
			resourceBundle = rb;
		}
	}

	protected String get(String key) {
		try {
			return resourceBundle.getString(key);
		} catch (MissingResourceException e) {
			return "!" + key + "!";
		}
	}

	protected String get(String key, Object... parameters) {
		return format(get(key), resourceBundle.getLocale(), parameters);
	}
	
	public static String format(String pattern, Locale locale, Object... args) {
		final String emptyPattern = "";
		final FieldPosition zero = new FieldPosition(0);
		MessageFormat fmt = new MessageFormat(emptyPattern, locale);
		StringBuffer buf = new StringBuffer(); // I just love it...

		fmt.applyPattern(pattern);
		fmt.format(args, buf, zero);

		return buf.toString();
	}
}
