package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.BuddyBoardLobbyDto;

@Mapper
public interface BuddyBoardLobbyMapper {
	public int getTotalCount();
	public int getMaxIdx();
	public void updateRestep(int regroup,int restep);
	public void insertBoard(BuddyBoardLobbyDto dto);
	public List<BuddyBoardLobbyDto> getPagingList(int start, int perpage);
	
	public BuddyBoardLobbyDto getSelectByIdx(int idx);
	public List<BuddyBoardLobbyDto> getSelectById(String uid);
	public void deleteBoard(int idx);
}
