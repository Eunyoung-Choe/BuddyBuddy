package data.service;

import java.util.List;

import org.springframework.stereotype.Service;

import data.dto.BuddyBoardLobbyDto;
import data.mapper.BuddyBoardLobbyMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BuddyBoardLobbyService {
	BuddyBoardLobbyMapper buddyBoardLobbyMapper;
	
	// 로비 방명록 개수 카운트
	public int getTotalCount()
	{
		return buddyBoardLobbyMapper.getTotalCount();
	}

	// 가장 최신글 부르기
	public int getMaxIdx()
	{
		return buddyBoardLobbyMapper.getMaxIdx();
	}
	
	// 댓글 정렬 
	public void updateRestep(int regroup,int restep)
	{
		buddyBoardLobbyMapper.updateRestep(regroup, restep);
	}
	
	public void insertBoard(BuddyBoardLobbyDto dto)
	{
		int idx=dto.getIdx();
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(idx==0) {//새글인경우
			regroup=this.getMaxIdx()+1;
			relevel=0;
			restep=0;
		}else {//답글인경우
			//같은 그룹중 전달받은 restep 보다 큰값은 모두 1 증가
			this.updateRestep(regroup, restep);
			//그리고 전달받은 값보다 1 증가한다
			restep++;
			relevel++;
		}
		
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		//db insert
		buddyBoardLobbyMapper.insertBoard(dto);
	}
	
	public List<BuddyBoardLobbyDto> getPagingList(int start,int perpage)
	{
		return buddyBoardLobbyMapper.getPagingList(start, perpage);
	}
	
	public List<BuddyBoardLobbyDto> getSelectById(String uid)
	{
		return buddyBoardLobbyMapper.getSelectById(uid);
	}
	
	
}
