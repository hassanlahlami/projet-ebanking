package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.EmployeeDTO;
import com.ebank.ebanking2.model.dto.EmployeeResDTO;
import com.ebank.ebanking2.model.entity.Employee;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-06-10T20:38:28+0100",
    comments = "version: 1.6.3, compiler: javac, environment: Java 23 (Oracle Corporation)"
)
@Component
public class EmployeeMapperImpl implements EmployeeMapper {

    @Override
    public Employee toEntity(EmployeeDTO employeeDTO) {
        if ( employeeDTO == null ) {
            return null;
        }

        Employee.EmployeeBuilder<?, ?> employee = Employee.builder();

        employee.firstName( employeeDTO.getFirstName() );
        employee.lastName( employeeDTO.getLastName() );
        employee.username( employeeDTO.getUsername() );
        employee.password( employeeDTO.getPassword() );
        employee.email( employeeDTO.getEmail() );
        employee.phone( employeeDTO.getPhone() );
        employee.role( employeeDTO.getRole() );

        return employee.build();
    }

    @Override
    public EmployeeResDTO toResDTO(Employee employee) {
        if ( employee == null ) {
            return null;
        }

        EmployeeResDTO.EmployeeResDTOBuilder employeeResDTO = EmployeeResDTO.builder();

        employeeResDTO.id( employee.getId() );
        employeeResDTO.firstName( employee.getFirstName() );
        employeeResDTO.lastName( employee.getLastName() );
        employeeResDTO.username( employee.getUsername() );
        employeeResDTO.email( employee.getEmail() );
        employeeResDTO.phone( employee.getPhone() );
        employeeResDTO.createdAt( employee.getCreatedAt() );
        employeeResDTO.updatedAt( employee.getUpdatedAt() );
        employeeResDTO.role( employee.getRole() );

        return employeeResDTO.build();
    }
}
