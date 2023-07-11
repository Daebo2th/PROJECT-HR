package com.kosa.hrsystem.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.VacationDAO;
import com.kosa.hrsystem.dto.VacationTypeDTO;

public class VacationTypeOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String vctnName = request.getParameter("vctn_name");
		String dept = request.getParameter("dept");
		String rank = request.getParameter("rank");
		int vctnTime = Integer.parseInt(request.getParameter("vctn_time"));
		double deductionDay = Double.parseDouble(request.getParameter("deduction_day"));
		
		VacationTypeDTO dto = new VacationTypeDTO();
		dto.setVctn_name(vctnName);
		dto.setDept(dept);
		dto.setRank(rank);
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

}