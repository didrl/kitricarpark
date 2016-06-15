package com.carpark.util;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.amazonaws.services.s3.model.Bucket;

/**
 * Servlet implementation class FileUploadS3
 */
@WebServlet("/FileUploadS3")
public class FileUploadS3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	boolean FILE_PUBLIC_READ = true; 
	boolean FILE_PRIVATE = false;
       
	@Override
    protected void doPost(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<HTML><HEAD><TITLE>Multipart Test</TITLE></HEAD><BODY>");
        
        try {
            
            //디스크상의 프로젝트 실제 경로얻기
            String contextRootPath = this.getServletContext().getRealPath("/"); 
            //1. 메모리나 파일로 업로드 파일 보관하는 FileItem의 Factory 설정
            DiskFileItemFactory diskFactory = new DiskFileItemFactory(); //디스크 파일 아이템 공장
            diskFactory.setSizeThreshold(4096); //업로드시 사용할 임시 메모리
            diskFactory.setRepository(new File(contextRootPath + "/WEB-INF/temp")); //임시저장폴더
            
            //2. 업로드 요청을 처리하는 ServletFileUpload생성
            ServletFileUpload upload = new ServletFileUpload(diskFactory);
            upload.setSizeMax(3 * 1024 * 1024); //3MB : 전체 최대 업로드 파일 크기
            @SuppressWarnings("unchecked")
            //3. 업로드 요청파싱해서 FileItem 목록구함​​
            List<FileItem> items = upload.parseRequest(request); 

            Iterator iter = items.iterator(); //반복자(Iterator)로 받기​            
            while(iter.hasNext()) { //반목문으로 처리​    
                FileItem item = (FileItem) iter.next(); //아이템 얻기
                 //4. FileItem이 폼 입력 항목인지 여부에 따라 알맞은 처리
                if(item.isFormField()){ //파일이 아닌경우
                    processFormField(out, item);
                } else { //파일인 경우
                    processUploadFile(out, item, contextRootPath);
                }
            }
            
//            FileItem item = null;
//            for (int i = 0; i < items.size(); i++) {
//                item = items.get(i);
//                
//                if (item.isFormField()) {
//                    processFormField(out, item);
//                } else {
//                    processUploadFile(out, item, contextRootPath);
//                }
//            }
            
        } catch(Exception e) {
            out.println("<PRE>");
            e.printStackTrace(out);
            out.println("</PRE>");
        }
        
        out.println("</BODY></HTML>");
    }

	//프로필용 , 정보용, 버킷 나눌 경우 분리해보기
    //업로드한 정보가 파일인경우 처리 : contextRootPath = bucketname
    private void processUploadFile(
            PrintWriter out, FileItem item, String contextRootPath) 
            throws Exception {
        String name = item.getFieldName(); //파일의 필드 이름 얻기
        String fileName = item.getName(); //파일명 얻기
        String contentType = item.getContentType();//컨텐츠 타입 얻기
        long fileSize = item.getSize(); //파일의 크기 얻기
        
        //업로드 파일명을: id+현재시간으로 변경 후 저장 
        String id = "IUGuest";
        String fileExt = fileName.substring(fileName.lastIndexOf("."));
        String uploadedFileName = id+ "_"+ System.currentTimeMillis() + fileExt; 
        System.out.println(fileExt);
        System.out.println(uploadedFileName);
		
//------------S3 upload start-------//		
        S3Util s3 = new S3Util();
        String bucketName = "carpark.image";
      //버킷 내 profile_image 폴더에 업로드
     	bucketName+="/profile_image";
        
        //로컬에 임시 저장 후 업로드가 완료되면, 실제파일 삭제
		File uploadedFile = new File(contextRootPath + "/WEB-INF/" + uploadedFileName);
		item.write(uploadedFile); //원본파일을 새로 생성된 파일객체에 씀
		
		s3.fileUpload(bucketName, uploadedFile,FILE_PUBLIC_READ);
		
		System.out.println(s3.getFileURL(bucketName, uploadedFileName));
    		
//------------S3 upload end-------//
        
        //========== 뷰단에 출력 =========//
        out.println("<P>");
        out.println("파라미터 이름:" + name + "<BR>");
        out.println("파일 이름:" + fileName + "<BR>");
        out.println("콘텐츠 타입:" + contentType + "<BR>");
        out.println("파일 사이즈:" + fileSize + "<BR>");
        out.println("contextRootPath:" + contextRootPath + "<BR>");
        //확장자가 이미지인 경우 이미지 출력
        if(".jpg.jpeg.bmp.png.gif".contains(fileExt.toLowerCase())) {
            out.println("<IMG SRC='C:/Users/KITRI/Downloads/" 
                    + uploadedFileName 
                    + "' width='300'><BR>");
//            out.println("<IMG SRC='upload/" 
//                    + uploadedFileName 
//                    + "' width='300'><BR>");
        }        
        out.println("</P>");
        out.println("<HR>");
        out.println("실제저장경로 : "+s3.getFileURL(bucketName, uploadedFileName)+"<BR>");
        out.println("<HR>");
    }
    
    private void processFormField(PrintWriter out, FileItem item) 
        throws Exception{
        String name = item.getFieldName(); //필드명 얻기
        String value = item.getString("UTF-8"); //UTF-8형식으로 필드에 대한 값읽기
        
        out.println(name + ":" + value + "<BR>"); //출력
    }    

}
