<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="comment?type=1">
<input type="text" name="music_id" value="1" style="display:none"/>
<input type="text" name="user_id" value="2" style="display:none"/>
<input type="text" name="username" value="temp-user" style="display:none"/>
<textarea  name="context" rows="3" cols="20"></textarea>
<input type="submit" value="submit"/>

</form>
</body>
</html>