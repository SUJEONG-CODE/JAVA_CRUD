package com.crud.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crud.dao.BoardDAO;
import com.crud.dto.BoardDTO;
import com.crud.dto.BoardSearchDTO;
import com.crud.dto.FileUpDTO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	// 속성변수 선언 및 BoardDAO 인터페이스를 구현한 클래스 객체화 후 저장
	@Autowired
	private BoardDAO boardDAO;

	// [ 게시판 검색 총 개수 ] 를 얻기
	@Override
	public int getBoardListAllCnt(BoardSearchDTO boardSearchDTO) {
		// boardDAO 인터페이스를 구현하 객체의 getBoardListAllCnt 메소드를 호출 해
		// 검색한 게시판 목록 개수를 얻고, 리턴한다.
		int boardListAllCnt = this.boardDAO.getBoardListAllCnt(boardSearchDTO);
		return boardListAllCnt;
	};

	// [ 게시판 검색 목록 ]얻기
	@Override
	public List<Map<String, String>> getBoardList(BoardSearchDTO boardSearchDTO) {
		List<Map<String, String>> boardList = this.boardDAO.getBoardList(boardSearchDTO);
		return boardList;
	};

	// ----------------------------------------------------------------------------------
	// 1개 게시판 글 입력 후 입력 적용 행의 개수 리턴하는 메소드 선언
	// ----------------------------------------------------------------------------------
	@Override
	public int insertBoard(BoardDTO boardDTO) {

		// boardDTO 객체에서 b_no 데이터를 꺼내서 b_no변수에 저장.
		int b_no = boardDTO.getB_no();
		// 댓글일 경우 기존 게시판의 출력순서번호를 1씩 증가 수정하고 수정 적용행의 개수 리턴하기.
		if (b_no > 0) {
			// BoardDAOImpl 객체의 updatePrint_no 메소드를 호출하여
			// 출력 순서 번호를 1증가시키고 수정 행에 적용 개수를 리턴받는다.
			// 게시판 글이 입력되는 부분 이후 글들은 출력 순서 번호를 1씩 증가하여야 한다.
			int updatePrintNO_cnt = this.boardDAO.updatePrintNo(boardDTO);
		}

		// ----------------------------------------------------------------------------------
		// 1개 게시판 글 입력 후 입력 적용행의 개수 리턴하기
		// ----------------------------------------------------------------------------------
		// BoardDAO 인터페이스를 구현한 객체의 insertBoard 메소드를 호출하여
		// 1개 게시판 글 입력 후 입력 적용 행의 개수를 리턴받는다.
		int boardRegCnt = this.boardDAO.insertBoard(boardDTO);
		return boardRegCnt;
	}

	// ----------------------------------------------------------------------------------
	// 1개 게시판 글 리턴하는 메소드 선언
	// ----------------------------------------------------------------------------------
	@Override
	public BoardDTO getBoardDTO(Map<String, Integer> mapContent) {
		// --------------------------------------------------
		// [ BoardDTOImpl ] 객체의 updateReadcount 메소드를 호출하여
		// 조회수 증가 하고 수정한 행의 개수를 얻는다.
		// --------------------------------------------------
		int readcount = this.boardDAO.updateReadcount(mapContent);
		// --------------------------------------------------
		// [ BoardDTOImpl ] 객체의 getBoardDTO 메소드를 호출하여
		// 1개 게시판 글 을 얻는다.
		// --------------------------------------------------
		BoardDTO boardDTO = this.boardDAO.getBoardDTO(mapContent);
		/*
		 * System.out.println("boarDTO" + boardDTO.getB_no()); System.out.println("getContent" + boardDTO.getContent());
		 * System.out.println("getWriter" + boardDTO.getWriter()); System.out.println("getSubject" + boardDTO.getSubject());
		 * System.out.println("getPwd" + boardDTO.getPwd());
		 */
		// --------------------------------------------------
		// 1개 게시판 글 이 저장된 BoardDTO객체를 얻는다.
		// --------------------------------------------------
		return boardDTO;

	}

	// ========================================================================
	// 조회수 증가 없이 1개 게시판 글 리턴하는 메소드 선언.
	// ========================================================================
	@Override
	public BoardDTO getBoardDTO_without_upReadcount(int b_no) {
		// --------------------------------------------------------------------------
		// BoardDAO 인터페이스 를 구현한 객체의 getBoardDTO메소드를 호출하여
		// 조회수 증거 없이 1개 게시판 글을 얻는다.
		// --------------------------------------------------------------------------
		BoardDTO boardDTO = this.boardDAO.getBoardDTO_without_upReadcount(b_no);
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

	// 1개 게시판 수정 후 수정 적용행의 개수를 리턴하는 메소드 선언.
	@Override
	public int updateBoard(BoardDTO boardDTO) {
		// -----------------------------------------------
		// BoardDAOImpl 객체의 getBoardCnt메소드를 호출하여
		// 수정할 게시판의 존재 개수를 얻는다.
		// -----------------------------------------------
		int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
		if (boardCnt == 0) {
			return -1;
		}

		// -----------------------------------------------
		// BoardDAOImpl 객체의 getPwdCnt메소드를 호출하여
		// 수정할 게시판의 비밀번호 존재 개수를 얻는다.
		// -----------------------------------------------
		// int pwdCnt = this.boardDAO.getPwdCnt(boardDTO);
		// if(pwdCnt==0) { return -2; }

		// -----------------------------------------------
		// BoardDAOImpl 객체의 updateBoard 메소드를 호출하여
		// 게시판 수정 명령한 후 수정 적용행의 개수를 얻는다.
		// -----------------------------------------------
		int updateCnt = this.boardDAO.updateBoard(boardDTO);
		// -----------------------------------------------
		// 게시판 수정 명령한 후 수정 적용행의 개수를 리턴하기.
		// -----------------------------------------------
		return updateCnt;
	}

	@Override
	public int updateFileBoard(BoardDTO boardDTO) {

		int UpdeleteFileBoardCnt = this.boardDAO.updateFileBoard(boardDTO);
		return UpdeleteFileBoardCnt;
	};
	// ------------------------------------------------------------------

	// 1개 게시판 삭제 후 삭제 적용행의 개수를 리턴하는 메소드 선언.
	@Override
	public int deleteBoard(BoardDTO boardDTO) {
		// -----------------------------------------------
		// BoardDAOImpl 객체의 getBoardCnt메소드를 호출하여
		// 삭제할 게시판의 존재 개수를 얻는다.
		// -----------------------------------------------

		// int downPrintNoCnt = this.boardDAO.downPrintNo(boardDTO);
		int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
		if (boardCnt == 0) {
			return -1;
		}

		if (boardDTO.getGroup_count() == 1 && boardDTO.getComment_count() == 0) {
			int downPrintNoCnt = this.boardDAO.downPrintNo(boardDTO);
			int alldeleteCnt = this.boardDAO.alldeleteboard(boardDTO);

			if (alldeleteCnt == 1) {
				return 1;
			}
		}

		if (boardDTO.getPrint_level() > 0 && boardDTO.getPrint_level() < boardDTO.getMax_level()) {
			// 답글들중에 답글 있는것만 업데이트
			int replyUpdateCnt = this.boardDAO.replyUpdateCntBoard(boardDTO);
			if (replyUpdateCnt == 1) {
				return 1;
			}
		}

		// 맨 마지막 글인 경우
		if (boardDTO.getMax_level() == boardDTO.getPrint_level() && boardDTO.getPrint_level() > 0) {
			System.out.println("<deleteBoard 서비스>");
			int downPrintNoCnt = this.boardDAO.downPrintNo(boardDTO);
			int alldeleteCnt = this.boardDAO.alldeleteboard(boardDTO);
			if (alldeleteCnt == 1) {
				return 1;
			}
		}

		// System.out.println("<deleteBoard 서비스>");
		// 업데이트
		int deleteCnt = this.boardDAO.deleteBoard(boardDTO);
		return deleteCnt;

		// -----------------------------------------------
		// BoardDAOImpl 객체의 getpwdCnt메소드를 호출하여
		// 삭제할 게시판의 비밀번호 존재 개수를 얻는다.
		// -----------------------------------------------
		// int pwdCnt = this.boardDAO.getPwdCnt(boardDTO);
		// if(pwdCnt==0) { return -2; }

		// -----------------------------------------------
		// BoardDAOImpl 객체의 getSonCnt메소드를 호출하여
		// 삭제할 게시판의 아들글 존재 개수를 얻는다.
		// -----------------------------------------------
		// int sonCnt = this.boardDAO.getSonCnt(boardDTO);
		// if(sonCnt>0) { return -3; }
		// -----------------------------------------------
		// BoardDAOImpl 객체의 downPrintNo 메소드를 호출하여
		// 삭제될 게시판 이후 글의 출력 순서번호를 1씩 감소시킨 후 수정 적용행의 개수를 얻는다.
		// -----------------------------------------------

		// -----------------------------------------------
		// BoardDAOImpl 객체의 deleteBoard메소드를 호출하여
		// 게시판 삭제 명령한 후 삭제 적용행의 개수를 얻는다.
		// -----------------------------------------------

	}

	// ------------------------------------------------------------------
	// 댓글리스트와 총개수 얻어오기----------------------------------------------
	@Override
	public List<Map<String, String>> getCommentDTO(int b_no) {
		// System.out.println("commentDTO 서비스 시작");

		List<Map<String, String>> commentDTO = this.boardDAO.getCommentDTO(b_no);
		return commentDTO;
	};

	@Override
	public int getCommentListAllCnt(int b_no) {

		int commentListAllCnt = this.boardDAO.getCommentListAllCnt(b_no);
		return commentListAllCnt;
	};

	// ------------------------------------------------------------------

	// ------------------------------------------------------------------
	// 댓글등록------------------------------------------------------------
	@Override
	public int insertComment(Map<String, String> admin_id_comment) {

		int commentRegCnt = this.boardDAO.insertComment(admin_id_comment);
		return commentRegCnt;
	};

	// 댓글삭제
	@Override
	public int deleteComment(Map<String, String> delComment) {

		if (delComment.get("comment_count").equals("1") && delComment.get("print_no").equals("0") && delComment.get("subject").equals(" ")) {
			int commentDelCnt = this.boardDAO.deleteComment(delComment);
			if (commentDelCnt == 1) {
				int deleteAllCoandBoardCnt = this.boardDAO.deleteAllCoandBoard(delComment);
				if (deleteAllCoandBoardCnt == 1) {
					return 2;
				}
			}
		}

		int commentDelCnt = this.boardDAO.deleteComment(delComment);
		return commentDelCnt;

	};

	// ------------------------------------------------------------------
	// 비밀번호 확인 ------------------------------------------------------------
	@Override
	public int insertPwd(Map<String, String> writer_pwd) {

		int checkPwdCnt = this.boardDAO.insertPwd(writer_pwd);
		return checkPwdCnt;
	};

	// 댓글 비번 확인후 삭제
	@Override
	public int checkPwdComentDelete(int comment_password) {
		int checkPwComentCnt = this.boardDAO.checkPwdComentDelete(comment_password);
		if (checkPwComentCnt == 0) {
			return -1;
		}
		return checkPwComentCnt;
	};

	@Override
	public int getNewEmpInsertCnt(FileUpDTO fileUpDTO) {

		int newEmpInsertCnt = this.boardDAO.getNewEmpInsertCnt(fileUpDTO);
		return newEmpInsertCnt;

	};

	@Override
	public int getFileListAllCnt() {
		int fileListAllCnt = this.boardDAO.getFileListAllCnt();
		return fileListAllCnt;
	};

	@Override
	public int getFileListBoardAllCnt() {
		int fileListBoardAllCnt = this.boardDAO.getFileListBoardAllCnt();
		return fileListBoardAllCnt;
	};

	@Override
	public List<Map<String, String>> getFileList(FileUpDTO fileUpDTO) {
		List<Map<String, String>> fileList = this.boardDAO.getFileList(fileUpDTO);
		return fileList;
	};

	/*
	 * public FileUpDTO getFileUpDTO(int emp_no, int file_cnt) { FileUpDTO fileUpDTO = this.boardDAO.getFileUpDTO(emp_no, file_cnt);
	 * 
	 * 
	 * List<String> fileName=this.boardDAO.getFileName(emp_no); List<String> temp_name=this.boardDAO.gettemp_name(emp_no);
	 * 
	 * fileUpDTO.setFile_name(fileName); fileUpDTO.setTemp_name(temp_name);
	 * 
	 * 
	 * return fileUpDTO; };
	 */

	@Override
	public FileUpDTO getFileUpDTO(int emp_no, int file_cnt) {
		FileUpDTO fileUpDTO = this.boardDAO.getFileUpDTO(emp_no, file_cnt);
		return fileUpDTO;
	};

	@Override
	public List<Object> getFileName(int emp_no) {
		List<Object> fileName = this.boardDAO.getFileName(emp_no);
		return fileName;

	};

	@Override
	public List<Object> gettemp_name(int emp_no) {
		List<Object> temp_name = this.boardDAO.gettemp_name(emp_no);
		return temp_name;
	};

	@Override
	public List<Object> getOnlyFileName(int b_no) {
		List<Object> onlyFileName = this.boardDAO.getOnlyFileName(b_no);
		return onlyFileName;

	};

	@Override
	public List<Object> getOnlytemp_name(int b_no) {
		List<Object> onlyTempName = this.boardDAO.getOnlytemp_name(b_no);
		return onlyTempName;
	};

	@Override
	public List<Object> getProfilePath(int b_no) {
		List<Object> profilePath = this.boardDAO.getProfilePath(b_no);
		return profilePath;
	};

	// 엑셀 저장 현재피이지
	@Override
	public List<Map<String, String>> getExcelBoardList(BoardSearchDTO boardSearchDTO) {
		// 엑셀 조건 후 저장페이지
		if (boardSearchDTO.getKeyword1() != null || boardSearchDTO.getKeyword2() != null || boardSearchDTO.getDate() != null
				|| boardSearchDTO.getViewCnt() != null) {
			List<Map<String, String>> excelBoardListCondition = this.boardDAO.getExcelBoardListCondition(boardSearchDTO);
			return excelBoardListCondition;
		}
		List<Map<String, String>> excelBoardList = this.boardDAO.getExcelBoardList(boardSearchDTO);
		return excelBoardList;

	};

	// 엑셀 저장 전체피이지
	@Override
	public List<Map<String, String>> getExcelAllBoardList(BoardSearchDTO boardSearchDTO) {
		List<Map<String, String>> excelAllBoardList = this.boardDAO.getExcelBoardList(boardSearchDTO);
		return excelAllBoardList;
	}

	// 파일 삭제
	@Override
	public int deleteFile(Map<String, String> map) {
		int deleteFileCnt = this.boardDAO.deleteFile(map);
		if (deleteFileCnt == 0) {
			return -2;
		}
		return deleteFileCnt;

	};

	@Override
	public int deleteFileBoard(BoardDTO boardDTO) {
		int UpdeleteFileBoardCnt = this.boardDAO.deleteFileBoard(boardDTO);

		return UpdeleteFileBoardCnt;

	};

	@Override
	public int getNewEmpInsertCnt1(HashMap<String, Object> hm) {

		int newEmpInsertCnt1 = this.boardDAO.getNewEmpInsertCnt1(hm);
		return newEmpInsertCnt1;
	};

	@Override
	public int getNewEmpInsertCnt2(HashMap<String, Object> hm) {

		int newEmpInsertCnt2 = this.boardDAO.getNewEmpInsertCnt2(hm);
		return newEmpInsertCnt2;
	};

	@Override
	public int getNewEmpInsertCnt3(HashMap<String, Object> hm) {

		int newEmpInsertCnt3 = this.boardDAO.getNewEmpInsertCnt3(hm);
		return newEmpInsertCnt3;
	};

	@Override
	public int getfilenameUpCnt(HashMap<String, Object> hm) {

		int newEmpInsertCnt2 = this.boardDAO.getfilenameUpCnt(hm);
		return newEmpInsertCnt2;
	};

	@Override
	public List<Map<String, Integer>> getEmp_noForFile(FileUpDTO fileUpDTO) {
		List<Map<String, Integer>> emp_no1 = this.boardDAO.getEmp_noForFile(fileUpDTO);
		return emp_no1;
	};

	@Override
	public int deleteFileBoardCnt(String onlytempname) {
		int boardUpDelCnt = this.boardDAO.deleteFileBoardCnt(onlytempname);
		return boardUpDelCnt;
	};

}
