package com.xdylpg.util;



import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xdylpg.res.S;

import nl.captcha.Captcha;
import nl.captcha.gimpy.DropShadowGimpyRenderer;
import nl.captcha.text.producer.FiveLetterFirstNameTextProducer;
import nl.captcha.text.producer.NumbersAnswerProducer;
import nl.captcha.text.renderer.DefaultWordRenderer;

public class Validate extends HttpServlet {
	private static final long serialVersionUID = 4833534792681871048L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		response.setHeader("Pragma","No-cache");
		response.setHeader("Cache-control","no-cache");
		response.setDateHeader("Expires",0);
		response.setContentType("image/png");
		HttpSession session = request.getSession();
		
		Color c1 = new Color(76,99,67);
		Color c2 = new Color(234,34,24);
		Font f1 = new Font("Gridshift",Font.ITALIC,56);
		Font f2 = new Font("OE rmx",Font.ITALIC,56);
		List<Color> cl = new ArrayList<Color>();
		List<Font> fl = new ArrayList<Font>();
		fl.add(f1);
		fl.add(f2);
		cl.add(c1);
		cl.add(c2);
		  Captcha captcha = new Captcha.Builder(250, 50)
		  	.addText(new NumbersAnswerProducer(2),new DefaultWordRenderer(cl,fl))
		    .addText(new FiveLetterFirstNameTextProducer(),new DefaultWordRenderer(cl,fl))
		    .gimp(new DropShadowGimpyRenderer())  
		    .addNoise()
		    .addBorder()
		    .build();
		  	ServletOutputStream sos = response.getOutputStream();
		  	session.setAttribute(S.VALIDATE_CODE_KEY, captcha.getAnswer());
		  	ImageIO.write(captcha.getImage(), "png", sos);
		  	sos.flush();
		  	sos.close();

	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}
