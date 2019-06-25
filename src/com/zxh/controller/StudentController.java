package com.zxh.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.zxh.mapper.StudentMapper;
import com.zxh.po.Student;
@Controller
public class StudentController {
	@Autowired
	private StudentMapper studentMapper;
// 查询所有客户信息
	@RequestMapping("list")
	public ModelAndView listStudent() {
		List<Student> stuList = studentMapper.listStudent();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("stuList", stuList);
		modelAndView.setViewName("student");
		return modelAndView;
	}
// 寻找要修改的客户信息
	@RequestMapping("stuEdit")
	@ResponseBody
	/* public ModelAndView stuEdit(Integer id) { */
	public Student stuEdit(Integer id) {
		Student student = studentMapper.findStudentById(id);
		/*
		 * ModelAndView modelAndView = new ModelAndView();
		 * modelAndView.addObject("student",student);
		 * modelAndView.setViewName("stuEdit"); return modelAndView;
		 */
		return student;
	}
//更新客户信息，其中方法参数使用了  POJO类型
	@RequestMapping("stuUpdate")
	@ResponseBody
	public String updateStudent(Student student) {
		/* System.out.println(Student); */
		Integer row = studentMapper.updateStudent(student);
		if (row > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
// 删除客户
	@RequestMapping("stuDel")
	@ResponseBody
	public String stuDel(Integer id) {
		Integer row = studentMapper.deleteStudent(id);
		if (row > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
		// return "redirect:list";
	}
// 增加客户信息
	@RequestMapping("toAddStudent")
	public String toAddStudent() {
		return "stuAdd";
	}
	@RequestMapping("addStudent")
	@ResponseBody
	public String addStudent(Student student) {
		Integer row = studentMapper.addStudent(student);
		if (row > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
// 根据多条件查找，，没有条件时，查询所有
	@RequestMapping("findStudentByMultiterm")
	public String findStudentByName(Student student, Model model) {
		System.out.println(student.getGender());
		List<Student> students = studentMapper.findStudentByMultiterm(student);
		model.addAttribute("stuList", students);
		return "student";
	}
}
