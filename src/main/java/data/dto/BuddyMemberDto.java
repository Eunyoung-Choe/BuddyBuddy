package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Alias("BuddyMemberDto")
@Data
public class BuddyMemberDto {
	private int num;
	private String uname;
	private String uid;
	private String upass;
	private String uprofile;
	private Timestamp gaipday;
}
