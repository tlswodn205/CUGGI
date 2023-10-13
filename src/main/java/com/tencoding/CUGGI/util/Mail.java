package com.tencoding.CUGGI.util;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.dto.request.QnaFormRequestDto;
import com.tencoding.CUGGI.dto.response.QnaAnswerMailResponseDto;

@Service("mail")
public class Mail {
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	public void sendSimpleEmail(QnaFormRequestDto qnaFormRequestDto) {
		MimeMessagePreparator preparatory = mimeMessage -> {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "UTF-8");

            String content = "<!DOCTYPE html>\r\n"
            		+ "<html lang=\"en\">\r\n"
            		+ "<head>\r\n"
            		+ "<meta charset=\"UTF-8\">\r\n"
            		+ "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
            		+ "<title>Document</title>\r\n"
            		+ "</head>\r\n"
            		+ "<body>\r\n"
            		+ "    <div class=\"main-column\">\r\n"
            		+ "        <form action=\"insertQna\" method=\"post\">\r\n"
            		+ "            <div class=\"form-group\" style=\"margin: 30px 0;\">\r\n"
            		+ "                <label for=\"username\" style=\"display: flex;\r\n"
            		+ "            margin-left: 9px;\r\n"
            		+ "            margin-bottom: 20px;\">&#51060;&#47492;</label>\r\n"
            		+ "                <input type=\"text\" id=\"username\" name=\"username\" placeholder=\"Name\" readonly value=\""+qnaFormRequestDto.getUsername()+"\" style=\"font-size: 15px;\r\n"
            		+ "            color: #222222;\r\n"
            		+ "            width: 500px;\r\n"
            		+ "            border: none;\r\n"
            		+ "            border-bottom: solid #aaaaaa 1px;\r\n"
            		+ "            padding-bottom: 10px;\r\n"
            		+ "            padding-left: 10px;\r\n"
            		+ "            background: none;\r\n"
            		+ "            outline: none;\">\r\n"
            		+ "</div>\r\n"
            		+ "            <div class=\"form-group\" style=\"margin: 30px 0;\">\r\n"
            		+ "                <label for=\"username\" style=\"display: flex;\r\n"
            		+ "            margin-left: 9px;\r\n"
            		+ "            margin-bottom: 20px;\">&#51060;&#47700;&#51068;</label>\r\n"
            		+ "                <input type=\"text\" id=\"email\" name=\"email\" placeholder=\"Email\" readonly value=\""+qnaFormRequestDto.getEmail()+"\" style=\"font-size: 15px;\r\n"
            		+ "            color: #222222;\r\n"
            		+ "            width: 500px;\r\n"
            		+ "            border: none;\r\n"
            		+ "            border-bottom: solid #aaaaaa 1px;\r\n"
            		+ "            padding-bottom: 10px;\r\n"
            		+ "            padding-left: 10px;\r\n"
            		+ "            background: none;\r\n"
            		+ "            outline: none;\">\r\n"
            		+ "</div>\r\n"
            		+ "            <div class=\"form-group\" style=\"margin: 30px 0;\">\r\n"
            		+ "                <label for=\"username\" style=\"display: flex;\r\n"
            		+ "            margin-left: 9px;\r\n"
            		+ "            margin-bottom: 20px;\">&#55092;&#45824;&#54256; &#48264;&#54840;</label>\r\n"
            		+ "                <input type=\"text\" id=\"phone\" name=\"phoneNumber\" placeholder=\"Phone Number\" readonly value=\""+qnaFormRequestDto.getPhoneNumber()+"\" style=\"font-size: 15px;\r\n"
            		+ "            color: #222222;\r\n"
            		+ "            width: 500px;\r\n"
            		+ "            border: none;\r\n"
            		+ "            border-bottom: solid #aaaaaa 1px;\r\n"
            		+ "            padding-bottom: 10px;\r\n"
            		+ "            padding-left: 10px;\r\n"
            		+ "            background: none;\r\n"
            		+ "            outline: none;\">\r\n"
            		+ "</div>\r\n"
            		+ "            <div class=\"form-group\" style=\"margin: 30px 0;\">\r\n"
            		+ "                <label for=\"title\" style=\"display: flex;\r\n"
            		+ "            margin-left: 9px;\r\n"
            		+ "            margin-bottom: 20px;\">&#51228;&#47785;</label>\r\n"
            		+ "                <input type=\"text\" id=\"title\" name=\"title\" placeholder=\"Title\" value=\""+qnaFormRequestDto.getTitle()+"\" readonly style=\"font-size: 15px;\r\n"
            		+ "            color: #222222;\r\n"
            		+ "            width: 500px;\r\n"
            		+ "            border: none;\r\n"
            		+ "            border-bottom: solid #aaaaaa 1px;\r\n"
            		+ "            padding-bottom: 10px;\r\n"
            		+ "            padding-left: 10px;\r\n"
            		+ "            background: none;\r\n"
            		+ "            outline: none;\">\r\n"
            		+ "</div>\r\n"
            		+ "            <div class=\"form-group\" style=\"margin: 30px 0;\">\r\n"
            		+ "                <label for=\"username\" style=\"display: flex;\r\n"
            		+ "            margin-left: 9px;\r\n"
            		+ "            margin-bottom: 20px;\">&#47928;&#51032;&#45236;&#50857;</label>\r\n"
            		+ "                <textarea rows=\"10\" id=\"content\" name=\"content\" placeholder=\"Q&amp;A\" readonly style=\"font-size: 15px;\r\n"
            		+ "            color: #222222;\r\n"
            		+ "            width: 500px;\r\n"
            		+ "            border: none;\r\n"
            		+ "            border-top: solid #aaaaaa 1px;\r\n"
            		+ "            border-bottom: solid #aaaaaa 1px;\r\n"
            		+ "            padding-bottom: 10px;\r\n"
            		+ "            padding-top: 10px;\r\n"
            		+ "            padding-left: 10px;\r\n"
            		+ "            background: none;\r\n"
            		+ "            resize: none;\">"+qnaFormRequestDto.getContent()+"</textarea>\r\n"
            		+ "</div>\r\n"
            		+ "        </form>\r\n"
            		+ "    </div>\r\n"
            		+ "</body>\r\n"
            		+ "</html>";
            
            String[] sendTo = new String[2];
            sendTo[0] = qnaFormRequestDto.getEmail();
            sendTo[1] = "CuggiAteam@gmail.com";
            helper.setTo(sendTo);
            helper.setFrom("CuggiATeam@gmail.com");
            helper.setSubject("고객님의 문의사항이 접수되었습니다.");
            
            helper.setText(content, true); //html 타입이므로, 두번째 파라미터에 true 설정
        };

        javaMailSender.send(preparatory);
	}
	
	public void sendAnswerEmail(QnaAnswerMailResponseDto qnaAnswerMailResponseDto) {
		MimeMessagePreparator preparatory = mimeMessage -> {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "UTF-8");

            String content = "<!DOCTYPE html>\r\n"
            		+ "<html lang=\"en\">\r\n"
            		+ "<head>\r\n"
            		+ "<meta charset=\"UTF-8\">\r\n"
            		+ "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
            		+ "<title>Document</title>\r\n"
            		+ "</head>\r\n"
            		+ "<body style=\"display: flex; justify-content: center;\">\r\n"
            		+ "    <div class=\"main-column\">\r\n"
            		+ "        <form action=\"insertQna\" method=\"post\">\r\n"
            		+ "            <div class=\"form-group\" style=\"margin: 30px 0;\">\r\n"
            		+ "                <label for=\"title\" style=\"display: flex;\r\n"
            		+ "            margin-left: 9px;\r\n"
            		+ "            margin-bottom: 20px;\">&#51228;&#47785;</label>\r\n"
            		+ "                <input type=\"text\" id=\"title\" name=\"title\" placeholder=\"Title\" value=\""+qnaAnswerMailResponseDto.getTitle()+"\" readonly style=\"font-size: 15px;\r\n"
            		+ "            color: #222222;\r\n"
            		+ "            width: 500px;\r\n"
            		+ "            border: none;\r\n"
            		+ "            border-bottom: solid #aaaaaa 1px;\r\n"
            		+ "            padding-bottom: 10px;\r\n"
            		+ "            padding-left: 10px;\r\n"
            		+ "            background: none;\r\n"
            		+ "            outline: none;\">\r\n"
            		+ "</div>\r\n"
            		+ "            <div class=\"form-group\" style=\"margin: 30px 0;\">\r\n"
            		+ "                <label for=\"username\" style=\"display: flex;\r\n"
            		+ "            margin-left: 9px;\r\n"
            		+ "            margin-bottom: 20px;\">문의내용</label>\r\n"
            		+ "                <textarea rows=\"10\" id=\"content\" name=\"content\" placeholder=\"Q&amp;A\" readonly style=\"font-size: 15px;\r\n"
            		+ "            color: #222222;\r\n"
            		+ "            width: 500px;\r\n"
            		+ "            border: none;\r\n"
            		+ "            border-top: solid #aaaaaa 1px;\r\n"
            		+ "            border-bottom: solid #aaaaaa 1px;\r\n"
            		+ "            padding-bottom: 10px;\r\n"
            		+ "            padding-top: 10px;\r\n"
            		+ "            padding-left: 10px;\r\n"
            		+ "            background: none;\r\n"
            		+ "            resize: none;\">"+qnaAnswerMailResponseDto.getContent()+"</textarea>\r\n"
            		+ "</div>\r\n"
            		+ "            <div class=\"form-group\" style=\"margin: 30px 0;\">\r\n"
            		+ "                <label for=\"username\" style=\"display: flex;\r\n"
            		+ "            margin-left: 9px;\r\n"
            		+ "            margin-bottom: 20px;\">답변내용</label>\r\n"
            		+ "                <textarea rows=\"10\" id=\"content\" name=\"QatContent\" placeholder=\"Q&amp;A\" readonly style=\"font-size: 15px;\r\n"
            		+ "            color: #222222;\r\n"
            		+ "            width: 500px;\r\n"
            		+ "            border: none;\r\n"
            		+ "            border-top: solid #aaaaaa 1px;\r\n"
            		+ "            border-bottom: solid #aaaaaa 1px;\r\n"
            		+ "            padding-bottom: 10px;\r\n"
            		+ "            padding-top: 10px;\r\n"
            		+ "            padding-left: 10px;\r\n"
            		+ "            background: none;\r\n"
            		+ "            resize: none;\">"+qnaAnswerMailResponseDto.getQatContent()+"</textarea>\r\n"
            		+ "</div>\r\n"
            		+ "        </form>\r\n"
            		+ "    </div>\r\n"
            		+ "</body>\r\n"
            		+ "</html>";
            
            String[] sendTo = new String[2];
            sendTo[0] = qnaAnswerMailResponseDto.getEmail();
            sendTo[1] = "CuggiAteam@gmail.com";
            helper.setTo(sendTo);
            helper.setFrom("CuggiATeam@gmail.com");
            helper.setSubject("고객님의 문의사항이 접수되었습니다.");
            
            helper.setText(content, true); //html 타입이므로, 두번째 파라미터에 true 설정
        };

        javaMailSender.send(preparatory);
	}
	
	public void sendAuthEmail(String email, String authCode) {
		MimeMessagePreparator preparatory = mimeMessage -> {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "UTF-8");
            String content = "";
            content += "<h3>안녕하세요. CUGGI입니다.</h3>";
            content += "<p>아래코드를 입력해주세요.</p>";
            content += "<div style=\"border: 1px solid black; width: 200px; text-align: center;\">";
            content += "<h5>인증코드입니다</h5>";
            content += "<strong>"+authCode+"</strong>";
            content += "</div>";
                        
            helper.setTo(email);
            helper.setFrom("CuggiATeam@gmail.com");
            helper.setSubject("CUGGI 인증코드입니다");
            
            helper.setText(content, true); //html 타입이므로, 두번째 파라미터에 true 설정
        };
        javaMailSender.send(preparatory);
	}
	
    public String createCode() {
        Random random = new Random();
        StringBuffer key = new StringBuffer();

        for(int i=0; i<8; i++) {
            int idx = random.nextInt(3);

            switch (idx) {
                case 0 :
                	// a(97) ~ z(122)
                    key.append((char) ((int)random.nextInt(26) + 97));
                    break;
                case 1:
                	// A(65) ~ Z(90)
                    key.append((char) ((int)random.nextInt(26) + 65));
                    break;
                case 2:
                	// 0 ~ 9
                    key.append(random.nextInt(9));
                    break;
            }
        }
        return key.toString();
    }
}
