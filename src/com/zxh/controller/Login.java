package com.zxh.controller;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.zxh.mapper.UserMapper;
import com.zxh.po.User;
/**
 * @author  ZhaoXiangHeng
 * @2019年6月9日
 * @TODO	登录控制器类
 */
@Controller
public class Login {
	@Autowired
	private UserMapper userMapper;
	@RequestMapping("login")
	public String loginString(User user, HttpSession session, Model model) {
		System.out.println(user);
		String username = user.getUsername().trim();
		String password = user.getPassword().trim();
		User user2 = new User();
		user2.setUsername(username);
		user2.setPassword(password);
		if (userMapper.findUser(user2) != null) {
			// 增加session
			session.setAttribute("USER_SESSION", user2);
			return "redirect:list";
		} else {
			model.addAttribute("msg", "账号或密码错误");
			return "login";
		}
	}
	/**
	 * @param session
	 * @return
	 * @TODO 退出登录
	 */
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		// 清除session
		session.invalidate();
		// 重新定向到登录页面
		return "redirect:tologin";
	}
	/**
	 * @return
	 * @TODO 向登录界面跳转
	 */
	@RequestMapping("/tologin")
	public String toLogin() {
		return "login";
	}
}
