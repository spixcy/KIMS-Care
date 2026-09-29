package com.Spixcy.KIMS.Care.Service;

import com.Spixcy.KIMS.Care.DTO.PatientRequestDTO;
import com.Spixcy.KIMS.Care.DTO.PatientResponseDTO;
import com.Spixcy.KIMS.Care.Exception.ResourceNotFoundException;
import com.Spixcy.KIMS.Care.Model.Patient;
import com.Spixcy.KIMS.Care.Repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientService {

    @Autowired
    public PatientRepository patientRepository;

    public Patient savePatient(PatientRequestDTO dto) {

        Patient patient = new Patient();

        patient.setName(dto.getName());
        patient.setEmail(dto.getEmail());
        patient.setPhoneNumber(dto.getPhoneNumber());
        patient.setDateOfBirth(dto.getDateOfBirth());
        patient.setGender(dto.getGender());
        patient.setBloodGroup(dto.getBloodGroup());
        patient.setAddress(dto.getAddress());
        patient.setProfileImage(dto.getProfileImage());

        return patientRepository.save(patient);
    }

    public List<PatientResponseDTO> getallpatients() {

        return patientRepository.findAll()
                .stream()
                .map(patient -> {

                    PatientResponseDTO dto = new PatientResponseDTO();

                    dto.setId(patient.getId());
                    dto.setName(patient.getName());
                    dto.setEmail(patient.getEmail());
                    dto.setPhoneNumber(patient.getPhoneNumber());
                    dto.setDateOfBirth(patient.getDateOfBirth());
                    dto.setGender(patient.getGender());
                    dto.setBloodGroup(patient.getBloodGroup());
                    dto.setAddress(patient.getAddress());
                    dto.setProfileImage(patient.getProfileImage());
                    dto.setCreatedAt(patient.getCreatedAt());

                    return dto;
                })
                .toList();
    }

    public PatientResponseDTO getpatientbyId(Long id) {

        Patient patient = patientRepository.findById(id)
                .orElseThrow(() ->
                        new ResourceNotFoundException(
                                "Patient not found with id: " + id
                        )
                );

        PatientResponseDTO dto = new PatientResponseDTO();

        dto.setId(patient.getId());
        dto.setName(patient.getName());
        dto.setEmail(patient.getEmail());
        dto.setPhoneNumber(patient.getPhoneNumber());
        dto.setDateOfBirth(patient.getDateOfBirth());
        dto.setGender(patient.getGender());
        dto.setBloodGroup(patient.getBloodGroup());
        dto.setAddress(patient.getAddress());
        dto.setProfileImage(patient.getProfileImage());
        dto.setCreatedAt(patient.getCreatedAt());

        return dto;
    }

    public void deletePatient(Long id) {

        if (!patientRepository.existsById(id)) {
            throw new ResourceNotFoundException(
                    "Patient not found with id: " + id
            );
        }

        patientRepository.deleteById(id);
    }
}