package com.Spixcy.KIMS.Care.Repository;

import com.Spixcy.KIMS.Care.Model.Patient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Long>{



}