package com.github.jees5555.supermarketsysSSM.util;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Map.Entry;

public class LanguageUtil {
static{
	try {
		zh_cn=loadLanguage("zh-cn");
		en_us=loadLanguage("en-us");
		ja_jp=loadLanguage("ja-jp");
	} catch (IOException e) {
		e.printStackTrace();
	}
}
public static Map<String,String> zh_cn;
public static Map<String,String> en_us;
public static Map<String,String> ja_jp;

public static Map<String,String> loadLanguage(String language) throws IOException {
	Properties properties = new Properties();
	properties.load(new InputStreamReader(LanguageUtil.class.getResourceAsStream("/language/"+language+".properties"),"UTF-8"));
	Iterator<Entry<Object, Object>> it=properties.entrySet().iterator();
	Map<String,String> map = new HashMap<>();
	while(it.hasNext()){
	    Entry<Object, Object>  entry=it.next();
	    map.put((String)entry.getKey(),(String) entry.getValue());
	}
	return map;
}

public static Map<String,String> getDisplayKey(String language){
	switch (language){
	case "zh-cn":
		return zh_cn;
	case "en-us":
		return en_us;
	case "ja-jp":
	    return ja_jp;
	default :
		throw new RuntimeException("language not found");
	}
}


}
