<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*" %>
<%!
	//�Խ��ǿ��� �湮�� Ƚ�� ī���� �ϴ� ���
	//jspInit()�� jspDestroy()�� �������̵� �ؼ� �����
	//�湮�� ��������
	int count = 0;
	String path="";
	
	//jspInit() �������̵��ؼ� �����ϱ�
	public void jspInit(){
		///count.txt���Ͽ� �湮���� �����ϱ�
		path=this.getServletContext().getRealPath("count/count.txt");
		//���Ͽ� ����� ���� ��������
		//import���ֱ� java.io
		FileReader fr=null;
		BufferedReader br=null;
		try{
			fr=new FileReader(path);
			br=new BufferedReader(fr);
			//ī��Ʈ �� �о����
			String line=br.readLine();
			
			if(line!=null){//line�� ���� ����ִٸ�?
				//������ �������� ���� Ʈ����
				count=Integer.parseInt(line.trim());
			}
			br.close();

		}catch(FileNotFoundException e){
			//�ֿܼ� ����ֱ�,, Ŭ���̾�Ʈ���� �Ȱ��� �������� ����!
			System.err.println(e.getMessage());
			countSaveFile();
		}catch(IOException e){
			System.err.println(e.getMessage());
			countSaveFile();
		}
	}
	
	public void countSaveFile(){
		//����
		FileWriter fw=null;
		PrintWriter pw=null;
		try{
			fw=new FileWriter(path);
			//true �ڵ� flosh!! Buffered �̿��ص� ��. 2���� ���
			pw=new PrintWriter(fw,true);
			pw.print(count);
			// pw������ fw�� ���� ����
			pw.close();
		}catch(IOException e){
			System.err.println(e.getMessage());
		}
	}
	
	//jspDestroy �������̵� �ؼ� �����ֱ�
	public void jspDestroy(){
		countSaveFile();
	}
%>



<%
		//����
		if(session.isNew()){
			count++;//����� �ٲ� ���ο� �����̸� ����
		}

		if(count%10 == 0){
			//count ���� ��Ű�ٰ� �����Ǹ� 0���� �ʱ�ȭ�Ǵϱ�
			//10���� �����Ѵٴ� ���,, �ȶ��ϳ�
			countSaveFile();
		}


%>

<b>�湮Ƚ��:</b>
<%
	//������ ī��Ʈ ���� String���� ��ȯ
	//�� �ٲ�ĸ�? �̹����� �ٲ㼭 ����� �� �־!
			
	String countStr=String.valueOf(count);
	String upPath=request.getContextPath()+"/img/no";
	for(int i=0; i<countStr.length(); ++i){
		String filename=upPath+countStr.charAt(i)+".gif";%>
		<img src="<%=filename %>"	>
		
<%} %>	
	
	
	
	
	
	