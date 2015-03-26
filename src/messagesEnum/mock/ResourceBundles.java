package messagesEnum.mock;

/**
 * Defines the resource bundles for RedGiant.
 * 
 * @author Andy Görnt (ag@itscope.de)
 */
public enum ResourceBundles {
	MESSAGES("de.itscope.redgiant.messages"), ERRORS("de.itscope.redgiant.errors");

	private String bundleName;

	ResourceBundles(String bundleName) {
		this.bundleName = bundleName;
	}

	public String getBundleName() {
		return bundleName;
	}

	@Override
	public String toString() {
		return bundleName;
	}
}
