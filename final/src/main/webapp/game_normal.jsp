<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String u_id=(String)session.getAttribute("memberID");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>12201731_박승연</title>
        <style>
            body {font-family:Consolas, sans-serif}
            .main{
                background: black;
                width: 100%;
                height: 500px;
                text-align:center;
            }
            .nav{
              display: flex;
              justify-content: space-between;
              align-items: center;
              padding: 10px;
              background:white;
            }
            .nav div{
                text-decoration: none;
                background:white;
                color: black;
                font-size:30px;
                margin-right:10px;
            }
            .nav a{
              text-decoration: none;
              color: black;
              font-size:30px;
              margin-right:10px;
            }
            a {
                text-decoration: none;
                font-size: 50px;
                color: white;
            }
            canvas{
                width:100%;
                height:100px;
            }
            td{
                width:20px;
                height:50px;
            }
            td img{
                width:147px;
                height:80px;
            }
        </style>
    </head>
    <body>
        <div class="nav">
            <div>
                <a href="index_ok.jsp" title="home">Home</a>
                <a href="lsit.jsp" title="게시판">Community</a>
                <a href="game.html" title="게임">Game</a>
                <a href="ranking.html" title="랭킹">Ranking</a>
            </div>
            <div>
               	<a href="index_ok.jsp"><%= u_id %>님 환영합니다!</a>
                <a href="logout.jsp" style="font-size:20px" title="회원가입">로그아웃</a>
                <a href="withdraw.jsp" style="font-size:20px" title="회원가입">회원탈퇴</a>
            </div>
        </div>
        
        <div class="main">
            <span>
                <strong><span onclick="start()" style="color:white; cursor:pointer; font-size:21px">시작</span></strong>
                <a href="index_ok.jsp" style="font-size:20px"><strong>메인화면</strong></a>
                <a href="game.html" style="font-size:20px"><strong>이전으로</strong></a><br><br>
            </span>
            <div id="ti" style="color:white; font-size:50px">00:00.00</div>
            <script>
                let ti=document.getElementById("ti");
                let n;
                let n2=0;
                let seconds=0, ms=0, repeat;
                let start_game=false;
                function start() {
                    start_game=true;
                    let score=document.getElementById("score");
                    score.innerHTML=0;
                    n = Date.now()-n2;
                    repeat=setInterval(updateTimer, 10);
                    
                }
                function updateTimer() {
                    let cur=Date.now();
                    n2=cur-n;

                    seconds=Math.floor((n2%(1000*60))/1000);
                    ms=Math.floor((n2%1000)/10);
    
                    ti.innerHTML=seconds + "." + ms;
                    if(seconds==59 && ms==99) {
                        ti.innerHTML="60.00";
                        clearInterval(repeat);
                        stop();
                    }
                }
                function stop(){
                    let sc=document.getElementById("score");
                    alert("Congratulations! Your Score is " + sc.innerHTML + " !!");
                    start_game=false;
                    let sc2=document.getElementById("score2");
                    sc2.value=sc.innerHTML;
                }
            </script>
            <br><br><br>
            <hr>
            <table>
                <tr>
                    <td style="border:5px solid pink"><img src="" ></td><td><img src=""></td>
                    <td><img src="" ></td><td><img src="" ></td>
                    <td><img src=""></td><td><img src="" ></td>
                    <td><img src="" ></td><td><img src="" ></td>
                    <td><img src="" ></td><td><img src="" ></td>
                </tr>
            </table>
            <hr>
        </div>
        <script>
            let tds=document.getElementsByTagName("img");
            let x=tds.length;
            let cnt=0, y, minus=1;
            window.onload=function(){
                for(let i=0; i<x; i++){
                    let t=Math.floor(Math.random()*4);
                    if(t==0) tds[i].src="media/left.png";
                    else if(t==1) tds[i].src="media/right.png";
                    else if(t==2) tds[i].src="media/down.png";
                    else tds[i].src="media/top.png";
                }
            }
            function next(){
                for(let i=0; i<9; i++){
                    tds[i].src=tds[i+1].src;
                }
                let t=Math.floor(Math.random()*4);
                if(t==0) tds[9].src="http://localhost:8080/final/media/left.png";
                else if(t==1) tds[9].src="http://localhost:8080/final/media/right.png";
                else if(t==2) tds[9].src="http://localhost:8080/final/media/down.png";
                else tds[9].src="http://localhost:8080/final/media/top.png";
            }
            window.onkeydown=function(e){
                if(start_game==false) return;
                const directionKeys = {
                    ArrowUp: 'up',
                    ArrowDown: 'down',
                    ArrowLeft: 'left',
                    ArrowRight: 'right'
                }

                const presskey=directionKeys[event.key];

                if(tds[0].src=="http://localhost:8080/final/media/left.png") y=0;
                else if(tds[0].src=="http://localhost:8080/final/media/right.png") y=1;
                else if(tds[0].src=="http://localhost:8080/final/media/down.png") y=2;
                else y=3;

                if(presskey=='left' && y==0 || presskey=='right' && y==1 || presskey=='down' && y==2 || presskey=='up' && y==3){
                    let score=document.getElementById("score");
                    cnt++;
                    score.innerHTML=cnt;
                    next();
                }
                else{
                    stop_screen();
                }
                function stop_screen(){
                    alert("Wrong Answer!!");
                }
            }
        </script>
        <form action="ranking_normal_post.jsp" method="post">
        	<div id="control">
        	    <h1>점수 = <span id="score">0</span></h1>
        	</div>
        	<input type="text" name="score" id="score2">
            <input type="submit" value="제출"><br>
        </form>
    </body>
</html>