package com.teamnine.utils;

import java.io.InputStream;
import java.util.Properties;

public class PropertyUtil {

	/**
	 * Get information about the config file pathconfig.properties
	 * @return
	 */
	public static Properties getPropertiesPath() {

		// Save key-value pairs in the properties file
		Properties prop = new Properties();
		try {
			// Get the contents of the properties file (read the contents of the properties file into an input stream)
			InputStream in = PropertyUtil.class.getClassLoader().getResourceAsStream("pathconfig.properties");
			// Read the attribute list from the input stream
			prop.load(in);
		} catch (Exception e) {
			System.out.println("=======Configuration read failed=======");
		}
		
		return prop;
	}

}
