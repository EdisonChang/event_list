package com.edison.eventlist.util;

import java.beans.PropertyDescriptor;
import java.util.Collection;
import org.apache.commons.beanutils.PropertyUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TransformerUtil {

  private static final Logger LOGGER = LoggerFactory.getLogger(TransformerUtil.class);

  public static Object transformer(Object toObj, Object fromObj) {
    if (toObj == null || fromObj == null) {
      return toObj;
    }
    try {
      PropertyDescriptor[] destDesc = PropertyUtils.getPropertyDescriptors(toObj);

      for (int i = 0; i < destDesc.length; i++) {
        Class<?> destType = destDesc[i].getPropertyType();
        Class<?> origType = PropertyUtils.getPropertyType(fromObj, destDesc[i].getName());
        if (destType != null && destType.equals(origType) && !destType.equals(Class.class)) {
          if (!Collection.class.isAssignableFrom(origType)) {
            try {
              Object value = PropertyUtils.getProperty(fromObj, destDesc[i].getName());
              PropertyUtils.setProperty(toObj, destDesc[i].getName(), value);
            } catch (Exception ex) {
              LOGGER.error("Object transform error.");
              LOGGER.error(ex.getMessage());
            }
          }
        }
      }
    } catch (Exception e) {
      LOGGER.error("TransformUtil error.");
      LOGGER.error(e.getMessage());
    }

    return toObj;
  }
}
