package org.key.action;

import org.key.util.DesUtils;

public class KeyTest {
	
	public static void main(String[] args) throws Exception {
		 String keyvalue="192.168.200.1,192.168.29.196";
	   DesUtils des=new DesUtils("chj");
	   if(keyvalue!=null&&!"".endsWith(keyvalue)){
	  	 if(keyvalue.indexOf(",")==-1){
	  		 keyvalue=keyvalue+"chj";
	  	 }
	  	 else{
	  		 keyvalue=keyvalue.replace(",", "chj");
	  	 }
	  	 String key=des.encrypt(keyvalue);
	  	 System.out.println(key);
	}
	}
}
