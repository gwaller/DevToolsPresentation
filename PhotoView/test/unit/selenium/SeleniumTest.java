package selenium;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class SeleniumTest {
	private WebDriver driver;
	private String baseUrl;
	private StringBuffer verificationErrors = new StringBuffer();
	@Before
	public void setUp() throws Exception {
		driver = new FirefoxDriver();
		baseUrl = "http://localhost:8080";
		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
	}

	@Test
	public void testPhotoView() throws Exception {
		driver.get(baseUrl + "/PhotoView/");
		driver.findElement(By.linkText("photoview.PhotoController")).click();
		driver.findElement(By.linkText("Wallaby 1")).click();
		driver.findElement(By.linkText("Photo List")).click();
		driver.findElement(By.linkText("Amur Leopard 1")).click();
		driver.findElement(By.linkText("Photo List")).click();
		driver.findElement(By.linkText("Amur Leopard 3")).click();
		driver.findElement(By.linkText("Photo List")).click();
		driver.findElement(By.linkText("Home")).click();
		driver.findElement(By.linkText("photoview.SearchController")).click();
		driver.findElement(By.name("q")).clear();
		driver.findElement(By.name("q")).sendKeys("*");
		driver.findElement(By.cssSelector("button.btn")).click();
		driver.findElement(By.linkText("800")).click();
		driver.findElement(By.linkText("1/250")).click();
		driver.findElement(By.linkText("Amur Leopard 2")).click();
	}

	@After
	public void tearDown() throws Exception {
		driver.quit();
		String verificationErrorString = verificationErrors.toString();
		if (!"".equals(verificationErrorString)) {
			fail(verificationErrorString);
		}
	}

	private boolean isElementPresent(By by) {
		try {
			driver.findElement(by);
			return true;
		} catch (NoSuchElementException e) {
			return false;
		}
	}
}
