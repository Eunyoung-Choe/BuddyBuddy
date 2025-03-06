package buddy.mapper;

import org.apache.ibatis.annotations.Mapper;

import data.dto.BuddyMemberDto;

@Mapper
public interface BuddyMemberMapper {
	public BuddyMemberDto getSelectByUid(String uid);
}
