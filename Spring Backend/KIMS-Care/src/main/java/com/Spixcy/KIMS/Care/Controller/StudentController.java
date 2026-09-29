package com.Spixcy.KIMS.Care.Controller;

import com.Spixcy.KIMS.Care.DTO.StudentRequestDTO;
import com.Spixcy.KIMS.Care.DTO.StudentResponseDTO;
import com.Spixcy.KIMS.Care.Model.Student;
import com.Spixcy.KIMS.Care.Service.StudentService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/students")
public class StudentController {

    private StudentService studentService;

    @Autowired
    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @PostMapping
    public Student saveStudent(
            @Valid @RequestBody StudentRequestDTO dto) {

        return studentService.saveStudent(dto);
    }

    @GetMapping
    public List<StudentResponseDTO> getAllStudents() {

        return studentService.getAllStudents();
    }

    @GetMapping("/{rollNumber}")
    public StudentResponseDTO getStudentById(
            @PathVariable("rollNumber") String rollNumber) {

        return studentService.getstudentbyId(rollNumber);
    }

    @DeleteMapping("/{rollNumber}")
    public void deleteStudent(
            @PathVariable("rollNumber") String rollNumber) {

        studentService.deleteStudent(rollNumber);
    }
}