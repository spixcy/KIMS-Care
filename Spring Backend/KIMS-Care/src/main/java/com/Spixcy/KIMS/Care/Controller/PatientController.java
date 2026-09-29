package com.Spixcy.KIMS.Care.Controller;

import com.Spixcy.KIMS.Care.DTO.PatientRequestDTO;
import com.Spixcy.KIMS.Care.DTO.PatientResponseDTO;
import com.Spixcy.KIMS.Care.Model.Patient;
import com.Spixcy.KIMS.Care.Service.PatientService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/patients")
public class PatientController {

    private PatientService patientService;

    @Autowired
    public PatientController(PatientService patientService) {
        this.patientService = patientService;
    }

    @PostMapping
    public Patient savePatient(
            @Valid @RequestBody PatientRequestDTO dto) {

        return patientService.savePatient(dto);
    }

    @GetMapping
    public List<PatientResponseDTO> getAllPatients() {

        return patientService.getallpatients();
    }

    @GetMapping("/{id}")
    public PatientResponseDTO getPatientById(
            @PathVariable("id") Long id) {

        return patientService.getpatientbyId(id);
    }

    @DeleteMapping("/{id}")
    public void deletePatient(
            @PathVariable("id") Long id) {

        patientService.deletePatient(id);
    }
}