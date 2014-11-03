package com.xdylpg.util.mail;



public class RegisteMailer {
	private String destAddr = null;
	private String id = null;

	public static void Send(String addr, String id) {
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost("smtp.qq.com");
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);
		mailInfo.setToAddress(addr);
		mailInfo.setSubject("��Į�����ʺſ�ͨȷ��");
		String content = "<html><head>��л��ע���Į����</head>"
				+ "<body>"
				+ "<font size='15' color='gray'>http://localhost:8080/shxxw/MailBack?id="
				+ id + "&email=" + addr + "</font></body></html>";
		mailInfo.setContent(content);
		// �������Ҫ�������ʼ�
		SimpleMailSender sms = new SimpleMailSender();
		// sms.sendTextMail(mailInfo);//���������ʽ
		sms.sendHtmlMail(mailInfo);// Send E-mail in html format
	}

}
