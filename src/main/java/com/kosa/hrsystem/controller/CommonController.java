package com.kosa.hrsystem.controller;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.service.AttendanceOkService;
import com.kosa.hrsystem.service.loginOkService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("*.do")
public class CommonController {
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String urlcommand = requestURI.substring(contextPath.length());


        Action action = null;
        ActionForward forward = null;

        if (urlcommand.equals("/login.do")) {
            //UI 제공 (서비스 객체가 필요없다)
            forward = new ActionForward(); // 서비스가 필요없으니 ActionForward객체를 직접 생성해서 사용
            forward.setRedirect(false);
            forward.setPath("/views/user/login.jsp");

        } else if (urlcommand.equals("/loginok.do")) {
            //UI 제공 + 서비스 필요
            action = new loginOkService(); // 서비스가 필요하니 서비스를 처리해주는 TestAction이라는 서비스 클래스를 생성해서 사용
            forward = action.execute(request, response); //request 클라이언트가 요청한 페이지당 1개씩 만들어지는 request객체

        } else if (urlcommand.equals("/logoutok.do")) {

            HttpSession session = request.getSession();
            session.invalidate();
            forward = new ActionForward();
            forward.setRedirect(true);
            forward.setPath("/login.do");

        } else if (urlcommand.equals("/check-attendance.do")) {
            // 출퇴근 체크 요청
            action = new AttendanceOkService();
            action.execute(request, response);

        }

        if (forward != null) {
            if (forward.isRedirect()) { //true 페이지 재 요청 (location.href="페이지"
                response.sendRedirect(forward.getPath());
            } else { //기본적으로 forward ....
                //1. UI 전달된 경우
                //2. UI + 로직
                RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
                dis.forward(request, response);
            }
        }
    }
}