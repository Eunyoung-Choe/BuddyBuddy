package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BuddyMemberDto")
public class BuddyMemberDto {
	private int num;
	private String uname;
	private String upass;
	private String uid;
	private String uprofile;
	private Timestamp gaipday;
}