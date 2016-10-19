package com.test.ddy.model;

public class Triple {
	private Integer id;
	private String arg1;
	private String rel;
	private String arg2;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getArg1() {
		return arg1;
	}
	public void setArg1(String arg1) {
		this.arg1 = arg1;
	}
	public String getRel() {
		return rel;
	}
	public void setRel(String rel) {
		this.rel = rel;
	}
	public String getArg2() {
		return arg2;
	}
	public void setArg2(String arg2) {
		this.arg2 = arg2;
	}
	@Override
	public String toString() {
		return "Triple [id=" + id + ", arg1=" + arg1 + ", rel=" + rel
				+ ", arg2=" + arg2 + "]";
	}
	
}
