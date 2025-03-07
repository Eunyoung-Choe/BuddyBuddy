package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("BuddyBoardDto")
@Data
public class BuddyBoardLobbyDto {
	private int idx;
	private String uid;
	private String writer;
	private String subject;
	private String content;
	private int readcount;
	private int regroup;
	private int relevel;
	private int restep;
	private Timestamp writeday;
}
