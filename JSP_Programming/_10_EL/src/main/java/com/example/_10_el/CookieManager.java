package com.example._10_el;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 쿠키를 생성하고 불러오는 코드를 간편하게 해주는 코드
public class CookieManager {
    // 명시한 이름, 값, 유지 기간을 조건으로 새로운 쿠키를 생성합니다.
    public static void makeCookie(HttpServletResponse response, String cName,
                                  String cValue, int cTime) {
        Cookie cookie = new Cookie(cName, cValue);      // 쿠키 생성
        cookie.setPath("/");                            // 경로 설정(웹 애플리케이션 전체에서 사용되는 쿠키)
        cookie.setMaxAge(cTime);                        // 유지 기간 설정
        response.addCookie(cookie);                     // 응답 객체에 추가(클라이언트로 쿠키를 전송)
    }

    // 명시한 이름의 쿠키를 찾아 그 값을 반환합니다.
    public static String readCookie(HttpServletRequest request, String cName) {
        String cookieValue = ""; // 반환 값

        Cookie[] cookies = request.getCookies(); // 클라이언트가 보낸 쿠키 목록을 받음
        if (cookies != null) {
            for (Cookie c : cookies) {
                String cookieName = c.getName();
                // 가져온 쿠키의 cookieName이 cName 과 같은지 판별
                if (cookieName.equals(cName)) {
                    cookieValue = c.getValue(); // 반환값 갱신
                }
            }
        }
        return cookieValue;
    }

    // 명시한 이름의 쿠키를 삭제합니다.
    public static void deleteCookie(HttpServletResponse response, String cName) {
        makeCookie(response, cName, "", 0);        // 쿠키값을 null로 하고 유지 기간을 0으로 하여 삭제
                                                                // (makeCookie()의 재활용)
    }
}
