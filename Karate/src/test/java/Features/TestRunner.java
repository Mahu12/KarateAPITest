package Features;

import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import com.intuit.karate.junit4.Karate;

import cucumber.api.CucumberOptions;


@RunWith(Karate.class)

public class TestRunner 
{
	@BeforeClass // this will tell karate to take the base url and credentials for qa environment from karate-config file
	public static void before() 
	{
		System.setProperty("karate.env","qa");
	}


}
