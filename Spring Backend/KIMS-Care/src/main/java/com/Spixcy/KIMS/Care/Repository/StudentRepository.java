package com.Spixcy.KIMS.Care.Repository;

import com.Spixcy.KIMS.Care.Model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentRepository extends JpaRepository<Student,String> {
}
