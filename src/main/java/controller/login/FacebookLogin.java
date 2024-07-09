package controller.login;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import constant.Iconstant;
import model.FacebookAccount;
import model.User;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;

public class FacebookLogin {
    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Iconstant.FACEBOOK_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", Iconstant.FACEBOOK_CLIENT_ID)
                                .add("client_secret", Iconstant.FACEBOOK_CLIENT_SECRET)
                                .add("redirect_uri", Iconstant.FACEBOOK_REDIRECT_URI)
                                .add("code", code)
                                .build()
                )
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }
    public static FacebookAccount getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Iconstant.FACEBOOK_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        FacebookAccount fbAccount= new Gson().fromJson(response, FacebookAccount.class);
        return fbAccount;
    }

    public User createUserFromFacebookAccount(FacebookAccount facebookAccount, String accessToken) {
        User user = new User();
        user.setUsername(facebookAccount.getEmail());
        user.setPassword("");
        user.setOauthProvider("facebook");
        user.setOauthUid(facebookAccount.getId());
        user.setOauthToken(accessToken);
        user.setName(facebookAccount.getName());
        user.setEmail(facebookAccount.getEmail());
        return user;
    }
}
