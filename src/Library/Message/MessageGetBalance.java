package Library.Message;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleGetBalance
 * @brief This sample code demonstrate how to check cash & point balance through CoolSMS Rest API PHP
 */
public class MessageGetBalance {
  public static void main(String[] args) {
    String api_key = "NCSXFZHXQG3BCLYQ";
    String api_secret = "TVLOJ02XIOJKTVOSK7YYXBVTDTJKWQYS";
    Message coolsms = new Message(api_key, api_secret);

    try {
      JSONObject obj = (JSONObject) coolsms.balance();
      System.out.println(obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
  }
}