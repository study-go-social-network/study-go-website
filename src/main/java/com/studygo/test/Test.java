package com.studygo.test;

import javax.servlet.http.HttpServletRequest;

public class Test {
	public static void main(String[] args) {
		HttpServletRequest request=null;
		System.out.println(request.getSession().getServletContext().getRealPath("/"));
	}
}
