# trick
 scripts and tricks
 *Easy vul for beginner: IDOR, XSS, CSRF, Information disclosure.

- IDOR: khong xay ra doi voi python va ruby, tuy thuoc vao developer co config manual hay khong, neu co thi van co the IDOR

- CSRF: chu yeu la thuc hien hanh dong cua attacker muon victim thuc hien, example: delete xxx, add xxx,...

- SSRF: chu yeu lien quan toi API, attacker co the biet duoc sensitive information cua victim

- XSS: can tim duoc param
    + Dung burp proxy thuc hien request, gui vao repeter.
    + Check xem param co reflect ko: gan cho param 1 text bat ky ( param=xss ) --> xem response va search "xss" tim thuoc tinh vua duoc gan vao param ( neu param=test thi search "test" ) --> neu thuoc tinh cua param co ton tai o response thi co the khai thac vulnerability.



