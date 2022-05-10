package ozo.spring.house.admin.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BannerVO {
	private Timestamp banner_uploaddate;
	private boolean banner_status;
	private String banner_title;
	private String banner_bigname;
	private String banner_urlbig;
	private String banner_smname;
	private String banner_smurl;
}
