package a.b.c.com.emp.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import a.b.c.com.emp.service.EmpService;
import a.b.c.com.emp.vo.EmpVO;

@Controller
public class EmpController {

	private Logger logger = Logger.getLogger(EmpController.class);
	
	// 컨트롤러에서 서비스 연결
	private EmpService empService;
	
	// 생성자에 @Autowired 어노테이션으로 DI(의존성 주입) 하기
	@Autowired(required=false)
	public EmpController(EmpService empService) {
		this.empService = empService;
	}
	
	@RequestMapping(value="empSelectAll", method=RequestMethod.GET)
	public String empSelectAll(Model model) {
		logger.info("EmpController empSelectAll 함수 진입 >>> : ");
		
		List<EmpVO> listAll = empService.empSelectAll();
		int nCnt = listAll.size();
		logger.info("EmpController empSelectAll nCnt >>> : " + nCnt);
		
		if (nCnt > 0) {
			model.addAttribute("listAll", listAll);
			return "emp/empSelectAll";
		}
		
		return "emp/empForm";
	}
	
}
