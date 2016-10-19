package com.test.ddy.service;

import java.util.List;

import com.test.ddy.dto.TripleVo;
import com.test.ddy.model.Triple;

public interface TripleService {
	public List<Triple> getTripleList();

	public TripleVo getTripleVo();
}
