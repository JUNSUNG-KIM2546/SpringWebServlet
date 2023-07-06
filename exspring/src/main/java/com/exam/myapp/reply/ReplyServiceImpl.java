package com.exam.myapp.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ReplyServiceImpl implements ReplyService {
	

	@Autowired
	private ReplyDao replyDao ;
	
	@Override
	public int insertReply(ReplyVo rvo) {
		return replyDao.insertReply(rvo);
	}

	

}
