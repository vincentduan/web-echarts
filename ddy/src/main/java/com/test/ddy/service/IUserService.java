package com.test.ddy.service;

import java.util.List;

import com.test.ddy.model.User;

public interface IUserService {
	public User getUserById(int userId);

	public List<User> getUserList();

	public void delUserById(Integer userId);
}
