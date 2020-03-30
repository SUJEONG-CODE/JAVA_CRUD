package com.crud.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.crud.dto.BoardDTO;
import com.crud.dto.BoardSearchDTO;
import com.crud.dto.FileUpDTO;

public interface BoardService {

	// [ 게시판 검색 총 개수 ] 를 얻기
	int getBoardListAllCnt(BoardSearchDTO boardSearchDTO);

	// [ 게시판 검색 목록 ]얻기
	List<Map<String, String>> getBoardList(BoardSearchDTO boardSearchDTO);

	// ========================================================================
	// 게시판 글 입력 후 입력 적용 행의 개수
	// ========================================================================

	int insertBoard(BoardDTO boardDTO);

	// ========================================================================
	// 1개 게시판 글 리턴하는 메소드 선언.
	// ========================================================================
	BoardDTO getBoardDTO(Map<String, Integer> mapContent);

	// ========================================================================
	// 조회수 증가 없이 1개 게시판 글 리턴하는 메소드 선언.
	// ========================================================================
	BoardDTO getBoardDTO_without_upReadcount(int b_no);

	// 1개 게시판 수정 후 수정 적용행의 개수를 리턴하는 메소드 선언.
	int updateBoard(BoardDTO boardDTO);

	int updateFileBoard(BoardDTO boardDTO);

	// 1개 게시판 삭제 후 삭제 적용행의 개수를 리턴하는 메소드 선언.
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
	int deleteComment(Map<String, String> delComment);

	// ========================================================================
	// 비밀번호 확인
	// ========================================================================
	int insertPwd(Map<String, String> writer_pwd);

	// 댓글 비번 확인후 삭제
	int checkPwdComentDelete(int comment_password);

	// 파일등록
	int getNewEmpInsertCnt(FileUpDTO fileUpDTO);

	int getFileListAllCnt();

	int getFileListBoardAllCnt();

	List<Map<String, String>> getFileList(FileUpDTO fileUpDTO);

	FileUpDTO getFileUpDTO(int emp_no, int file_cnt);

	List<Object> getFileName(int emp_no);

	List<Object> gettemp_name(int emp_no);

	List<Object> getOnlyFileName(int b_no);

	List<Object> getOnlytemp_name(int b_no);

	// 엑셀 저장 현재페이지
	List<Map<String, String>> getExcelBoardList(BoardSearchDTO boardSearchDTO);

	// 엑셀 저장 전체피이지
	List<Map<String, String>> getExcelAllBoardList(BoardSearchDTO boardSearchDTO);

	// 파일 삭제
	int deleteFile(Map<String, String> map);

	int deleteFileBoard(BoardDTO boardDTO);

	int getNewEmpInsertCnt1(HashMap<String, Object> hm);

	int getNewEmpInsertCnt2(HashMap<String, Object> hm);

	List<Map<String, Integer>> getEmp_noForFile(FileUpDTO fileUpDTO);

}
