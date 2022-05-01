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
	private String accessKey;// iam���� ���� ������ Ű 
	
	@Value("${secret_access_key}")
	private String secretKey; // iam ���� ���� ��ũ�� ������ Ű
	
	private Regions clientRegion = Regions.AP_NORTHEAST_2; // ���� ����
	
	@Value("${bucket_name}")
	private String bucket;
	
	@Value("${uploadurl}")
	private String uploadUrl;

	
	//aws s3 client ����
	@Bean
	private void createS3Client() {
		
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		// iam access key ���
		this.s3Client = AmazonS3ClientBuilder.standard()
				.withCredentials(new AWSStaticCredentialsProvider(credentials)).withRegion(clientRegion).build();
	}
	
	// ���ε� �޼���
	public void upload(File file, String key) {
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}
	
	// multipartfile ����� ���
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
		//PutObjectRequest�� AWS S3 ��Ŷ�� ���ε��� ��ü ��Ÿ �����Ϳ� ���� �����ͷ� �̷�����ִ�.
		
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
	
	
	
	// ���� �޼���
	public void delete(String key) {
		try {
			// Delete ��ü ����
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
	
	// ���� �޼���
	public void copy(String orgKey, String copyKey) {
		// copyKey�� ���Ҷ� � ������ ���簡 �ǰ� �� ������ ã�ƺ�����
		
		try {
			// Copy ��ü ����
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
