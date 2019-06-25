package com.zxh.mapper;
import java.util.List;
import com.zxh.po.Student;
/**
 * @author  ZhaoXiangHeng
 * @2019年6月9日
 * @TODO StudengMapper 接口
 */
public interface StudentMapper {
	public Student findStudentById(Integer id);
	public List<Student> listStudent();
	public Integer updateStudent(Student student);
	public Integer deleteStudent(Integer id);
	public Integer addStudent(Student student);
	public List<Student> findStudentByMultiterm(Student student);
}
