package Library.Message;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class MessageDAO {	
	String api_key = "NCSXFZHXQG3BCLYQ";
    String api_secret = "TVLOJ02XIOJKTVOSK7YYXBVTDTJKWQYS";
    
    Message coolsms = new Message(api_key, api_secret);
    
    HashMap<String, String> params = new HashMap<String, String>();
	
	public void messageCancel() {
		try {
			JSONObject obj = (JSONObject) coolsms.cancel(params);
		    System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		    System.out.println(e.getCode());
		}
	}
}