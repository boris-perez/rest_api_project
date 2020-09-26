package helpers;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Iterator;

/**
 * @autor: Boris.Perez
 **/
public class JsonHelper {

    public static JSONObject convertJSON (String json) throws JSONException {
         return new JSONObject(json);
    }

    public static String getValueFromJSON (String json, String propertyName ) throws JSONException {
        String value=JsonHelper.convertJSON(json).get(propertyName).toString();
        return value;
    }

    public static boolean areEqualJSON(String expectResult, String actualResult) throws JSONException {
        boolean isEqual=true;

        JSONObject jsonExpectedResult= JsonHelper.convertJSON(expectResult);
        JSONObject jsonActualresult= JsonHelper.convertJSON(actualResult);

        Iterator<?> keys= jsonExpectedResult.keys();

        while (keys.hasNext()){
            String key = (String) keys.next();
            String actualValue=String.valueOf(jsonActualresult.get(key));
            String expectValue= String.valueOf(jsonExpectedResult.get(key));

            if(expectResult.equals("EXCLUDE")){
                System.out.println("INFO > EXCLUDE, the attribute ["+key+") no fue comparado");
            }else{
                if(!expectValue.equals(actualValue)){
                    System.out.println("INFO > COMPARING, the attribute ["+key+") vs expectResult");
                    isEqual=false;
                }
            }
        }
        return isEqual;
    }

}
