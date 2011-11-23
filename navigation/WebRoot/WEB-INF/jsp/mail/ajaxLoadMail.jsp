<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
请稍等...
<iframe id="hiddenAction" name="hiddenAction" class="none" width="0" height="0" frameborder="0" ></iframe>
<form id="z" action="https://mail.ztgame.com/owa/auth/owaauth.dll" method="post" target="hiddenAction"><input name="username" value="${requestScope.l.linkField1 }" type="hidden" /><input name="password" value="${requestScope.l.linkField2 }" type="hidden" /><input name="destination" value="https://mail.ztgame.com/owa/" type="hidden" ></form>
<script type="text/javascript">
document.getElementById("z").submit();
window.setTimeout('window.location.href = "https://mail.ztgame.com/owa"',1000);
</script>
</body>
</html>