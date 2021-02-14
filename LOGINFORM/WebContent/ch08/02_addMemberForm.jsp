<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>한양대학교 신입생 회원가입</title>
    
    <link href='../css/join_style.css' rel='stylesheet' style='text/css'/>
 
    <script type="text/javascript">
    
        function checkValue()
        {
            if(!document.userInfo.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
    </script>
    
</head>
<body>
    <div id="wrap">
        <br><br>
        <b><font size="6" color="#7ba0cc">한양대학교</font></b><br>
        <b><font size="6" color="#7ba0cc">신입생 회원가입</font></b>
        <br><br><br>
        
        <form method="post" action="./02_addMember.jsp" name="userInfo" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" name="id" maxlength="50">
                        <input type="button" value="중복확인" >    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="gender" value="남" checked>남
                        <input type="radio" name="gender" value="여">여
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">출생년도</td>
                    <td>
                        <input type="date" name="birth">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">학번</td>
                    <td>
                        <input type="text" name="num">
                </td>
                
                </tr>
                    
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="mail" maxlength="50">@
                        <select name="mail2">
                        	<option>naver.com</option>
                        	<option>daum.net</option>
                        	<option>gmail.com</option>
                        	<option>nate.com</option>
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" />
                        
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                                 
                        <input type="text" name="address" maxlength="50">
                   
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="가입"/>  <input type="reset" value="취소">
        </form>
    </div>
</body>
</html>