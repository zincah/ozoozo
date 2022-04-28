package ozo.spring.house.user.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import ozo.spring.house.user.MailUtils;

@Service("mss")
public class MailSendServiceImpl implements MailSendService {
	
	@Autowired
    private JavaMailSenderImpl mailSender;
	
	private int size;

    //����Ű ����
    private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }

    //�����ڵ� ���� �߻�
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }

	@Override
	public String sendAuthEmail(String email) {
		//6�ڸ� ���� ������ȣ ����
        String authKey = getKey(6);

        //�������� ������
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("ȸ������ �̸��� ����");
            sendMail.setText(new StringBuffer().append("<h1>[�̸��� ����]</h1>")
            .append("<p>�Ʒ� ������ȣ�� ȸ������ ���������� �Է����ּ���.</p>")
            .append(authKey)
            .toString());
            
            sendMail.setFrom("ioi9737@gmail.com", "������");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return authKey;
    }
	

}
