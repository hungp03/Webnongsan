package ecofarm.utility;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailer")
public class Mailer {
	@Autowired
	JavaMailSender mailer;
	private String from = "giahuyvu.1712@gmail.com";
	
	private String validateCodeGenerater(int length) {
		String validateCodeFP = "";
		while (validateCodeFP.length() < length) {
			Random rand = new Random();
			validateCodeFP += rand.nextInt(10) + "";
		}
		return validateCodeFP;
	}
	
	public String send(String to) {
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			String validateCodeFP = validateCodeGenerater(6);
			String body = """
					<h1 style="font-size:13px">Xin chào <span style="color:green; font-weight:bold">%s</span> </h1>
					<h2 style="font-size:13px">Hãy xác thực email của bạn bằng mã xác thực dưới đây:</h2>
					<div style="font-size:20px;padding:5px 10px;background-color:rgba(222,222,222,0.6);display: inline-block;margin-top:5px;margin-left:5px">
					<span style="color:rgba(25, 135, 84);font-weight:bold">%s</span></div>
					""".formatted(to,validateCodeFP);
			helper.setFrom(from,from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject("Hãy xác thực tài khoản của bạn");
			helper.setText(body, true);
			mailer.send(mail);
			return validateCodeFP;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean sendForUs(String to, String subject,String body) {
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			
			helper.setFrom(to,to);
			helper.setTo(from);
			helper.setReplyTo(to, to);
			helper.setSubject(subject);
			helper.setText(body, true);
			mailer.send(mail);
			return true;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
