package com.team1.mapper.board;

import java.util.List;
import com.team1.domain.board.PleaseVO;

public interface PleaseMapper {

	List<PleaseVO> getList();
	
	public int insert(PleaseVO board); 
	
	public PleaseVO read(Integer id); 
	
	public int delete(Integer id);
	
	public int update(PleaseVO board);
	

}
