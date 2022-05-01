package ozo.spring.house.seller.service;

import java.io.File;
import java.io.InputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;


@Service("awsS3")
@PropertySource("classpath:config/awss3.properties")
public class AwsS3 {
	
	private AmazonS3 s3Client;
	
	@Value("${access_key}")
	private String accessKey;// iam에서 만든 엑세스 키 
	
	@Value("${secret_access_key}")
	private String secretKey; // iam 에서 받은 시크릿 엑세스 키
	
	private Regions clientRegion = Regions.AP_NORTHEAST_2; // 서울 지역
	
	@Value("${bucket_name}")
	private String bucket;
	
	@Value("${uploadurl}")
	private String uploadUrl;

	
	//aws s3 client 생성
	@Bean
	private void createS3Client() {
		
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		// iam access key 등록
		this.s3Client = AmazonS3ClientBuilder.standard()
				.withCredentials(new AWSStaticCredentialsProvider(credentials)).withRegion(clientRegion).build();
	}
	
	// 업로드 메서드
	public void upload(File file, String key) {
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}
	
	// multipartfile 사용할 경우
	public String upload(InputStream is, String key, String contentType, long contentLength, String dirName) {
		
		String fileName = dirName + "/" + UUID.randomUUID() + key;
		String wholeurl = uploadUrl + fileName;
		
		ObjectMetadata objectMetadata = new ObjectMetadata();
		objectMetadata.setContentType(contentType);
		objectMetadata.setContentLength(contentLength);
		
		uploadToS3(new PutObjectRequest(this.bucket, fileName, is, objectMetadata));

		return wholeurl;
	}
	
	private void uploadToS3(PutObjectRequest putObjectRequest) {
		//PutObjectRequest는 AWS S3 버킷에 업로드할 객체 메타 데이터와 파일 데이터로 이루어져있다.
		
		try {
			this.s3Client.putObject(putObjectRequest);
			System.out.println(String.format("[%s] upload complete", putObjectRequest.getKey()));
		}catch(AmazonServiceException e) {
			e.printStackTrace();
		}catch(SdkClientException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	// 삭제 메서드
	public void delete(String key) {
		try {
			// Delete 객체 생성
			DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);
			
			// Delete
			this.s3Client.deleteObject(deleteObjectRequest);
			System.out.println(String.format("[%s] deletion complete", key));
			
		}catch(AmazonServiceException e) {
			e.printStackTrace();
		}catch(SdkClientException e) {
			e.printStackTrace();
		}
	}
	
	// 복사 메서드
	public void copy(String orgKey, String copyKey) {
		// copyKey를 정할때 어떤 식으로 복사가 되게 할 것인지 찾아봐야함
		
		try {
			// Copy 객체 생성
			CopyObjectRequest copyObjectRequest = new CopyObjectRequest(this.bucket, orgKey, this.bucket, copyKey);
			
			// copy
			this.s3Client.copyObject(copyObjectRequest);
			
			System.out.println(String.format("Finish copying [%s] to [%s]", orgKey, copyKey));
		}catch(AmazonServiceException e) {
			e.printStackTrace();
		}catch(SdkClientException e) {
			e.printStackTrace();
		}
	}
	

}
