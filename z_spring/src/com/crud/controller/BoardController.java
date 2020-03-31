package com.crud.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.crud.dto.BoardDTO;
import com.crud.dto.BoardSearchDTO;
import com.crud.dto.FileUpDTO;
import com.crud.dto.OnlyFileListDTO;
import com.crud.service.BoardService;

@Controller
public class BoardController {

	// 속성변수 boardService 선언하고 [BoardService 인터페이스]를 구현받은 객체를 생성해 저장.
	// 관용적으로 [BoardService 인터페이스]를 구현받은 객체명은 boardServiceImpl 이다.
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/boardListForm.do")
	public ModelAndView getBoardList(BoardSearchDTO boardSearchDTO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardListForm.jsp");

		try {

			// HttpSession 객체에 uri 라는 키값으로 저장된 문자열 꺼내기.
			String uri = (String) session.getAttribute("uri");
			// 만약 꺼낸 문자열이 null이거나 "boardListForm"이라면 매개변수로 받은 BoardSearchDTO 객체를 HttpSession 객체에
			// boardSearchDTO 라는 키값으로 저장하기.
			if (uri == null || uri.equals("boardListForm.do")) {
				session.setAttribute("boardSearchDTO", boardSearchDTO);
			} else {
				boardSearchDTO = (BoardSearchDTO) session.getAttribute("boardSearchDTO");
			}
			session.setAttribute("uri", "boardListForm.do");

			// 게시판 총 개수 얻기
			int boardListAllCnt = this.boardService.getBoardListAllCnt(boardSearchDTO);
			int fileListBoardAllCnt = this.boardService.getFileListBoardAllCnt();

			// [ 선택된 페이지 번호 ] 보정하기.
			// [ 선택된 페이지 번호 ]와 총 개수 간의 관계가 이상할 경우 존재.
			// ex) 검색 총 개수가 3개 인데 선택페이지번호가 2페이지 일경우 (단 보여질 행의 개수가 10개 일 때 ) 모순이다.
			// 2페이지라면 11행 부터 20행 까지 짤라서 가져오란 이야기 인데
			// 현재 3행밖에 없는데 어떻게 가져오는지 의문
			if (boardListAllCnt > 0) {
				// 선택한 페이지 번호 구하기
				int selectPageNo = boardSearchDTO.getSelectPageNo();
				// 한 화면에 보여지는 행의 개수 구하기
				int rowCntPerPage = boardSearchDTO.getRowCntPerPage();
				// 검색할 시작행 번호 구하기
				int beginRowNo = selectPageNo * rowCntPerPage - rowCntPerPage + 1;
				// 검색한 총 갯수보다 검색할 시작행의 번호가 크면
				if (beginRowNo > boardListAllCnt) {
					// 선택한 페이지 번호를 '1'로 초기화 해줌.
					boardSearchDTO.setSelectPageNo(1);
				}
			}

			// System.out.println("boardListAllCnt : " + boardListAllCnt);

			// 게시판 목록 얻기

			List<Map<String, String>> boardList = this.boardService.getBoardList(boardSearchDTO);
			// System.out.println("boardList.size() : " + boardList.size() );

			// ModelAndView 객체에 검색 개수, 게시판 검색 목록 저장하기
			// ModelAndView 객체에 저장된 DB 연동 결과물은 JSP 페이지에서 EL 문법으로 아래 처럼 꺼낼 수 있다.
			// ModelAndView 객체에 저장된 데이터 꺼낼 때 → ${저장 키값 명}
			// addObject("키 값명",변수명);
			mav.addObject("boardList", boardList);
			mav.addObject("boardListAllCnt", boardListAllCnt);
			mav.addObject("fileListBoardAllCnt", fileListBoardAllCnt);
			mav.addObject("boardSearchDTO", boardSearchDTO);

			System.out.println(boardListAllCnt);

		} catch (Exception e) {
			// try 구문에서 예외가 발생하면 실행할 구문 설정
			System.out.println(e.getMessage());

			System.out.println("<에러발생>");
		}
		// [ModelAndView 객체] 리턴하기
		return mav;
	}

	// 새글 쓰기
	@RequestMapping(value = "/boardRegForm.do")
	public ModelAndView goBoardRegForm() {
		// [ModelAndView 객체] 생성하기.
		// [ModelAndView 객체] 에 [호출 JSP 페이지명]을 저장하기.
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardRegForm.jsp");
		return mav;
	}

	@RequestMapping(value = "/boardRegProc", method = RequestMethod.POST)
	public String boardRegProc(BoardDTO BoardDTO) {
		int boardRegCnt = 0;
		boardRegCnt = this.boardService.insertBoard(BoardDTO);

		/*
		 * List<Map<String, Integer>> emp_no1=this.boardService.getEmp_noForFile(fileUpDTO);
		 * 
		 * System.out.println(emp_no1); //ileUpDTO.setEmp_no( );
		 */
		if (boardRegCnt > 0) {

			return "forward:/onlyFileUploadBoard.do";
		}

		return "forward:/onlyFileUploadBoard.do";
	}

	@RequestMapping(value = "/onlyFileUploadBoard.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int onlyFileUploadBoard(BoardDTO BoardDTO, MultipartHttpServletRequest multi, @RequestParam("uploadBtn") MultipartFile[] file

	) throws IllegalStateException, IOException {
		int newEmpInsertCnt2 = 0;

		// String profilePath = "C:/stu_2020.02.12_KSJ/z_spring/WebContent/WEB-INF/resources/imagecollection/";
		String profilePath = "C:/imagecollection/";

		File dir = new File(profilePath);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		List<MultipartFile> mf = multi.getFiles("uploadBtn");

		if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {

		} else {

			for (int i = 0; i < mf.size(); i++) {
				System.out.println("시작");
				// 파일 중복명 처리
				String genId = UUID.randomUUID().toString();
				// 본래 파일명
				String originalfileName = mf.get(i).getOriginalFilename();
				originalfileName = originalfileName.trim().toLowerCase().replaceAll(" ", "");
				int position = originalfileName.lastIndexOf(".");
				String saveFileName = genId + originalfileName.substring(position);
				// File localFile = new File(profilePath + saveFileName);
				String savePath = profilePath + saveFileName;
				mf.get(i).transferTo(new File(savePath));
				long fileSize = mf.get(i).getSize(); // �뙆�씪 �궗�씠利�
				int b_no = BoardDTO.getB_no();

				HashMap<String, Object> hm = new HashMap<>();
				hm.put("originalfileName", originalfileName);
				hm.put("saveFileName", saveFileName);
				hm.put("fileSize", fileSize);

				newEmpInsertCnt2 = this.boardService.getNewEmpInsertCnt2(hm);

				System.out.println("111=====" + newEmpInsertCnt2);
			}

		}

		return newEmpInsertCnt2;

	}

	/*
	 * @RequestMapping( value="/boardRegProc.do" //접속하는 클라이언트의 URL 주소 설정 , method=RequestMethod.POST //접속하는 클라이언트의 파라미터값 전송 방법 ,
	 * produces="application/json;carset=UTF-8" //응답할 데이터 종류 : json 으로 설정 )
	 * 
	 * @ResponseBody public int insertBoard( //============================================= // 파라미터값을 저장할 BoardDTO 객체 를 매개변수로 선언
	 * //============================================= BoardDTO BoardDTO) { int boardRegCnt = 0; System.out.println(BoardDTO.getB_no()); try { //[
	 * BoardServiceImpl 객체 ]의 insertBoard 메소드 호출로 게시판 입력하고 [게시판 입력] 적용행의 개수 얻기. //System.out.println(BoardDTO.getContent());
	 * //System.out.println(BoardDTO.getPwd()); //System.out.println(BoardDTO.getReadcount());
	 * 
	 * //System.out.println(BoardDTO.getSubject()); boardRegCnt = this.boardService.insertBoard(BoardDTO);
	 * 
	 * System.out.println("boardRegCnt는 "+boardRegCnt);
	 * 
	 * }catch(Exception e) { System.out.println(e.getMessage());
	 * 
	 * System.out.println("<에러발생>"); boardRegCnt = -1; } return boardRegCnt; }
	 */

	// method=RequestMethod.GET , method=RequestMethod.POST
	// 위의 코딩을 작성하면 무조건 한가지 방식의 전송 방식을 설정하는 코딩이라서 작성한 방법으로밖에 통신이 불가능하다.
	@RequestMapping(value = "/boardContentForm.do")
	public ModelAndView goBoardContentForm(
			// b_no 라는 파라미터명에 해당하는 파라미터값이 저장되는 매개변수 b_no 선언
			// 관용적으로 파라미터명과 파라미터값은 스펠링은 동일하게 준다.
			// 게시판 PK 번호가 매개변수로 들어오므로 매개변수 자료형은 int 로 한다.
			// String으로 받아도 문제 없다.
			@RequestParam(value = "b_no") int b_no
			/* ,@RequestParam( value="admin_id[]" ) String[] admin_id */
			, @RequestParam(value = "file_cnt") int file_cnt, @RequestParam(value = "listNum") int listNum,
			@RequestParam(value = "group_no") int group_no, HttpSession session) {
		// ModelAndView 객체 생성하기
		// ModelAndView 객체 에 호출 JSP 페이지명 저장하기.
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardContentForm.jsp");

		try {

			session.setAttribute("uri", "boardContentForm.do");
			// ----------------------------------------------------------
			// [ BoardServiceImpl 객체 ]의 getBoardDTO 메소드 호출로
			// 1개의 게시판 글을 BoardDTO 객체에 담아오기
			// ----------------------------------------------------------

			Map<String, Integer> mapContent = new HashMap<String, Integer>();
			mapContent.put("b_no", b_no);
			mapContent.put("group_no", group_no);

			BoardDTO boardDTO = this.boardService.getBoardDTO(mapContent);

			// 댓글 리스트와 총개수 얻어오기-----------------------

			List<Map<String, String>> commentDTO = this.boardService.getCommentDTO(b_no);
			int commentListAllCnt = this.boardService.getCommentListAllCnt(b_no);

			List<Object> onlyFileName = this.boardService.getOnlyFileName(b_no);
			List<Object> onlyTempName = this.boardService.getOnlytemp_name(b_no);

			// ----------------------------------------------------------
			// [ ModelAndView 객체 ]에 1개의 게시판 글을 담고 있는 BoardDTO 객체 저장하기.
			// ----------------------------------------------------------
			mav.addObject("boardDTO", boardDTO);
			mav.addObject("commentDTO", commentDTO);
			mav.addObject("commentListAllCnt", commentListAllCnt);
			mav.addObject("file_cnt", file_cnt);
			mav.addObject("onlyFileName", onlyFileName);
			mav.addObject("onlyTempName", onlyTempName);

		} catch (Exception e) {

			System.out.println("BoardController_/boardContentForm.do �뿉�꽌 <�뿉�윭諛쒖깮>");
			System.out.println(e.getMessage());

		}
		return mav;
	}

	// ************************************************************************
	// /boardUpDelForm.do 접속 시 호출되는 메소드 선언.
	// ************************************************************************
	@RequestMapping(value = "/boardUpDelForm.do", method = RequestMethod.POST)
	// "b_no" 라는 파라미터명의 파라미터값이 저장되는 매개변수 b_no 선언
	public ModelAndView goBoardUpDelForm(@RequestParam(value = "b_no") int b_no, HttpSession session) {
		// try~catch 구문안에 작성하면 지역변수 형태로 선언되기 때문에 블럭안에서만 사용 가능하다.. 따라서 밖에 작성.
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardUpDelForm.jsp");
		try {

			session.setAttribute("uri", "boardUpDelForm.do");

			// ***********************************
			// [수정/삭제할 1개의 게시판 글 정보] 얻기.
			// ***********************************
			// [BoardServiceImpl 객체]의 getBoardDTO_without_upReadcount 메소드를 호출하여 얻는다.
			BoardDTO boardDTO = this.boardService.getBoardDTO_without_upReadcount(b_no);

			List<Object> onlyFileName = this.boardService.getOnlyFileName(b_no);
			List<Object> onlyTempName = this.boardService.getOnlytemp_name(b_no);

			mav.addObject("onlyFileName", onlyFileName);
			mav.addObject("onlyTempName", onlyTempName);

			mav.addObject("boardDTO", boardDTO);

			System.out.println(onlyFileName.get(0));

		} catch (Exception e) {
			// 예외 발생 시 실행할 코드 설정.
			System.out.println("<접속실패> [접속 URL]->/boardUpDelForm.do [호출메소드] -> BoardController.goBoardUpDelForm(~) \n\n\n");
		}
		return mav;
	}

	@RequestMapping(value = "/fileDelProc.do" // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 URL 二쇱냼 �꽕�젙
			, method = RequestMethod.POST // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 �뙆�씪誘명꽣媛� �쟾�넚 諛⑸쾿
			, produces = "application/json;carset=UTF-8" // �쓳�떟�븷 �뜲�씠�꽣 醫낅쪟 : json �쑝濡� �꽕�젙
	)
	@ResponseBody
	public int fileDelProc(@RequestParam(value = "onlyTempName") String onlytempname) {

		int boardUpDelCnt = 0;

		String path = "C:/imagecollection/";
		String temp_nameDel = onlytempname;
		File fileDel = new File(path + temp_nameDel);

		if (fileDel.exists() == true) {
			fileDel.delete();
		}

		boardUpDelCnt = this.boardService.deleteFileBoardCnt(onlytempname);

		return boardUpDelCnt;

	}

	// /boardUpDelProc.do 접속 시 호출되는 메소드 선언.
	@RequestMapping(value = "/boardUpDelProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int boardUpDelProc(
			// =============================================
			// 파라미터값을 저장할 BoardDTO 객체 를 매개변수로 선언
			// =============================================
			@RequestParam(value = "upDel") String upDel, BoardDTO boardDTO, MultipartHttpServletRequest multi,
			@RequestParam("uploadBtn") MultipartFile[] file) {
		// =============================================
		// 수정 또는 삭제 적용행의 개수가 저장되는 변수 선언.
		// =============================================
		int boardUpDelCnt = 0;
		int UpdeleteFileBoardCnt = 0;
		// int newEmpInsertCnt = 0;
		int newEmpInsertCnt1 = 0;
		// System.out.println("boardUpDelProc �떆�옉");
		try {
			// =============================================
			// 만약 수정모드이면 수정 실행하고 수정 적용행의 개수를 저장.
			// =============================================
			if (upDel.equals("up")) {

				String profilePath = "C:/imagecollection/";

				File dir = new File(profilePath);
				if (!dir.isDirectory()) {
					dir.mkdir();
				}

				List<MultipartFile> mf = multi.getFiles("uploadBtn");

				if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {

				} else {

					for (int i = 0; i < mf.size(); i++) {

						// 파일 중복명 처리
						String genId = UUID.randomUUID().toString();
						// 본래 파일명
						String originalfileName = mf.get(i).getOriginalFilename();
						originalfileName = originalfileName.trim().toLowerCase().replaceAll(" ", "");
						int position = originalfileName.lastIndexOf(".");
						String saveFileName = genId + originalfileName.substring(position);
						// File localFile = new File(profilePath + saveFileName);
						String savePath = profilePath + saveFileName;
						mf.get(i).transferTo(new File(savePath));
						long fileSize = mf.get(i).getSize(); // 파일 사이즈
						int b_no = boardDTO.getB_no();

						HashMap<String, Object> hm = new HashMap<>();
						hm.put("originalfileName", originalfileName);
						hm.put("saveFileName", saveFileName);
						hm.put("fileSize", fileSize);
						hm.put("b_no", b_no);

						newEmpInsertCnt1 = this.boardService.getNewEmpInsertCnt2(hm);
						boardUpDelCnt = newEmpInsertCnt1;
					}

				}

				// =============================================
				// 만약 삭제모드이면 삭제 실행하고 삭제 적용행의 개수를 저장.
				// =============================================
			} else {

				// System.out.println(boardDTO.getGroup_count());

				for (int i = 0; i < boardDTO.getOnlyTempName().length; i++) {

					String path = "C:/imagecollection/";
					String temp_nameDel = boardDTO.getOnlyTempName()[i];
					File fileDel = new File(path + temp_nameDel);
					if (fileDel.exists() == true) {
						fileDel.delete();
					}
				}

				boardUpDelCnt = this.boardService.deleteBoard(boardDTO);

				if (boardUpDelCnt > 0) {
					UpdeleteFileBoardCnt = this.boardService.deleteFileBoard(boardDTO);
				}

			}

		} catch (Exception e) {
			System.out.println("<�뿉�윭諛쒖깮>");
			System.out.println(e.getMessage());
			boardUpDelCnt = -1;

		}
		// 수정 또는 삭제 적용행의 개수 리턴
		return boardUpDelCnt;
	}

	// --------------------------------------------------------
	// 파일업로드
	// ---------------------------------------------------------
	@RequestMapping(value = "/fileForm.do")
	public ModelAndView goFileForm() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("fileForm.jsp");
		return mav;
	}

	// --------------------------------------------------------
	// 댓글등록
	// ---------------------------------------------------------
	@RequestMapping(value = "/comentRegProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int insertComment(
			// =============================================
			// 파라미터값을 저장할 BoardDTO 객체 를 매개변수로 선언
			// =============================================
			@RequestParam(value = "writer") String writer, @RequestParam(value = "comment_detail") String comment_detail,
			@RequestParam(value = "b_no") String b_no, @RequestParam(value = "comment_password") String comment_password

	) {
		int commentRegCnt = 0;

		try {

			Map<String, String> mapComment = new HashMap<String, String>();
			mapComment.put("writer", writer);
			mapComment.put("comment_detail", comment_detail);
			mapComment.put("b_no", b_no);
			mapComment.put("comment_password", comment_password);

			commentRegCnt = this.boardService.insertComment(mapComment);
			System.out.println(commentRegCnt);

		} catch (Exception e) {

			System.out.println("<�뿉�윭諛쒖깮>");
			System.out.println(e.getMessage());

			commentRegCnt = -1;
		}
		return commentRegCnt;
	}

	// --------------------------------------------------------
	// 댓글삭제
	// ---------------------------------------------------------
	@RequestMapping(value = "/comentDelProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int deleteComment(
			// =============================================
			// 파라미터값을 저장할 BoardDTO 객체 를 매개변수로 선언
			// =============================================
			/*
			 * @RequestParam(value="b_no_comment") String b_no_comment ,@RequestParam(value="c_code") String c_code ,@RequestParam(value="b_code")
			 * String b_code ,@RequestParam(value="b_no") int b_no
			 */ @RequestParam(value = "comment_password") String comment_password, @RequestParam(value = "b_no_comment") String b_no_comment,
			@RequestParam(value = "comment_count") String comment_count, @RequestParam(value = "b_no") String b_no,
			@RequestParam(value = "subject") String subject, @RequestParam(value = "print_no") String print_no,
			@RequestParam(value = "print_level") String print_level

	) {
		int commentDelCnt = 0;

		try {

			Map<String, String> delComment = new HashMap<String, String>();
			delComment.put("comment_password", comment_password);
			delComment.put("b_no_comment", b_no_comment);
			delComment.put("comment_count", comment_count);
			delComment.put("b_no", b_no);
			delComment.put("subject", subject);
			delComment.put("print_no", print_no);
			delComment.put("print_level", print_level);

			// System.out.println("comment_count�뒗?"+comment_count);
			// System.out.println("comment_count�뒗?"+comment_count);
			// System.out.println("comment_count�뒗--?"+delComment.get("comment_count"));

			commentDelCnt = this.boardService.deleteComment(delComment);
		} catch (Exception e) {

			System.out.println("<�뿉�윭諛쒖깮>");
			System.out.println(e.getMessage());

			commentDelCnt = -1;
		}
		return commentDelCnt;
	}

	// ----------------------------------------------------------------------
	// 글 수정시 비밀번호 확인하는 창 현재는 사용 안함

	@RequestMapping(value = "/checkPwProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int insertPwd(
			// =============================================
			// 파라미터값을 저장할 BoardDTO 객체 를 매개변수로 선언
			// =============================================
			@RequestParam(value = "writer") String writer, @RequestParam(value = "pwd") String pwd) {
		int checkPwdCnt = 0;

		Map<String, String> map = new HashMap<String, String>();

		System.out.println("writer" + writer);
		System.out.println("pwd" + pwd);
		map.put("writer", writer);
		map.put("pwd", pwd);

		try {

			checkPwdCnt = this.boardService.insertPwd(map);

			System.out.println(checkPwdCnt);

		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("checkPwProc <�뿉�윭諛쒖깮>");
			checkPwdCnt = -1;
		}
		return checkPwdCnt;
	}

	// 댓글 비번 확인후 삭제

	@RequestMapping(value = "/checkPwdComentProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int checkPwdComentDelete(@RequestParam(value = "comment_password") int comment_password) {
		int checkPwComentCnt = 0;

		try {

			System.out.println(comment_password);
			checkPwComentCnt = this.boardService.checkPwdComentDelete(comment_password);

			System.out.println(checkPwComentCnt);

		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("<�뿉�윭諛쒖깮>");
			checkPwComentCnt = -1;
		}
		return checkPwComentCnt;
	}
	/*
	 * //단일 파일 업로드
	 * 
	 * @RequestMapping(value = "/newEmpInfoProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 * 
	 * @ResponseBody public int newEmpjoinMemberProc(FileUpDTO fileUpDTO,
	 * 
	 * @RequestParam("uploadBtn") MultipartFile multipartFile ) { int newEmpInsertCnt = 0;
	 * 
	 * try { //String profilePath = "C:/stu_2020.02.12_KSJ/z_spring/WebContent/WEB-INF/resources/imagecollection/"; String profilePath =
	 * "C:/imagecollection/"; String originalFilename = multipartFile.getOriginalFilename();
	 * 
	 * 
	 * if(originalFilename.isEmpty() != true){ originalFilename = originalFilename.trim().toLowerCase().replaceAll(" ", ""); //int length =
	 * originalFilename.length(); int position = originalFilename.lastIndexOf("."); //String emp_email = fileUpDTO.getEmp_email(); String temFileName
	 * = UUID.randomUUID().toString(); //System.out.println("emp_no=>"+emp_no); String upFileName = temFileName +
	 * originalFilename.substring(position); File localFile = new File(profilePath + upFileName); //if(localFile.exists()==true){ //
	 * localFile.delete(); //} multipartFile.transferTo(localFile); fileUpDTO.setEmp_pic(upFileName); } else { fileUpDTO.setEmp_pic("newWithoutPic");
	 * } newEmpInsertCnt = this.boardService.getNewEmpInsertCnt(fileUpDTO); } catch (Exception e) {
	 * 
	 * System.out.println("�삁�쇅 諛쒖깮=>" + e); }
	 * 
	 * return newEmpInsertCnt; }
	 */

	// -----------------------------------------------------------------------------------
	// 다중 파일 업로드
	// ------------------------------------------------------------------------------------
	@RequestMapping(value = "/onlyFileUpload.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int onlyFileUpload(OnlyFileListDTO onlyFileListDTO, FileUpDTO fileUpDTO, MultipartHttpServletRequest multi,
			@RequestParam("uploadBtn") MultipartFile[] file

	) throws IllegalStateException, IOException {
		int newEmpInsertCnt1 = 0;

		// String profilePath = "C:/stu_2020.02.12_KSJ/z_spring/WebContent/WEB-INF/resources/imagecollection/";
		String profilePath = "C:/imagecollection/";

		File dir = new File(profilePath);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		List<MultipartFile> mf = multi.getFiles("uploadBtn");

		if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {

		} else {

			for (int i = 0; i < mf.size(); i++) {

				// 파일 중복명 처리
				String genId = UUID.randomUUID().toString();
				// 蹂몃옒 �뙆�씪紐�
				String originalfileName = mf.get(i).getOriginalFilename();
				originalfileName = originalfileName.trim().toLowerCase().replaceAll(" ", "");
				int position = originalfileName.lastIndexOf(".");
				String saveFileName = genId + originalfileName.substring(position);
				// File localFile = new File(profilePath + saveFileName);
				String savePath = profilePath + saveFileName;
				mf.get(i).transferTo(new File(savePath));
				long fileSize = mf.get(i).getSize(); // �뙆�씪 �궗�씠利�
				int emp_no = fileUpDTO.getEmp_no();

				HashMap<String, Object> hm = new HashMap<>();
				hm.put("originalfileName", originalfileName);
				hm.put("saveFileName", saveFileName);
				hm.put("fileSize", fileSize);

				newEmpInsertCnt1 = this.boardService.getNewEmpInsertCnt1(hm);

				System.out.println("111=====" + newEmpInsertCnt1);
			}

		}

		return newEmpInsertCnt1;

	}

	@RequestMapping(value = "/newEmpInfoProc", method = RequestMethod.POST)
	public String newEmpInfoProc(FileUpDTO fileUpDTO) {
		int newEmpInsertCnt = 0;
		newEmpInsertCnt = this.boardService.getNewEmpInsertCnt(fileUpDTO);

		/*
		 * List<Map<String, Integer>> emp_no1=this.boardService.getEmp_noForFile(fileUpDTO);
		 * 
		 * System.out.println(emp_no1); //ileUpDTO.setEmp_no( );
		 */

		if (newEmpInsertCnt > 0) {

			return "forward:/onlyFileUpload.do";
		}

		return "forward:/onlyFileUpload.do";

	}

	// --------------------------------------------------------
	// 파일리스트
	// ---------------------------------------------------------
	@RequestMapping(value = "/fileListForm.do")
	public ModelAndView getBoardList(FileUpDTO fileUpDTO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("fileListForm.jsp");

		try {

			int fileListAllCnt = this.boardService.getFileListAllCnt();

			List<Map<String, String>> fileList = this.boardService.getFileList(fileUpDTO);
			// System.out.println("boardList.size() : " + boardList.size() );

			mav.addObject("fileListAllCnt", fileListAllCnt);
			mav.addObject("fileList", fileList);

			// System.out.println("fileList.size() : " + fileList.size() );

		} catch (Exception e) {

			System.out.println(e.getMessage());

			System.out.println("<�뿉�윭諛쒖깮>");
		}

		return mav;
	}

	@RequestMapping(value = "/fileContentForm.do")
	public ModelAndView goFileContentForm(@RequestParam(value = "emp_no") int emp_no, @RequestParam(value = "count_no") int count_no,
			@RequestParam(value = "file_cnt") int file_cnt, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("fileContentForm.jsp");
		try {

			session.setAttribute("uri", "fileform.do");

			FileUpDTO fileUpDTO = this.boardService.getFileUpDTO(emp_no, file_cnt);

			List<Object> fileName = this.boardService.getFileName(emp_no);
			List<Object> temp_name = this.boardService.gettemp_name(emp_no);

			mav.addObject("temp_name", temp_name);
			mav.addObject("fileName", fileName);
			mav.addObject("count_no", count_no);
			mav.addObject("file_cnt", file_cnt);
			mav.addObject("fileUpDTO", fileUpDTO);

		} catch (Exception e) {
			System.out.println(e.getMessage());

		}
		return mav;
	}

	// 엑셀 저장 현재페이지
	@RequestMapping(value = "/excelForm.do")
	public ModelAndView goToExcelForm(BoardSearchDTO boardSearchDTO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("excelForm.jsp");

		int boardListAllCnt = 0;

		try {

			List<Map<String, String>> excelBoardList = this.boardService.getExcelBoardList(boardSearchDTO);
			// 寃뚯떆�뙋 珥� 媛쒖닔 �뼸湲�
			boardListAllCnt = this.boardService.getBoardListAllCnt(boardSearchDTO);
			mav.addObject("excelBoardList", excelBoardList);
			mav.addObject("boardListAllCnt", boardListAllCnt);

		} catch (Exception e) {

			System.out.println(e.getMessage());

			System.out.println("<�뿉�윭諛쒖깮>");
		}

		return mav;
	}

	/*
	 * 
	 * //새글 쓰기
	 * 
	 * @RequestMapping( value="/filedown.do" ) public ModelAndView goFiledown(
	 * 
	 * @RequestParam( value="emp_pic" ) String emp_pic ,HttpServletResponse response ) { // [ModelAndView 객체] 생성하기. // [ModelAndView 객체] 에 [호출 JSP
	 * 페이지명]을 저장하기. ModelAndView mav = new ModelAndView(); mav.setViewName("filedown.jsp");
	 * 
	 * try { mav.addObject("emp_pic",emp_pic);
	 * 
	 * 
	 * }catch(Exception e) { System.out.println(e.getMessage());
	 * 
	 * System.out.println("<에러발생>");
	 * 
	 * } return mav; }
	 */

	@RequestMapping(value = "/filedown.do")
	public void fileDownload(HttpServletResponse response, HttpServletRequest request, @RequestParam Map<String, String> paramMap) {

		String path = paramMap.get("filePath"); // 경로
		String fileName = paramMap.get("fileName"); // 파일명
		File file = new File(path);

		FileInputStream fileInputStream = null;
		ServletOutputStream servletOutputStream = null;

		try {
			String downName = null;
			String browser = request.getHeader("User-Agent");
			// 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {// 釉뚮씪�슦�� �솗�씤 �뙆�씪紐� encode

				downName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");

			} else {

				downName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");

			}

			response.setHeader("Content-Disposition", "attachment;filename=\"" + downName + "\"");
			response.setContentType("application/octer-stream");
			response.setHeader("Content-Transfer-Encoding", "binary;");

			fileInputStream = new FileInputStream(file);
			servletOutputStream = response.getOutputStream();

			byte b[] = new byte[1024];
			int data = 0;

			while ((data = (fileInputStream.read(b, 0, b.length))) != -1) {

				servletOutputStream.write(b, 0, data);

			}

			servletOutputStream.flush();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (servletOutputStream != null) {
				try {
					servletOutputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (fileInputStream != null) {
				try {
					fileInputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	// --------------------------------------------------------
	// 파일삭제 이름만 삭제/폴더에선 삭제 안함
	// ---------------------------------------------------------
	@RequestMapping(value = "/filetDelProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
	@ResponseBody
	public int deleteFile(@RequestParam(value = "emp_password") String emp_password, @RequestParam(value = "emp_no") String emp_no) {
		int deleteFileCnt = 0;
		Map<String, String> map = new HashMap<String, String>();

		System.out.println("emp_no" + emp_no);
		map.put("emp_password", emp_password);
		map.put("emp_no", emp_no);

		try {

			deleteFileCnt = this.boardService.deleteFile(map);
		} catch (Exception e) {

			System.out.println("<�뿉�윭諛쒖깮>");
			System.out.println(e.getMessage());

			deleteFileCnt = -1;
		}
		return deleteFileCnt;
	}

	// 엑셀 저장 전체 페이지
	@RequestMapping(value = "/goToExcelAllForm.do")
	public ModelAndView goToExcelAllForm(BoardSearchDTO boardSearchDTO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("excelAllForm.jsp");

		int boardListAllCnt = 0;

		try {

			List<Map<String, String>> excelAllBoardList = this.boardService.getExcelAllBoardList(boardSearchDTO);
			// 寃뚯떆�뙋 珥� 媛쒖닔 �뼸湲�
			boardListAllCnt = this.boardService.getBoardListAllCnt(boardSearchDTO);
			mav.addObject("excelAllBoardList", excelAllBoardList);
			mav.addObject("boardListAllCnt", boardListAllCnt);

		} catch (Exception e) {

			System.out.println(e.getMessage());

			System.out.println("<�뿉�윭諛쒖깮>");
		}

		return mav;
	}

}