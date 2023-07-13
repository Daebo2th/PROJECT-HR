package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.CodeTableDAO;
import com.kosa.hrsystem.dao.VacationDAO;
import com.kosa.hrsystem.dto.CodeTableDTO;
import com.kosa.hrsystem.dto.VacationTypeDTO;
import com.kosa.hrsystem.vo.VacationTypeVO;
import com.kosa.hrsystem.vo.VacationVO;

public class VacationServiceImp implements VacationService {

	@Override
	public ActionForward selectAllVacation(HttpServletRequest request, HttpServletResponse response) {
		VacationDAO dao = new VacationDAO();
		try {
			List<VacationVO> list = dao.selectAllVacation();
			
			request.setAttribute("list", list);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/vacation/vacationView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	@Override
	public ActionForward selectAllType(HttpServletRequest request, HttpServletResponse response) {
		VacationDAO dao = new VacationDAO();
		try {
			List<VacationTypeDTO> list = dao.selectAll();

			request.setAttribute("list", list);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/vacationType/vacationTypeView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public ActionForward insertType(HttpServletRequest request, HttpServletResponse response) {
		String vctnName = request.getParameter("vctn_name");
		int vctnTime = Integer.parseInt(request.getParameter("vctn_time"));
		double deductionDay = Double.parseDouble(request.getParameter("deduction_day"));

		VacationTypeDTO dto = new VacationTypeDTO();
		dto.setVctn_name(vctnName);
		dto.setVctn_time(vctnTime);
		dto.setDeduction_day(deductionDay);

		VacationDAO dao = new VacationDAO();
		try {
			dao.insertVctnType(dto);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/vacationtype.do");
		return forward;
	}

	@Override
	public ActionForward updateType(HttpServletRequest request, HttpServletResponse response) {
		int vctnNum = Integer.parseInt(request.getParameter("vctn_type_num"));
		String vctnName = request.getParameter("vctn_name");
		int vctnTime = Integer.parseInt(request.getParameter("vctn_time"));
		double deductionDay = Double.parseDouble(request.getParameter("deduction_day"));

		VacationTypeDTO dto = new VacationTypeDTO();
		dto.setVctn_type_num(vctnNum);
		dto.setVctn_name(vctnName);
		dto.setVctn_time(vctnTime);
		dto.setDeduction_day(deductionDay);

		VacationDAO dao = new VacationDAO();
		try {
			dao.updateVctnType(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/vacationtype.do");
		return forward;
	}

	@Override
	public ActionForward deleteType(HttpServletRequest request, HttpServletResponse response) {
		int vctn_type_num = Integer.parseInt(request.getParameter("vctn_type_num"));

		VacationDAO dao = new VacationDAO();
		try {
			dao.deleteVctnType(vctn_type_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/vacationtype.do");
		return forward;
	}
}