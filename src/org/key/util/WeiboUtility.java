/**
 * @Project dbc
 * @Title WeiboUtility.java
 * @Package org.dbc.util;
 * @Description  �ƽ���������ܵ�ַ ���ַ�����1��ͨ��url���mid��2��ͨ��mid���url
 * @author caihuajun
 * @date 2011-09-09
 * @version v1.0
 */
package org.key.util;

/**
 * @ClassName WeiboUtility
 * @Description ���ƽ���������ܵ�ַ
 * @author caihuajun
 * @date 2011-09-09
 */
public class WeiboUtility {
	
	private String[] str62keys={"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
			"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
			"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
	
	String str62key="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	
	/**
	 * 62����ֵת��Ϊ10����
	 * @param {String} str62 62����ֵ
	 * @return {String} 10����ֵ
	 */
	private String str62to10(String str62)
	{
		int i10 = 0;
		for (int i = 0; i < str62.length(); i++)
		{
			int n = str62.length() - i - 1;
			String  s = str62.substring(i, i+1);
			i10 += (int)((str62key.indexOf(s))* Math.pow(62, n));
		}
		return ""+i10;
	}
	
	/**
	 * 10����ֵת��Ϊ62����
	 * @param {String} int10 10����ֵ
	 * @return {String} 62����ֵ
	 */
	private String int10to62(String int10)
	{
		String s62="";
		int r=0;
		Long long10=Long.parseLong(int10);
		while (long10 != 0)
		{
			r = (int) (long10 % 62);
			s62 = this.str62keys[r] + s62;
			long10 =Long.parseLong(""+(int)Math.floor(long10 / 62));
		}
		return s62;
	}
	
	/**
	 * URL�ַ�ת��Ϊmid
	 * @param {String} url ΢��URL�ַ��� "wr4mOFqpbO"
	 * @return {String} ΢��mid���� "201110410216293360"
	 */
	public String url2mid(String url)
	{
		  String mid="";
		  for (int i = url.length()- 4; i > -4; i = i - 4)	//�������ǰ��4�ֽ�Ϊһ���ȡURL�ַ�
			{
				int offset1 = i < 0 ? 0 : i;
				int offset2 = i + 4;
				String str = url.substring(offset1, offset2);
				str = this.str62to10(str);
				if (offset1 > 0)	//�����ǵ�һ�飬����7λ��0
				{
					while (str.length()< 7)
					{
						str = '0' + str;
					}
				}
				
				mid = str + mid;
			}
			
			return mid;
	}
	
	/**
	 * midת��ΪURL�ַ�
	 * @param {String} mid ΢��mid���� "201110410216293360"
	 * @return {String} ΢��URL�ַ��� "wr4mOFqpbO"
	 */
	public String mid2url(String mid)
	{
		//if (typeof(mid) != 'string') return false;	//mid��ֵ�ϴ󣬱���Ϊ�ַ�
		
		String url = "";
		
		for (int i = mid.length()- 7; i > -7; i = i - 7)	//�������ǰ��7�ֽ�Ϊһ���ȡmid
		{
			int offset1 = i < 0 ? 0 : i;
			int offset2 = i + 7;
			String num = mid.substring(offset1, offset2);
			
			num = this.int10to62(num);
			url = num + url;
		}
		
		return url;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		WeiboUtility w=new WeiboUtility();
	    System.out.println(w.mid2url("3354253328563489"));
		System.out.println(w.url2mid("xmLnmzVKN"));

	}

}
