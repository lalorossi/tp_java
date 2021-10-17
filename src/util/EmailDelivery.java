package util;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
public class EmailDelivery {
	private String userEmail;
	private String friendlyID;
	private static final String API_KEY = "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";
	private static final String SUBJECT = "Confirma tu cuenta en Arroz Tower";

	public EmailDelivery(String userEmail, String friendlyID) {
		this.userEmail = userEmail;
		this.friendlyID = friendlyID;

	}

	public void sendEmail() throws Exception {
		URL url = new URL("https://api.sendinblue.com/v3/smtp/email");

		System.out.println("aaaaaaaaaaaaa");

		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestProperty("api-key", API_KEY);
		conn.setRequestProperty("accept", "application/json");
		conn.setRequestProperty("content-type", "application/json");
		conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setDoInput(true);

		String link = "http://localhost:8080/tp_java/ActiveAccount?k=" + friendlyID;
		String textContent = "Haga click en el Link para verificar la cuenta: " + link;

		Map<String, Object> body = new HashMap();
		Map<String, Object> sender = new HashMap();
		Map<String, Object> client = new HashMap();
		sender.put("name", "Arroz Tower");
		sender.put("email", "admin@arroztower.com");
		client.put("email", userEmail);
		ArrayList<Map<String, Object>> to = new ArrayList<Map<String, Object>>();
		to.add(client);
		body.put("sender", sender);
		body.put("to", to);
		body.put("subject", SUBJECT);
		body.put("textContent", textContent);

		JSONObject json = new JSONObject(body);
		System.out.printf("JSON: %s", json);


		StringWriter output = new StringWriter();
		json.writeJSONString(output);
		String jsonBody = output.toString();

		OutputStream outStream = conn.getOutputStream();
		OutputStreamWriter outStreamWriter = new OutputStreamWriter(outStream, "UTF-8");
		outStreamWriter.write(jsonBody);
		outStreamWriter.flush();
		outStreamWriter.close();
		outStream.close();

		conn.connect();
		System.out.println("Response code: " + conn.getResponseCode());
		System.out.println("Content type: " + conn.getHeaderField("Content-Type"));

		InputStream responseStream = conn.getInputStream();
//	      InputStreamReader responseStreamReader = new InputStreamReader(responseStream);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(new InputStreamReader(responseStream, "UTF-8"));

		System.out.println(jsonObject);

//	      String id = (String)jsonObject.get("id");
//	      System.out.println("Instance id = " + id);

		conn.disconnect();
	}

}
