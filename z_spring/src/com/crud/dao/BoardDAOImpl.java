package com.crud.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crud.dto.BoardDTO;
import com.crud.dto.BoardSearchDTO;
import com.crud.dto.FileUpDTO;

//서비스 클래스 생성 <서비스 클래스를 생성하기전  인터페이스를 생성 후에 서비스 클래스를 생성해야 한다.>
//<인터페이스가 부모>
//@Repository를 붙여 DAO클래스 임을 지정하고, bean태그로 자동 등록됨

@Repository
public class BoardDAOImpl implements BoardDAO {

	String sqlSessionPath = "com.crud.dao.BoardDAO.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getBoardListAllCnt(BoardSearchDTO boardSearchDTO) {
		// "com.naver.erp.BoardDAO.getBoardListAllCnt"
		// mapper_board.XML 파일안에 namespace명이 com.naver.erp.BoardDAO인 쿼리문 안에서
		// id = "getBoardListAllCnt"인 쿼리문을 실행해라 이소리다.
		int boardListAllCnt = this.sqlSession.selectOne(sqlSessionPath + "getBoardListAllCnt" // 실행할 SQL 구문의 위치 지정
				, boardSearchDTO // 실행할 SQL 구문에서 사용할 데이터 지정
		);

		System.out.println(boardListAllCnt);
		return boardListAllCnt;
	}

	@Override
	public List<Map<String, String>> getBoardList(BoardSearchDTO boardSearchDTO) {
		List<Map<String, String>> boardList = this.sqlSession.selectList(sqlSessionPath + "getBoardList" // 실행할 SQL 구문의 위치 지정
				, boardSearchDTO // 실행할 SQL 구문에서 사용할 데이터 지정
		);

		// System.out.println("DAO끝 " + boardList.size() );

		return boardList;
	}

	// ========================================================================
	// 게시판 글 입력 후 입력 적용 행의 개수를 리턴하는 메소드 선언
	@Override
	public int insertBoard(BoardDTO boardDTO) {
		// --------------------------------------------------------------------------------------
		// [SqlSessionTemplate 객체]의 insert(~,~) 를 호출하여 게시판 글 입력 후 입력 적용 행의 개수 얻기
		// --------------------------------------------------------------------------------------
		// int insert(
		// "쿼리문 설정 XML 파일 안에 mapper 태그의 namespace 속성값.insert 태그 id 속성값"
		// , insert 쿼리에 삽입되는 외부 데이터 자료형
		// )
		// --------------------------------------------------------------------------------------
		// System.out.println("insertBoard DB 연동 시작");
		int boardRegCnt = sqlSession.insert(sqlSessionPath + "insertBoard" // 실행 할 sql 구문의 위치 지정
				, boardDTO // 실행 할 sql 구문에서 사용할 데이터 지정
		);
		// System.out.println("insertBoard DB 연동 성공 끝");
		return boardRegCnt;
	}

	// ========================================================================
	// 1개 게시판 글 출력번호 수정하고 수정 행의 개수 리천하는 메소드 선언.
	// ========================================================================
	@Override
	public int updatePrintNo(BoardDTO boardDTO) {
		// System.out.println("updatePrintNo DB 연동 시작");
		int updatePrint_noCnt = sqlSession.update(sqlSessionPath + "updatePrintNo" // 실행 할 sql 구문의 위치 지정
				, boardDTO // 실행 할 sql 구문에서 사용할 데이터 지정
		);
		// System.out.println("updatePrintNo DB 연동 성공 끝");
		return updatePrint_noCnt;
	}

	// ========================================================================
	// [1개 게시판 글 정보] 리턴하는 메소드 선언
	// ========================================================================

	@Override
	public int updateReadcount(Map<String, Integer> mapContent) {
		// --------------------------------------------------------------------------
		// [SqlSessionTemplate 객체] 의 update(~,~) 를 호출하여 조회수 증가 하기.
		// --------------------------------------------------------------------------
		int readcount = this.sqlSession.update(sqlSessionPath + "updateReadcount", mapContent);
		return readcount;
	}

	// ========================================================================
	// [1개 게시판 글 정보] 리턴하는 메소드 선언
	// ========================================================================
	@Override
	public BoardDTO getBoardDTO(Map<String, Integer> mapContent) {
		// --------------------------------------------------------------------------
		// [SqlSessionTemplate 객체] 의 selectOne(~,~) 를 호출하여 1개 게시판 글 정보 얻기
		// --------------------------------------------------------------------------
		// System.out.println("getBoardDTO DAO 시작");
		BoardDTO boardDTO = this.sqlSession.selectOne(sqlSessionPath + "getBoardDTO", mapContent);

		// System.out.println("getBoardDTO DAO 끝");
		return boardDTO;

	}

	@Override
	public BoardDTO getBoardDTO_without_upReadcount(int b_no) {
		BoardDTO boardDTO = this.sqlSession.selectOne(sqlSessionPath + "getBoardDTO_without_upReadcount", b_no);
		// --------------------------------------------------------------------------
		// 1개 게시판 글 이 저장된 BoardDTO 객체 리턴하기.
		// --------------------------------------------------------------------------
		/*
		 * System.out.println("boarDTO" + boardDTO.getB_no()); System.out.println("getContent" + boardDTO.getContent());
		 * System.out.println("getWriter" + boardDTO.getWriter()); System.out.println("getSubject" + boardDTO.getSubject());
		 * System.out.println("getPwd" + boardDTO.getPwd());
		 */

		return boardDTO;
	}

	// ========================================================================
	// 수정할 게시판의 존재 개수를 리턴하는 메소드 선언
	// ========================================================================
	@Override
	public int updateBoard(BoardDTO boardDTO) {
		int updateCnt = this.sqlSession.update(sqlSessionPath + "updateBoard", boardDTO);
		return updateCnt;
	}

	@Override
	public int updateFileBoard(BoardDTO boardDTO) {
		int UpdeleteFileBoardCnt = this.sqlSession.update(sqlSessionPath + "updateFileBoard", boardDTO);
		return UpdeleteFileBoardCnt;
	};

	// 삭제할 게시판의 존개 개수를 리턴하는 메소드 선언
	@Override
	public int getBoardCnt(BoardDTO boardDTO) {
		int boardCnt = this.sqlSession.selectOne(sqlSessionPath + "getBoardCnt", boardDTO);
		return boardCnt;
	}

	// 삭제할 게시판의 비밀번호 존재 개수를 리턴하는 메소드 선언
	// public int getPwdCnt(BoardDTO boardDTO) {
	// int pwdCnt = this.sqlSession.selectOne(
	// "com.naver.erp.BoardDAO.getPwdCnt"
	// , boardDTO
	// );
	// return pwdCnt;
	// }
	// ========================================================================
	// 삭제될 게시판의 아들글 존재 개수를 리턴하는 메소드 선언
	// ========================================================================
	@Override
	public int getSonCnt(BoardDTO boardDTO) {
		int sonCnt = this.sqlSession.selectOne(sqlSessionPath + "getSonCnt", boardDTO);
		System.out.println(sonCnt);
		return sonCnt;
	}

	// 삭제될 게시판 이후 글의 출력 순서번호를 1씩 감소 시킨 후 수정 적용행의 개수를 리턴하는 메소드 선언
	@Override
	public int downPrintNo(BoardDTO boardDTO) {
		int downPrintNoCnt = this.sqlSession.update(sqlSessionPath + "downPrintNo", boardDTO);
		System.out.println(downPrintNoCnt);
		return downPrintNoCnt;
	}

	// 게시판 삭제 명령한 후 삭제 적용행의 개수를 리턴하는 메소드 선언.
	@Override
	public int deleteBoard(BoardDTO boardDTO) {
		// System.out.println("<deleteBoard DAO>");

		int deleteBoardCnt = this.sqlSession.update(sqlSessionPath + "deleteBoard", boardDTO);

		// System.out.println(deleteBoardCnt);
		return deleteBoardCnt;
	}

	// ========================================================================
	// 댓글리스트와 총개수 얻어오기
	// ========================================================================
	@Override
	public List<Map<String, String>> getCommentDTO(int b_no) {

		// System.out.println("getCommentDTO DAO 시작");

		List<Map<String, String>> commentDTO = this.sqlSession.selectList(sqlSessionPath + "getCommentDTO", b_no);

		// System.out.println("getCommentDTO DAO 끝");
		return commentDTO;
	}

	@Override
	public int getCommentListAllCnt(int b_no) {
		int commentListAllCnt = this.sqlSession.selectOne(sqlSessionPath + "getCommentListAllCnt", b_no);
		return commentListAllCnt;
	}

	// ========================================================================
	// 댓글등록
	// ========================================================================
	@Override
	public int insertComment(Map<String, String> admin_id_comment) {

		// System.out.println("insertComment DAO 메소드 시작");
		// System.out.println(admin_id_comment);

		int commentRegCnt = this.sqlSession.insert(sqlSessionPath + "insertComment", admin_id_comment);

		// System.out.println("insertComment DAO 메소드 끝");
		return commentRegCnt;
	}

	// 댓글삭제
	@Override
	public int deleteComment(Map<String, String> delCommen) {
		int commentDelCnt = this.sqlSession.delete(sqlSessionPath + "deleteComment", delCommen);

		return commentDelCnt;
	};

	// 댓글 1개시 다 전체 삭제
	@Override
	public int deleteAllCoandBoard(Map<String, String> delCommen) {
		int deleteAllCoandBoardCnt = this.sqlSession.delete(sqlSessionPath + "deleteAllCoandBoard", delCommen);

		return deleteAllCoandBoardCnt;
	};

	// ========================================================================
	// 비밀번호 확인
	// ========================================================================
	@Override
	public int insertPwd(Map<String, String> writer_pwd) {
		int checkPwdCnt = this.sqlSession.selectOne(sqlSessionPath + "insertPwd", writer_pwd);
		return checkPwdCnt;
	}

	// 답글 없을 때 완전 삭제
	@Override
	public int alldeleteboard(BoardDTO boardDTO) {
		int alldeleteCnt = this.sqlSession.delete(sqlSessionPath + "alldeleteboard", boardDTO);

		return alldeleteCnt;

	};

	// 답글들중에 답글 있는것만 업데이트
	@Override
	public int replyUpdateCntBoard(BoardDTO boardDTO) {
		int replyUpdateCnt = this.sqlSession.update(sqlSessionPath + "replyUpdateCntBoard", boardDTO);
		return replyUpdateCnt;
	};

	// 댓글 비번 확인후 삭제
	@Override
	public int checkPwdComentDelete(int comment_password) {
		int checkPwComentCnt = this.sqlSession.delete(sqlSessionPath + "checkPwdComentDelete", comment_password);
		return checkPwComentCnt;
	};

	@Override
	public int getNewEmpInsertCnt(FileUpDTO fileUpDTO) {
		int newEmpInsertCnt = this.sqlSession.insert(sqlSessionPath + "getNewEmpInsertCnt", fileUpDTO);

		return newEmpInsertCnt;
	}

	// 사민만 등록하는 insert
	@Override
	public int getOnlyFileCnt(FileUpDTO fileUpDTO) {
		System.out.println("<getOnlyFileCnt DAO 시작>");
		System.out.println("emp_no은?" + fileUpDTO.getEmp_no());
		int onlyFileCnt = this.sqlSession.insert(sqlSessionPath + "getOnlyFileCnt", fileUpDTO);
		return onlyFileCnt;

	};

	@Override
	public int getFileListAllCnt() {
		int fileListAllCnt = this.sqlSession.selectOne(sqlSessionPath + "getFileListAllCnt");
		return fileListAllCnt;
	};

	@Override
	public int getFileListBoardAllCnt() {
		int fileListBoardAllCnt = this.sqlSession.selectOne(sqlSessionPath + "getFileListBoardAllCnt");
		return fileListBoardAllCnt;
	};

	@Override
	public List<Map<String, String>> getFileList(FileUpDTO fileUpDTO) {
		List<Map<String, String>> fileList = this.sqlSession.selectList(sqlSessionPath + "getFileList", fileUpDTO);
		return fileList;
	};

	@Override
	public FileUpDTO getFileUpDTO(int emp_no, int file_cnt) {
		FileUpDTO fileUpDTO = this.sqlSession.selectOne(sqlSessionPath + "getFileUpDTO", emp_no);
		return fileUpDTO;
	};

	// -----------------------------------------------------------------------
	@Override
	public List<Object> getFileName(int emp_no) {
		List<Object> fileName = this.sqlSession.selectList(sqlSessionPath + "getFileName", emp_no);

		return fileName;
	}

	@Override
	public List<Object> gettemp_name(int emp_no) {
		List<Object> temp_name = this.sqlSession.selectList(sqlSessionPath + "gettemp_name", emp_no);

		return temp_name;
	}

	@Override
	public List<Object> getOnlyFileName(int b_no) {
		List<Object> onlyFileName = this.sqlSession.selectList(sqlSessionPath + "getOnlyFileName", b_no);
		System.out.println("dao 단" + onlyFileName);
		return onlyFileName;

	};

	@Override
	public List<Object> getOnlytemp_name(int b_no) {
		List<Object> onlyTempName = this.sqlSession.selectList(sqlSessionPath + "getOnlytemp_name", b_no);

		return onlyTempName;

	};

	// ------------------------------------------------------------------------

	// 엑셀 저장 현재페이지
	@Override
	public List<Map<String, String>> getExcelBoardList(BoardSearchDTO boardSearchDTO) {
		List<Map<String, String>> excelBoardList = this.sqlSession.selectList(sqlSessionPath + "getExcelBoardList", boardSearchDTO);
		return excelBoardList;
	};

	// 엑셀 저장 전체피이지
	@Override
	public List<Map<String, String>> getExcelAllBoardList(BoardSearchDTO boardSearchDTO) {
		List<Map<String, String>> excelAllBoardList = this.sqlSession.selectList(sqlSessionPath + "getExcelAllBoardList", boardSearchDTO);
		return excelAllBoardList;
	}

	// 엑셀 조건 후 저장페이지
	@Override
	public List<Map<String, String>> getExcelBoardListCondition(BoardSearchDTO boardSearchDTO) {
		List<Map<String, String>> excelBoardListCondition = this.sqlSession.selectList(sqlSessionPath + "getExcelBoardListCondition", boardSearchDTO);
		return excelBoardListCondition;
	};

	// 파일 삭제
	@Override
	public int deleteFile(Map<String, String> map) {
		int deleteFileCnt = this.sqlSession.delete(sqlSessionPath + "deleteFile", map);

		return deleteFileCnt;
	};

	@Override
	public int deleteFileBoard(BoardDTO boardDTO) {

		int UpdeleteFileBoardCnt = this.sqlSession.delete(sqlSessionPath + "deleteFileBoard", boardDTO);

		return UpdeleteFileBoardCnt;

	};

	@Override
	public int getNewEmpInsertCnt1(HashMap<String, Object> hm) {

		int newEmpInsertCnt1 = this.sqlSession.insert(sqlSessionPath + "getNewEmpInsertCnt1", hm);
		return newEmpInsertCnt1;
	};

	@Override
	public int getNewEmpInsertCnt2(HashMap<String, Object> hm) {

		int newEmpInsertCnt2 = this.sqlSession.insert(sqlSessionPath + "getNewEmpInsertCnt2", hm);
		return newEmpInsertCnt2;
	};

	@Override
	public int getfilenameUpCnt(HashMap<String, Object> hm) {

		int newEmpInsertCnt2 = this.sqlSession.insert(sqlSessionPath + "getfilenameUpCnt", hm);
		return newEmpInsertCnt2;
	};

	@Override
	public List<Map<String, Integer>> getEmp_noForFile(FileUpDTO fileUpDTO) {

		List<Map<String, Integer>> emp_no1 = this.sqlSession.selectList(sqlSessionPath + "getEmp_noForFile", fileUpDTO);
		return emp_no1;

	};

	@Override
	public int deleteFileBoardCnt(String onlytempname) {
		int boardUpDelCnt = this.sqlSession.delete(sqlSessionPath + "deleteFileBoardCnt", onlytempname);
		return boardUpDelCnt;
	};

}
