package com.test.ddy.service.impl;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.ddy.dao.TripleDao;
import com.test.ddy.dto.Link;
import com.test.ddy.dto.Node;
import com.test.ddy.dto.TripleVo;
import com.test.ddy.model.Triple;
import com.test.ddy.service.TripleService;
@Service
public class TripleServiceImpl implements TripleService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private TripleDao tripleDao;
	@Override
	public List<Triple> getTripleList() {
		logger.debug("queryAll");
		return tripleDao.queryAll();
	}
	@Override
	public TripleVo getTripleVo() {
		List<Triple> triples = tripleDao.queryAll();
		Set<Node> nodes = new HashSet<>();
		List<Link> links = new LinkedList<>();
		for (Triple triple : triples) {
			Node node = new Node();
			Node node2 = new Node();
			Link link = new Link();
			String arg1 = triple.getArg1();
			String arg2 = triple.getArg2();
			String rel = triple.getRel();
			node.setId(arg1);
			node.setName(arg1);
			node.setValue(10);
			nodes.add(node);
			node2.setId(arg2);
			node2.setName(arg2);
			node2.setValue(10);
			nodes.add(node2);
			link.setSource(arg1);
			link.setTarget(arg2);
			link.setRelation(rel);
			links.add(link);
		}
		TripleVo tripleVo = new TripleVo();
		tripleVo.setLinks(links);
		tripleVo.setNodes(nodes);
		return tripleVo;
	}
	
	
}
