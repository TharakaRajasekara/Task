package com.loginone.login.controller;

import com.loginone.login.dto.LoginDTO;
import com.loginone.login.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/vi/Student")
public class StudentController {

    @Autowired
    StudentService studentService;

    @PostMapping("/register")
    public String registerStudent(@RequestBody LoginDTO loginDTO){
        studentService.registerStudent(loginDTO);
        return "Student Saved";

    }
}
