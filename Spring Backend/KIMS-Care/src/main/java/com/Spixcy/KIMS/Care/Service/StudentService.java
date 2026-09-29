package com.Spixcy.KIMS.Care.Service;

import com.Spixcy.KIMS.Care.DTO.StudentRequestDTO;
import com.Spixcy.KIMS.Care.DTO.StudentResponseDTO;
import com.Spixcy.KIMS.Care.Exception.ResourceNotFoundException;
import com.Spixcy.KIMS.Care.Model.Student;
import com.Spixcy.KIMS.Care.Repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    public StudentRepository studentRepository;

    @Autowired
    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    public Student saveStudent(StudentRequestDTO dto) {

        Student student = new Student();

        student.setRollNumber(dto.getRollNumber());
        student.setName(dto.getName());
        student.setEmail(dto.getEmail());
        student.setPhoneNumber(dto.getPhoneNumber());
        student.setDateOfBirth(dto.getDateOfBirth());
        student.setGender(dto.getGender());
        student.setBloodGroup(dto.getBloodGroup());
        student.setCourse(dto.getCourse());
        student.setBranch(dto.getBranch());
        student.setYear(dto.getYear());
        student.setProfileImage(dto.getProfileImage());

        return studentRepository.save(student);
    }

    public List<StudentResponseDTO> getAllStudents() {

        return studentRepository.findAll()
                .stream()
                .map(student -> {

                    StudentResponseDTO dto = new StudentResponseDTO();

                    dto.setRollNumber(student.getRollNumber());
                    dto.setName(student.getName());
                    dto.setEmail(student.getEmail());
                    dto.setPhoneNumber(student.getPhoneNumber());
                    dto.setDateOfBirth(student.getDateOfBirth());
                    dto.setGender(student.getGender());
                    dto.setBloodGroup(student.getBloodGroup());
                    dto.setCourse(student.getCourse());
                    dto.setBranch(student.getBranch());
                    dto.setYear(student.getYear());
                    dto.setProfileImage(student.getProfileImage());
                    dto.setCreatedAt(student.getCreatedAt());

                    return dto;
                })
                .toList();
    }

    public StudentResponseDTO getstudentbyId(String rollnumber) {

        Student student = studentRepository.findById(rollnumber)
                .orElseThrow(() ->
                        new ResourceNotFoundException(
                                "Student not found with roll number: " + rollnumber
                        )
                );

        StudentResponseDTO dto = new StudentResponseDTO();

        dto.setRollNumber(student.getRollNumber());
        dto.setName(student.getName());
        dto.setEmail(student.getEmail());
        dto.setPhoneNumber(student.getPhoneNumber());
        dto.setDateOfBirth(student.getDateOfBirth());
        dto.setGender(student.getGender());
        dto.setBloodGroup(student.getBloodGroup());
        dto.setCourse(student.getCourse());
        dto.setBranch(student.getBranch());
        dto.setYear(student.getYear());
        dto.setProfileImage(student.getProfileImage());
        dto.setCreatedAt(student.getCreatedAt());

        return dto;
    }

    public void deleteStudent(String rollnumber) {

        if (!studentRepository.existsById(rollnumber)) {
            throw new ResourceNotFoundException(
                    "Student not found with roll number: " + rollnumber
            );
        }

        studentRepository.deleteById(rollnumber);
    }
}