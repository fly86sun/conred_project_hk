package com.hk.conred.daos;

import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.SLocaDto;

public interface ISLocaDao {
	public boolean insertSLoca(SDto sdto, SLocaDto slocadto);
	public boolean updateSLoca(SDto sdto, SLocaDto slocadto);
}
