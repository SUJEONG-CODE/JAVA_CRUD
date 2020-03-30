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

	// �냽�꽦蹂��닔 boardService �꽑�뼵�븯怨� [BoardService �씤�꽣�럹�씠�뒪]瑜� 援ы쁽諛쏆� 媛앹껜瑜� �깮�꽦�빐 ���옣.
	// 愿��슜�쟻�쑝濡� [BoardService �씤�꽣�럹�씠�뒪]瑜� 援ы쁽諛쏆� 媛앹껜紐낆� boardServiceImpl �씠�떎.
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/boardListForm.do")
	public ModelAndView getBoardList(BoardSearchDTO boardSearchDTO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardListForm.jsp");

		try {

			// HttpSession 媛앹껜�뿉 uri �씪�뒗 �궎媛믪쑝濡� ���옣�맂 臾몄옄�뿴 爰쇰궡湲�.
			String uri = (String) session.getAttribute("uri");
			// 留뚯빟 爰쇰궦 臾몄옄�뿴�씠 null�씠嫄곕굹 "boardListForm"�씠�씪硫� 留ㅺ컻蹂��닔濡� 諛쏆� BoardSearchDTO 媛앹껜瑜� HttpSession 媛앹껜�뿉
			// boardSearchDTO �씪�뒗 �궎媛믪쑝濡� ���옣�븯湲�.
			if (uri == null || uri.equals("boardListForm.do")) {
				session.setAttribute("boardSearchDTO", boardSearchDTO);
			} else {
				boardSearchDTO = (BoardSearchDTO) session.getAttribute("boardSearchDTO");
			}
			session.setAttribute("uri", "boardListForm.do");

			// 寃뚯떆�뙋 珥� 媛쒖닔 �뼸湲�
			int boardListAllCnt = this.boardService.getBoardListAllCnt(boardSearchDTO);
			int fileListBoardAllCnt = this.boardService.getFileListBoardAllCnt();

			// [ �꽑�깮�맂 �럹�씠吏� 踰덊샇 ] 蹂댁젙�븯湲�.
			// [ �꽑�깮�맂 �럹�씠吏� 踰덊샇 ]�� 珥� 媛쒖닔 媛꾩쓽 愿�怨꾧� �씠�긽�븷 寃쎌슦 議댁옱.
			// ex) 寃��깋 珥� 媛쒖닔媛� 3媛� �씤�뜲 �꽑�깮�럹�씠吏�踰덊샇媛� 2�럹�씠吏� �씪寃쎌슦 (�떒 蹂댁뿬吏� �뻾�쓽 媛쒖닔媛� 10媛� �씪 �븣 ) 紐⑥닚�씠�떎.
			// 2�럹�씠吏��씪硫� 11�뻾 遺��꽣 20�뻾 源뚯� 吏ㅻ씪�꽌 媛��졇�삤�� �씠�빞湲� �씤�뜲
			// �쁽�옱 3�뻾諛뽰뿉 �뾾�뒗�뜲 �뼱�뼸寃� 媛��졇�삤�뒗吏� �쓽臾�
			if (boardListAllCnt > 0) {
				// �꽑�깮�븳 �럹�씠吏� 踰덊샇 援ы븯湲�
				int selectPageNo = boardSearchDTO.getSelectPageNo();
				// �븳 �솕硫댁뿉 蹂댁뿬吏��뒗 �뻾�쓽 媛쒖닔 援ы븯湲�
				int rowCntPerPage = boardSearchDTO.getRowCntPerPage();
				// 寃��깋�븷 �떆�옉�뻾 踰덊샇 援ы븯湲�
				int beginRowNo = selectPageNo * rowCntPerPage - rowCntPerPage + 1;
				// 寃��깋�븳 珥� 媛��닔蹂대떎 寃��깋�븷 �떆�옉�뻾�쓽 踰덊샇媛� �겕硫�
				if (beginRowNo > boardListAllCnt) {
					// �꽑�깮�븳 �럹�씠吏� 踰덊샇瑜� '1'濡� 珥덇린�솕 �빐以�.
					boardSearchDTO.setSelectPageNo(1);
				}
			}

			// System.out.println("boardListAllCnt : " + boardListAllCnt);

			// 寃뚯떆�뙋 紐⑸줉 �뼸湲�

			List<Map<String, String>> boardList = this.boardService.getBoardList(boardSearchDTO);
			// System.out.println("boardList.size() : " + boardList.size() );

			// ModelAndView 媛앹껜�뿉 寃��깋 媛쒖닔, 寃뚯떆�뙋 寃��깋 紐⑸줉 ���옣�븯湲�
			// ModelAndView 媛앹껜�뿉 ���옣�맂 DB �뿰�룞 寃곌낵臾쇱� JSP �럹�씠吏��뿉�꽌 EL 臾몃쾿�쑝濡� �븘�옒 泥섎읆 爰쇰궪 �닔 �엳�떎.
			// ModelAndView 媛앹껜�뿉 ���옣�맂 �뜲�씠�꽣 爰쇰궪 �븣 �넂 ${���옣 �궎媛� 紐�}
			// addObject("�궎 媛믩챸",蹂��닔紐�);
			mav.addObject("boardList", boardList);
			mav.addObject("boardListAllCnt", boardListAllCnt);
			mav.addObject("fileListBoardAllCnt", fileListBoardAllCnt);
			mav.addObject("boardSearchDTO", boardSearchDTO);

			System.out.println(boardListAllCnt);

		} catch (Exception e) {
			// try 援щЦ�뿉�꽌 �삁�쇅媛� 諛쒖깮�븯硫� �떎�뻾�븷 援щЦ �꽕�젙
			System.out.println(e.getMessage());

			System.out.println("<�뿉�윭諛쒖깮>");
		}
		// [ModelAndView 媛앹껜] 由ы꽩�븯湲�
		return mav;
	}

	// �깉湲� �벐湲�
	@RequestMapping(value = "/boardRegForm.do")
	public ModelAndView goBoardRegForm() {
		// [ModelAndView 媛앹껜] �깮�꽦�븯湲�.
		// [ModelAndView 媛앹껜] �뿉 [�샇異� JSP �럹�씠吏�紐�]�쓣 ���옣�븯湲�.
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

				// �뙆�씪 以묐났紐� 泥섎━
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
	 * @RequestMapping( value="/boardRegProc.do" //�젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 URL 二쇱냼 �꽕�젙 , method=RequestMethod.POST //�젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 �뙆�씪誘명꽣媛�
	 * �쟾�넚 諛⑸쾿 , produces="application/json;carset=UTF-8" //�쓳�떟�븷 �뜲�씠�꽣 醫낅쪟 : json �쑝濡� �꽕�젙 )
	 * 
	 * @ResponseBody public int insertBoard( //============================================= // �뙆�씪誘명꽣媛믪쓣 ���옣�븷 BoardDTO 媛앹껜 瑜� 留ㅺ컻蹂��닔濡� �꽑�뼵
	 * //============================================= BoardDTO BoardDTO) { int boardRegCnt = 0; System.out.println(BoardDTO.getB_no()); try { //[
	 * BoardServiceImpl 媛앹껜 ]�쓽 insertBoard 硫붿냼�뱶 �샇異쒕줈 寃뚯떆�뙋 �엯�젰�븯怨� [寃뚯떆�뙋 �엯�젰] �쟻�슜�뻾�쓽 媛쒖닔 �뼸湲�. //System.out.println(BoardDTO.getContent());
	 * //System.out.println(BoardDTO.getPwd()); //System.out.println(BoardDTO.getReadcount());
	 * 
	 * //System.out.println(BoardDTO.getSubject()); boardRegCnt = this.boardService.insertBoard(BoardDTO);
	 * 
	 * System.out.println("boardRegCnt�뒗 "+boardRegCnt);
	 * 
	 * }catch(Exception e) { System.out.println(e.getMessage());
	 * 
	 * System.out.println("<�뿉�윭諛쒖깮>"); boardRegCnt = -1; } return boardRegCnt; }
	 */

	// method=RequestMethod.GET , method=RequestMethod.POST
	// �쐞�쓽 肄붾뵫�쓣 �옉�꽦�븯硫� 臾댁“嫄� �븳媛�吏� 諛⑹떇�쓽 �쟾�넚 諛⑹떇�쓣 �꽕�젙�븯�뒗 肄붾뵫�씠�씪�꽌 �옉�꽦�븳 諛⑸쾿�쑝濡쒕컰�뿉 �넻�떊�씠 遺덇��뒫�븯�떎.
	@RequestMapping(value = "/boardContentForm.do")
	public ModelAndView goBoardContentForm(
			// b_no �씪�뒗 �뙆�씪誘명꽣紐낆뿉 �빐�떦�븯�뒗 �뙆�씪誘명꽣媛믪씠 ���옣�릺�뒗 留ㅺ컻蹂��닔 b_no �꽑�뼵
			// 愿��슜�쟻�쑝濡� �뙆�씪誘명꽣紐낃낵 �뙆�씪誘명꽣媛믪� �뒪�렆留곸� �룞�씪�븯寃� 以��떎.
			// 寃뚯떆�뙋 PK 踰덊샇媛� 留ㅺ컻蹂��닔濡� �뱾�뼱�삤誘�濡� 留ㅺ컻蹂��닔 �옄猷뚰삎�� int 濡� �븳�떎.
			// String�쑝濡� 諛쏆븘�룄 臾몄젣 �뾾�떎.
			@RequestParam(value = "b_no") int b_no
			/* ,@RequestParam( value="admin_id[]" ) String[] admin_id */
			, @RequestParam(value = "file_cnt") int file_cnt, @RequestParam(value = "listNum") int listNum,
			@RequestParam(value = "group_no") int group_no, HttpSession session) {
		// ModelAndView 媛앹껜 �깮�꽦�븯湲�
		// ModelAndView 媛앹껜 �뿉 �샇異� JSP �럹�씠吏�紐� ���옣�븯湲�.
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardContentForm.jsp");

		try {

			// ???????????
			session.setAttribute("uri", "boardContentForm.do");
			// ----------------------------------------------------------
			// [ BoardServiceImpl 媛앹껜 ]�쓽 getBoardDTO 硫붿냼�뱶 �샇異쒕줈
			// 1媛쒖쓽 寃뚯떆�뙋 湲��쓣 BoardDTO 媛앹껜�뿉 �떞�븘�삤湲�
			// ----------------------------------------------------------
			System.out.println("goBoardContentForm�떆�옉");

			Map<String, Integer> mapContent = new HashMap<String, Integer>();
			mapContent.put("b_no", b_no);
			mapContent.put("group_no", group_no);
			System.out.println(group_no);

			BoardDTO boardDTO = this.boardService.getBoardDTO(mapContent);

			// �뙎湲� 由ъ뒪�듃�� 珥앷컻�닔 �뼸�뼱�삤湲�-----------------------
			// System.out.println("commentDTO 而⑦듃濡ㅻ윭 �떆�옉");

			List<Map<String, String>> commentDTO = this.boardService.getCommentDTO(b_no);
			int commentListAllCnt = this.boardService.getCommentListAllCnt(b_no);

			List<Object> onlyFileName = this.boardService.getOnlyFileName(b_no);
			List<Object> onlyTempName = this.boardService.getOnlytemp_name(b_no);

			// ---------------------------------------------------------------

			// System.out.println("boardDTO = "+boardDTO + "�뿰�룞�릺�뿀�뒿�땲�떎." );

			// ----------------------------------------------------------
			// [ ModelAndView 媛앹껜 ]�뿉 1媛쒖쓽 寃뚯떆�뙋 湲��쓣 �떞怨� �엳�뒗 BoardDTO 媛앹껜 ���옣�븯湲�.
			// ----------------------------------------------------------
			mav.addObject("boardDTO", boardDTO);
			mav.addObject("commentDTO", commentDTO);
			mav.addObject("commentListAllCnt", commentListAllCnt);
			mav.addObject("file_cnt", file_cnt);
			mav.addObject("onlyFileName", onlyFileName);
			mav.addObject("onlyTempName", onlyTempName);
			System.out.println("boardContentForm  출력");

		} catch (Exception e) {

			System.out.println("BoardController_/boardContentForm.do �뿉�꽌 <�뿉�윭諛쒖깮>");
			System.out.println(e.getMessage());

		}
		return mav;
	}

	// ************************************************************************
	// /boardUpDelForm.do �젒�냽 �떆 �샇異쒕릺�뒗 硫붿냼�뱶 �꽑�뼵.
	// ************************************************************************
	@RequestMapping(value = "/boardUpDelForm.do", method = RequestMethod.POST)
	// "b_no" �씪�뒗 �뙆�씪誘명꽣紐낆쓽 �뙆�씪誘명꽣媛믪씠 ���옣�릺�뒗 留ㅺ컻蹂��닔 b_no �꽑�뼵
	public ModelAndView goBoardUpDelForm(@RequestParam(value = "b_no") int b_no, HttpSession session) {

		// try~catch 援щЦ�븞�뿉 �옉�꽦�븯硫� 吏��뿭蹂��닔 �삎�깭濡� �꽑�뼵�릺湲� �븣臾몄뿉 釉붾윮�븞�뿉�꽌留� �궗�슜 媛��뒫�븯�떎.. �뵲�씪�꽌 諛뽰뿉 �옉�꽦.
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardUpDelForm.jsp");
		try {

			session.setAttribute("uri", "boardUpDelForm.do");

			// ***********************************
			// [�닔�젙/�궘�젣�븷 1媛쒖쓽 寃뚯떆�뙋 湲� �젙蹂�] �뼸湲�.
			// ***********************************
			// [BoardServiceImpl 媛앹껜]�쓽 getBoardDTO_without_upReadcount 硫붿냼�뱶瑜� �샇異쒗븯�뿬 �뼸�뒗�떎.
			BoardDTO boardDTO = this.boardService.getBoardDTO_without_upReadcount(b_no);

			List<Object> onlyFileName = this.boardService.getOnlyFileName(b_no);
			List<Object> onlyTempName = this.boardService.getOnlytemp_name(b_no);

			mav.addObject("onlyFileName", onlyFileName);
			mav.addObject("onlyTempName", onlyTempName);

			mav.addObject("boardDTO", boardDTO);

			System.out.println(onlyFileName.get(0));

			// System.out.println("<�젒�냽�꽦怨�> [�젒�냽 URL]->/boardUpDelForm.do [쒕찓�냼�뱶] -> BoardController.goBoardUpDelForm(~) \n\n\n");

		} catch (Exception e) {
			// �삁�쇅 諛쒖깮 �떆 �떎�뻾�븷 肄붾뱶 �꽕�젙.
			System.out.println("<�젒�냽�떎�뙣> [�젒�냽 URL]->/boardUpDelForm.do [�샇異쒕찓�냼�뱶] -> BoardController.goBoardUpDelForm(~) \n\n\n");
		}
		return mav;
	}

	// /boardUpDelProc.do �젒�냽 �떆 �샇異쒕릺�뒗 硫붿냼�뱶 �꽑�뼵.
	@RequestMapping(value = "/boardUpDelProc.do" // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 URL 二쇱냼 �꽕�젙
			, method = RequestMethod.POST // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 �뙆�씪誘명꽣媛� �쟾�넚 諛⑸쾿
			, produces = "application/json;carset=UTF-8" // �쓳�떟�븷 �뜲�씠�꽣 醫낅쪟 : json �쑝濡� �꽕�젙
	)
	@ResponseBody
	public int boardUpDelProc(
			// =============================================
			// �뙆�씪誘명꽣媛믪쓣 ���옣�븷 BoardDTO 媛앹껜 瑜� 留ㅺ컻蹂��닔濡� �꽑�뼵
			// =============================================
			@RequestParam(value = "upDel") String upDel, BoardDTO boardDTO, MultipartHttpServletRequest multi,
			@RequestParam("uploadBtn") MultipartFile[] file) {
		// =============================================
		// �닔�젙 �삉�뒗 �궘�젣 �쟻�슜�뻾�쓽 媛쒖닔媛� ���옣�릺�뒗 蹂��닔 �꽑�뼵.
		// =============================================
		int boardUpDelCnt = 0;
		int UpdeleteFileBoardCnt = 0;
		int newEmpInsertCnt1 = 0;
		System.out.println("boardUpDelProc �떆�옉");
		try {
			// =============================================
			// 留뚯빟 �닔�젙紐⑤뱶�씠硫� �닔�젙 �떎�뻾�븯怨� �닔�젙 �쟻�슜�뻾�쓽 媛쒖닔瑜� ���옣.
			// =============================================
			if (upDel.equals("up")) {
				boardUpDelCnt = this.boardService.updateBoard(boardDTO);
				System.out.println(boardUpDelCnt);
				if (boardUpDelCnt > 0) {

					for (int i = 0; i < boardDTO.getOnlyTempName().length; i++) {

						String path = "C:/imagecollection/";
						String temp_nameDel = boardDTO.getOnlyTempName()[i];
						File fileDel = new File(path + temp_nameDel);
						if (fileDel.exists() == true) {
							fileDel.delete();
						}
					}

					// UpdeleteFileBoardCnt=this.boardService.updateFileBoard(boardDTO);
					UpdeleteFileBoardCnt = this.boardService.deleteFileBoard(boardDTO);
					System.out.println("UpdeleteFileBoardCnt?" + UpdeleteFileBoardCnt);

					if (UpdeleteFileBoardCnt > 0) {

						// String profilePath = "C:/stu_2020.02.12_KSJ/z_spring/WebContent/WEB-INF/resources/imagecollection/";
						String profilePath = "C:/imagecollection/";
						File dir = new File(profilePath);
						if (!dir.isDirectory()) {
							dir.mkdir();
						}

						List<MultipartFile> mf = multi.getFiles("uploadBtn");

						/*
						 * for (int i = 0; i < boardDTO.getOnlyFileName().length; i++) {
						 * 
						 * String temp_nameUp = boardDTO.getOnlyFileName[i]; mf.add(temp_nameUp); }
						 */

						System.out.println(mf);

						if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {

						} else {

							for (int i = 0; i < mf.size(); i++) {

								// �뙆�씪 以묐났紐� 泥섎━
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
								int emp_no = boardDTO.getB_no();

								HashMap<String, Object> hm = new HashMap<>();
								hm.put("originalfileName", originalfileName);
								hm.put("saveFileName", saveFileName);
								hm.put("fileSize", fileSize);

								newEmpInsertCnt1 = this.boardService.getNewEmpInsertCnt2(hm);

							}

						}
					} else {

						// String profilePath = "C:/stu_2020.02.12_KSJ/z_spring/WebContent/WEB-INF/resources/imagecollection/";
						String profilePath = "C:/imagecollection/";

						File dir = new File(profilePath);
						if (!dir.isDirectory()) {
							dir.mkdir();
						}

						List<MultipartFile> mf = multi.getFiles("uploadBtn");
						System.out.println(mf);

						if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {

						} else {

							for (int i = 0; i < mf.size(); i++) {

								// �뙆�씪 以묐났紐� 泥섎━
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
								int emp_no = boardDTO.getB_no();

								HashMap<String, Object> hm = new HashMap<>();
								hm.put("originalfileName", originalfileName);
								hm.put("saveFileName", saveFileName);
								hm.put("fileSize", fileSize);

								newEmpInsertCnt1 = this.boardService.getNewEmpInsertCnt2(hm);

							}

						}

					}

					System.out.println(newEmpInsertCnt1);

				}
				// =============================================
				// 留뚯빟 �궘�젣紐⑤뱶�씠硫� �궘�젣 �떎�뻾�븯怨� �궘�젣 �쟻�슜�뻾�쓽 媛쒖닔瑜� ���옣.
				// =============================================
			} else {
				System.out.println("<deleteBoard 而⑦듃濡ㅻ윭>");
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
		// �닔�젙 �삉�뒗 �궘�젣 �쟻�슜�뻾�쓽 媛쒖닔 由ы꽩
		return boardUpDelCnt;
	}

	// --------------------------------------------------------
	// �뙆�씪�뾽濡쒕뱶
	// ---------------------------------------------------------

	@RequestMapping(value = "/fileForm.do")
	public ModelAndView goFileForm() {
		// [ModelAndView 媛앹껜] �깮�꽦�븯湲�.
		// [ModelAndView 媛앹껜] �뿉 [�샇異� JSP �럹�씠吏�紐�]�쓣 ���옣�븯湲�.
		ModelAndView mav = new ModelAndView();
		mav.setViewName("fileForm.jsp");
		return mav;
	}

	// --------------------------------------------------------
	// �뙎湲��벑濡�
	// ---------------------------------------------------------
	@RequestMapping(value = "/comentRegProc.do" // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 URL 二쇱냼 �꽕�젙
			, method = RequestMethod.POST // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 �뙆�씪誘명꽣媛� �쟾�넚 諛⑸쾿
			, produces = "application/json;carset=UTF-8" // �쓳�떟�븷 �뜲�씠�꽣 醫낅쪟 : json �쑝濡� �꽕�젙
	)
	@ResponseBody
	public int insertComment(
			// =============================================
			// �뙆�씪誘명꽣媛믪쓣 ���옣�븷 BoardDTO 媛앹껜 瑜� 留ㅺ컻蹂��닔濡� �꽑�뼵
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
			// [ BoardServiceImpl 媛앹껜 ]�쓽 insertBoard 硫붿냼�뱶 �샇異쒕줈 寃뚯떆�뙋 �엯�젰�븯怨� [寃뚯떆�뙋 �엯�젰] �쟻�슜�뻾�쓽 媛쒖닔 �뼸湲�.

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
	// �뙎湲��궘�젣
	// ---------------------------------------------------------
	@RequestMapping(value = "/comentDelProc.do" // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 URL 二쇱냼 �꽕�젙
			, method = RequestMethod.POST // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 �뙆�씪誘명꽣媛� �쟾�넚 諛⑸쾿
			, produces = "application/json;carset=UTF-8" // �쓳�떟�븷 �뜲�씠�꽣 醫낅쪟 : json �쑝濡� �꽕�젙
	)
	@ResponseBody
	public int deleteComment(
			// =============================================
			// �뙆�씪誘명꽣媛믪쓣 ���옣�븷 BoardDTO 媛앹껜 瑜� 留ㅺ컻蹂��닔濡� �꽑�뼵
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

			// [ BoardServiceImpl 媛앹껜 ]�쓽 insertBoard 硫붿냼�뱶 �샇異쒕줈 寃뚯떆�뙋 �엯�젰�븯怨� [寃뚯떆�뙋 �엯�젰] �쟻�슜�뻾�쓽 媛쒖닔 �뼸湲�.

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
	// 湲� �닔�젙�떆 鍮꾨�踰덊샇 �솗�씤�븯�뒗 李� �쁽�옱�뒗 �궗�슜 �븞�븿

	@RequestMapping(value = "/checkPwProc.do" // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 URL 二쇱냼 �꽕�젙
			, method = RequestMethod.POST // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 �뙆�씪誘명꽣媛� �쟾�넚 諛⑸쾿
			, produces = "application/json;carset=UTF-8" // �쓳�떟�븷 �뜲�씠�꽣 醫낅쪟 : json �쑝濡� �꽕�젙
	)
	@ResponseBody
	public int insertPwd(
			// =============================================
			// �뙆�씪誘명꽣媛믪쓣 ���옣�븷 BoardDTO 媛앹껜 瑜� 留ㅺ컻蹂��닔濡� �꽑�뼵
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

	// �뙎湲� 鍮꾨쾲 �솗�씤�썑 �궘�젣

	@RequestMapping(value = "/checkPwdComentProc.do" // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 URL 二쇱냼 �꽕�젙
			, method = RequestMethod.POST // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 �뙆�씪誘명꽣媛� �쟾�넚 諛⑸쾿
			, produces = "application/json;carset=UTF-8" // �쓳�떟�븷 �뜲�씠�꽣 醫낅쪟 : json �쑝濡� �꽕�젙
	)
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
	 * //�떒�씪 �뙆�씪 �뾽濡쒕뱶
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
	// �떎以� �뙆�씪 �뾽濡쒕뱶
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

				// �뙆�씪 以묐났紐� 泥섎━
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
	// �뙆�씪由ъ뒪�듃
	// ---------------------------------------------------------

	@RequestMapping(value = "/fileListForm.do")
	public ModelAndView getBoardList(FileUpDTO fileUpDTO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("fileListForm.jsp");

		try {

			int fileListAllCnt = this.boardService.getFileListAllCnt();

			// System.out.println("boardListAllCnt : " + boardListAllCnt);

			// 寃뚯떆�뙋 紐⑸줉 �뼸湲�

			List<Map<String, String>> fileList = this.boardService.getFileList(fileUpDTO);
			// System.out.println("boardList.size() : " + boardList.size() );

			mav.addObject("fileListAllCnt", fileListAllCnt);
			mav.addObject("fileList", fileList);

			// System.out.println("fileList.size() : " + fileList.size() );

		} catch (Exception e) {
			// try 援щЦ�뿉�꽌 �삁�쇅媛� 諛쒖깮�븯硫� �떎�뻾�븷 援щЦ �꽕�젙
			System.out.println(e.getMessage());

			System.out.println("<�뿉�윭諛쒖깮>");
		}
		// [ModelAndView 媛앹껜] 由ы꽩�븯湲�
		return mav;
	}

	@RequestMapping(value = "/fileContentForm.do")
	public ModelAndView goFileContentForm(@RequestParam(value = "emp_no") int emp_no, @RequestParam(value = "count_no") int count_no,
			@RequestParam(value = "file_cnt") int file_cnt, HttpSession session) {
		// ModelAndView 媛앹껜 �깮�꽦�븯湲�
		// ModelAndView 媛앹껜 �뿉 �샇異� JSP �럹�씠吏�紐� ���옣�븯湲�.
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

	// �뿊�� ���옣 �쁽�옱�럹�씠吏�
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
			// try 援щЦ�뿉�꽌 �삁�쇅媛� 諛쒖깮�븯硫� �떎�뻾�븷 援щЦ �꽕�젙
			System.out.println(e.getMessage());

			System.out.println("<�뿉�윭諛쒖깮>");
		}
		// [ModelAndView 媛앹껜] 由ы꽩�븯湲�
		return mav;
	}

	/*
	 * 
	 * //�깉湲� �벐湲�
	 * 
	 * @RequestMapping( value="/filedown.do" ) public ModelAndView goFiledown(
	 * 
	 * @RequestParam( value="emp_pic" ) String emp_pic ,HttpServletResponse response ) { // [ModelAndView 媛앹껜] �깮�꽦�븯湲�. // [ModelAndView 媛앹껜] �뿉
	 * [�샇異� JSP �럹�씠吏�紐�]�쓣 ���옣�븯湲�. ModelAndView mav = new ModelAndView(); mav.setViewName("filedown.jsp");
	 * 
	 * try { mav.addObject("emp_pic",emp_pic);
	 * 
	 * 
	 * }catch(Exception e) { System.out.println(e.getMessage());
	 * 
	 * System.out.println("<�뿉�윭諛쒖깮>");
	 * 
	 * } return mav; }
	 */

	@RequestMapping(value = "/filedown.do")
	public void fileDownload(HttpServletResponse response, HttpServletRequest request, @RequestParam Map<String, String> paramMap) {

		String path = paramMap.get("filePath"); // full寃쎈줈
		String fileName = paramMap.get("fileName"); // �뙆�씪紐�

		File file = new File(path);

		FileInputStream fileInputStream = null;
		ServletOutputStream servletOutputStream = null;

		try {
			String downName = null;
			String browser = request.getHeader("User-Agent");
			// �뙆�씪 �씤肄붾뵫
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

			servletOutputStream.flush();// 異쒕젰

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
	// �뙆�씪�궘�젣
	// ---------------------------------------------------------
	@RequestMapping(value = "/filetDelProc.do" // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 URL 二쇱냼 �꽕�젙
			, method = RequestMethod.POST // �젒�냽�븯�뒗 �겢�씪�씠�뼵�듃�쓽 �뙆�씪誘명꽣媛� �쟾�넚 諛⑸쾿
			, produces = "application/json;carset=UTF-8" // �쓳�떟�븷 �뜲�씠�꽣 醫낅쪟 : json �쑝濡� �꽕�젙
	)
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

	// �뿊�� ���옣 �쟾泥� �럹�씠吏�
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
			// try 援щЦ�뿉�꽌 �삁�쇅媛� 諛쒖깮�븯硫� �떎�뻾�븷 援щЦ �꽕�젙
			System.out.println(e.getMessage());

			System.out.println("<�뿉�윭諛쒖깮>");
		}
		// [ModelAndView 媛앹껜] 由ы꽩�븯湲�
		return mav;
	}

}