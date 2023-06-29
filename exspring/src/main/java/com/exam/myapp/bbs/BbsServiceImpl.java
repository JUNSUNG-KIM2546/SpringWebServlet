package com.exam.myapp.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BbsServiceImpl implements BbsService {
	@Autowired
	private BbsDao bbsDao ;
	
	//게시물 리스트
	@Override
	public List<BbsVo> selectBbsList() {
		return bbsDao.selectBbsList();
	}

	//게시글 추가
	@Override
	public int insertBbs(BbsVo vo) {
		return bbsDao.insertBbs(vo);
	}

	//게시글 삭제
	@Override
	public int deleteBbs(int memId) {
		return bbsDao.deleteBbs(memId);
	}

	//게시글 수정
	@Override
	public int updateBbs(BbsVo vo) {
		return bbsDao.updateBbs(vo);
	}

	//게시글 검색
	@Override
	public BbsVo selectBbs(int memId) {
		return bbsDao.selectBbs(memId);
	}

}
