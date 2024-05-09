package com.loginone.login.service.IMPL;

import com.loginone.login.dto.LoginDTO;
import com.loginone.login.entity.Login;
import com.loginone.login.repository.StudentRepository;
import com.loginone.login.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceIMPL implements StudentService {

    @Autowired
    private StudentRepository studentRepository;


    @Override
    public String registerStudent(LoginDTO loginDTO) {
        Login login=new Login(
            loginDTO.getId(),
                loginDTO.getAge(),
                loginDTO.getName(),
                loginDTO.getAddress(),
                loginDTO.getNumber()


        );
        studentRepository.save(login);
        return "Student Saved";
    }
}
