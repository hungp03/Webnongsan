package ecofarm.utility;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
	 public static Date getCurrentTime() {
	      
	        Date currentDate = new Date();
	        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	        String formattedDate = formatter.format(currentDate);

	        try {
	            return formatter.parse(formattedDate);
	        } catch (ParseException e) {
	            e.printStackTrace();
	            return null;
	        }
	    }

}
