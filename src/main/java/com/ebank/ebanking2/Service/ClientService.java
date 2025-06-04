package com.ebank.ebanking2.Service;

import com.ebank.ebanking2.model.dto.ClientDTO;
import com.ebank.ebanking2.model.dto.ClientResDTO;
import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.mapper.ClientMapper;
import com.ebank.ebanking2.repository.ClientRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ClientService {

    @Autowired
    private ClientRepo clientRepo;

    @Autowired
    private ClientMapper clientMapper;


    public ClientResDTO addClient(ClientDTO clientDTO) {
        Client client = clientMapper.toEntity(clientDTO);
        clientRepo.save(client);
        return clientMapper.toResDTO(client);
    }

    public List<ClientResDTO> getAllClients() {
        return clientRepo.findAll().stream()
                .map(clientMapper::toResDTO)
                .collect(Collectors.toList());
    }

    public ClientResDTO getClientById(Long id) {
        Client client = clientRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Client non trouvé avec l'ID: " + id));
        return clientMapper.toResDTO(client);
    }

    //ajoutee pour  deleter un tel client
    public void deleteClient(Long id) {
        clientRepo.deleteById(id);
    }

}