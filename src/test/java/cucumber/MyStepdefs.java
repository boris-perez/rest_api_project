package cucumber;

import clientApi.FactoryRequest;
import clientApi.RequestInformation;
import clientApi.ResponseInformation;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import helpers.JsonHelper;
import org.json.JSONException;
import org.junit.Assert;

import static configuration.Configuration.*;

/**
 * @autor: Boris.Perez
 **/
public class MyStepdefs {

    ResponseInformation response= new ResponseInformation();


    @Given("^I have authentication to todo\\.ly$")
    public void iHaveAuthenticationToTodoLy() {
    }

    @When("I send POST request '(.*)' with json")
    public void iSendPOSTRequestApiProjectsJsonWithJson(String url, String jsonBody) {
        RequestInformation request = new RequestInformation();
        request.setUrl(HOST + url);
        request.setBody(jsonBody);
        request.addHeaders(BASIC_AUTHENTICATION_HEADER, BASIC_AUTHENTICATION);

        response= FactoryRequest.make("post").send(request);
    }

    @Then("^I expect the response code (\\d+)$")
    public void iExpectTheResponseCode(int expectResponseCode) {
        System.out.println("Response Code "+response.getResponseCode());
        Assert.assertEquals("ERROR !! the response code es incorrecto",expectResponseCode,response.getResponseCode());
    }

    @And("^I expect the response body is equal$")
    public void iExpectTheResponseBodyIsEqual(String expectedResponseBody) throws JSONException {
        System.out.println("Response Body "+response.getResponseBody());
        Assert.assertTrue("ERROR el response body es incorrecto",JsonHelper.areEqualJSON(expectedResponseBody,response.getResponseBody()));
    }

}
