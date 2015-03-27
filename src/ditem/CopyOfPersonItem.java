package ditem;

import com.vaadin.data.Property;

import java.io.Serializable;

import metamodel.MetaModelOf;
import ditem.item.AbstractBeanItemBase;
import ditem.processor.DItem;
import ditem.property.DItemProperty;

/**
 * <h1>Generated Class, Don't Change!</h1><br>For modifying open Person.java <br>null
 */
@DItem
@MetaModelOf(value = "ditem.Person")
@SuppressWarnings("all")
public class CopyOfPersonItem extends AbstractBeanItemBase<Person> implements Serializable {
  private final DItemProperty<String> _lastNameProperty;
  
  public Property<String> getLastNameProperty() {
    return _lastNameProperty;
  }
  
  private final DItemProperty<String> _firstNameProperty;
  
  public Property<String> getFirstNameProperty() {
    return _firstNameProperty;
  }
  
  private final DItemProperty<Integer> _yearProperty;
  
  public Property<Integer> getYearProperty() {
    return _yearProperty;
  }
  
  private final AddressItem _addressProperty;
  
  public AddressItem getAddressProperty() {
    return _addressProperty;
  }
  
  public CopyOfPersonItem(final Person bean) {
    super(bean);
    _lastNameProperty = new DItemProperty<String>( String.class, bean::getLastName, bean::setLastName, "lastName");
    _firstNameProperty = new DItemProperty<String>( String.class, bean::getFirstName, bean::setFirstName, "firstName");
    _yearProperty = new DItemProperty<Integer>( Integer.class, bean::getYear, bean::setYear, "year");
    _addressProperty=new ditem.AddressItem(bean.getAddress());
    initBeanProperties( _lastNameProperty  ,_firstNameProperty,_yearProperty);
  }
  
  public String toString() {
    return getLastNameProperty()+" "+getFirstNameProperty()+" "+getYearProperty()+" "+getAddressProperty();
  }
  
  private final static long serialVersionUID = 5786918369311133631L;
}
