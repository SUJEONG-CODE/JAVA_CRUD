package com.crud.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.crud.dto.BoardDTO;
import com.crud.dto.BoardSearchDTO;
import com.crud.dto.FileUpDTO;

public interface BoardDAO {

	// ========================================================================
	// [ 게시판 검색 총 개수 ] 를 얻기
	int getBoardListAllCnt(BoardSearchDTO boardSearchDTO);

	// [ 게시판 검색 목록 ]얻기
	List<Map<String, String>> getBoardList(BoardSearchDTO boardSearchDTO);
	// ========================================================================

	// ========================================================================
	// 게시판 글 입력 후 입력 적용 행의 개수 리턴하는 메소드 선언.
	int insertBoard(BoardDTO boardDTO);

	// 1개 게시판 글 출력번호 수정하고 수정 행의 개수 리천하는 메소드 선언.
	int updatePrintNo(BoardDTO boardDTO);

	// 조회수 증가 하는 메소드 선언.
	int updateReadcount(Map<String, Integer> mapContent);

	// 1개의 게시판 정보를 리턴하는 메소드 선언
	BoardDTO getBoardDTO(Map<String, Integer> mapContent);

	// 조회수 증가 없이 1개 게시판 글 리턴하는 메소드 선언.
	BoardDTO getBoardDTO_without_upReadcount(int b_no);

	// 수정할 게시판의 존재 개수를 리턴하는 메소드 선언
	int updateBoard(BoardDTO boardDTO);

	int updateFileBoard(BoardDTO boardDTO);

	// 삭제할 게시판의 존개 개수를 리턴하는 메소드 선언
	int getBoardCnt(BoardDTO boardDTO);

	// 삭제할 게시판의 비밀번호 존재 개수를 리턴하는 메소드 선언
	// int getPwdCnt(BoardDTO boardDTO);
	// 삭제될 게시판의 아들글 존재 개수를 리턴하는 메소드 선언
	int getSonCnt(BoardDTO boardDTO);

	// 삭제될 게시판 이후 글의 출력 순서번호를 1씩 감소 시킨 후 수정 적용행의 개수를 리턴하는 메소드 선언
	int downPrintNo(BoardDTO boardDTO);

	// 게시판 삭제 명령한 후 삭제 적용행의 개수를 리턴하는 메소드 선언.
	int deleteBoard(BoardDTO boardDTO);

	// ========================================================================
	// 댓글리스트와 총개수 얻어오기
	// ========================================================================
	List<Map<String, String>> getCommentDTO(int b_no);

	int getCommentListAllCnt(int b_no);

	// ========================================================================
	// 댓글등록
	// ========================================================================
	int insertComment(Map<String, String> admin_id_comment);

	// 댓글삭제
	int deleteComment(Map<String, String> delCommen);

	// 댓글 1개시 다 전체 삭제
	int deleteAllCoandBoard(Map<String, String> delCommen);

	// ========================================================================
	// 비밀번호 확인
	// ========================================================================
	int insertPwd(Map<String, String> writer_pwd);

	// 답글 없을 때 완전 삭제
	int alldeleteboard(BoardDTO boardDTO);

	// 답글들중에 답글 있는것만 업데이트
	int replyUpdateCntBoard(BoardDTO boardDTO);

	// 댓글 비번 확인후 삭제
	int checkPwdComentDelete(int comment_password);

	int getNewEmpInsertCnt(FileUpDTO fileUpDTO);

	int getOnlyFileCnt(FileUpDTO fileUpDTO);

	int getFileListAllCnt();

	int getFileListBoardAllCnt();

	List<Map<String, String>> getFileList(FileUpDTO fileUpDTO);

	FileUpDTO getFileUpDTO(int emp_no, int file_cnt);

	List<Object> getFileName(int emp_no);

	List<Object> gettemp_name(int emp_no);

	List<Object> getOnlyFileName(int b_no);

	List<Object> getOnlytemp_name(int b_no);

	List<Object> getProfilePath(int b_no);

	// 엑셀 저장 현재페이지
	List<Map<String, String>> getExcelBoardList(BoardSearchDTO boardSearchDTO);

	// 엑셀 저장 전체피이지
	List<Map<String, String>> getExcelAllBoardList(BoardSearchDTO boardSearchDTO);

	// 엑셀 조건 후 저장페이지
	List<Map<String, String>> getExcelBoardListCondition(BoardSearchDTO boardSearchDTO);

	// 파일 삭제
	int deleteFile(Map<String, String> map);

	int deleteFileBoard(BoardDTO boardDTO);

	int getNewEmpInsertCnt1(HashMap<String, Object> hm);

	int getNewEmpInsertCnt2(HashMap<String, Object> hm);

	int getfilenameUpCnt(HashMap<String, Object> hm);

	List<Map<String, Integer>> getEmp_noForFile(FileUpDTO fileUpDTO);

	int deleteFileBoardCnt(String onlytempname);

}
