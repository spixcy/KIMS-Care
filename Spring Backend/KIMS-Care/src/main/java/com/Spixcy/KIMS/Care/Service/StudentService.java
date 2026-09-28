package com.Spixcy.KIMS.Care.Service;

import com.Spixcy.KIMS.Care.Model.Student;
import com.Spixcy.KIMS.Care.Repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.OptionalInt;

@Service
public class StudentService {

    private StudentRepository studentRepository;

    @Autowired
    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    public Student savestudent(Student student) {
        return studentRepository.save(student);
    }

    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    public Optional<Student> getstudentbyId(String rollnumber) {
        return studentRepository.findById(rollnumber);
    }

    public void deleteStudent(String rollnumber) {
        studentRepository.deleteById(rollnumber);
    }


}