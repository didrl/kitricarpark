package com.carpark.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.List;

import com.amazonaws.AmazonClientException;
import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class S3Util {
	
	private static AWSCredentials credentials = null;
	
	private String endpoint = "s3.ap-northeast-2.amazonaws.com";
	
	private AmazonS3 conn;
	
	public S3Util() {
		
		try {
            credentials = new ProfileCredentialsProvider().getCredentials();
        } catch (Exception e) {
            throw new AmazonClientException(
                    "Cannot load the credentials from the credential profiles file. " +
                    "Please make sure that your credentials file is at the correct " +
                    "location (~/.aws/credentials), and is in valid format.",
                    e);
        }
		
		
		//AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		ClientConfiguration clientConfig = new ClientConfiguration();
		clientConfig.setProtocol(Protocol.HTTP);
		this.conn = new AmazonS3Client(credentials, clientConfig);
		conn.setEndpoint(endpoint);
	}
	
	// Bucket List
	public List<Bucket> getBucketList() {
		return conn.listBuckets();
	}
	
	// Bucket 생성 
	public Bucket createBucket(String bucketName) {
		return conn.createBucket(bucketName);
	}
	
	// 폴더 생성 (폴더는 파일명 뒤에 "/"를 붙여야한다.)
	public void createFolder(String bucketName, String folderName) {
		conn.putObject(bucketName, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
	}
	
	// 파일 업로드
	public void fileUpload(String bucketName, File file, boolean willBePublic) throws FileNotFoundException {
		
		PutObjectRequest putObj = new PutObjectRequest(bucketName, file.getName(), file);
	    if (willBePublic) {
	        putObj.setCannedAcl(CannedAccessControlList.PublicRead);
	    }
	    conn.putObject(putObj);
	    
	    //로컬의 임시 파일 삭제 
	    file.delete();
		
	}
	
	// 파일 삭제
	public void fileDelete(String bucketName, String fileName) {
		conn.deleteObject(bucketName, fileName);
	}
	
	// 파일 URL
	public String getFileURL(String bucketName, String fileName) {
		return conn.generatePresignedUrl(new GeneratePresignedUrlRequest(bucketName, fileName)).toString();
	}
	
}
