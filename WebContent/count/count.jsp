<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*" %>
<%!
	//게시판에서 방문자 횟수 카운팅 하는 방법
	//jspInit()과 jspDestroy()는 오버라이드 해서 사용함
	//방문객 저장파일
	int count = 0;
	String path="";
	
	//jspInit() 오버라이드해서 시작하기
	public void jspInit(){
		///count.txt파일에 방문객수 저장하기
		path=this.getServletContext().getRealPath("count/count.txt");
		//파일에 저장된 객수 꺼내오기
		//import해주기 java.io
		FileReader fr=null;
		BufferedReader br=null;
		try{
			fr=new FileReader(path);
			br=new BufferedReader(fr);
			//카운트 값 읽어오기
			String line=br.readLine();
			
			if(line!=null){//line에 값이 들어있다면?
				//공백이 있을지도 몰라서 트림함
				count=Integer.parseInt(line.trim());
			}
			br.close();

		}catch(FileNotFoundException e){
			//콘솔에 찍어주기,, 클라이언트에겐 안가고 서버에만 남음!
			System.err.println(e.getMessage());
			countSaveFile();
		}catch(IOException e){
			System.err.println(e.getMessage());
			countSaveFile();
		}
	}
	
	public void countSaveFile(){
		//쓰기
		FileWriter fw=null;
		PrintWriter pw=null;
		try{
			fw=new FileWriter(path);
			//true 자동 flosh!! Buffered 이용해도 됨. 2가지 방법
			pw=new PrintWriter(fw,true);
			pw.print(count);
			// pw닫으면 fw도 같이 닫힘
			pw.close();
		}catch(IOException e){
			System.err.println(e.getMessage());
		}
	}
	
	//jspDestroy 오버라이드 해서 끝내주기
	public void jspDestroy(){
		countSaveFile();
	}
%>



<%
		//세션
		if(session.isNew()){
			count++;//사용자 바뀌어서 새로운 세션이면 증가
		}

		if(count%10 == 0){
			//count 증가 시키다가 정전되면 0으로 초기화되니까
			//10마다 저장한다는 얘기,, 똑똑하네
			countSaveFile();
		}


%>

<b>방문횟수:</b>
<%
	//기존의 카운트 값을 String으로 변환
	//왜 바꿨냐면? 이미지로 바꿔서 출력할 수 있어서!
			
	String countStr=String.valueOf(count);
	String upPath=request.getContextPath()+"/img/no";
	for(int i=0; i<countStr.length(); ++i){
		String filename=upPath+countStr.charAt(i)+".gif";%>
		<img src="<%=filename %>"	>
		
<%} %>	
	
	
	
	
	
	