package com.exam.myapp.reply;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyDao {

	public int insertReply(ReplyVo rvo);
	
}