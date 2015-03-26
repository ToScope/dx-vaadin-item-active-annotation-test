package metamodel.flat;

import java.lang.annotation.Repeatable;

import metamodel.flat.$quote2;
import metamodel.flat.$quote2.$address2.$E;

@Repeatable(AllowedTypesList.class)
public @interface AllowedTypesAnnotation {
  public String string() default "";
  public Class<?> classe() default Object.class;
  public Class<? extends Reference> ref() default $quote2.$address2.class;
//  public Enum<? extends Reference> enu =null;
  public  $quote2.$address2.$E enue() default  $quote2.$address2.$E.city;
}
