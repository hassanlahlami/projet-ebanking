package com.ebank.ebanking2.Service;

import com.ebank.ebanking2.model.dto.ClientDTO;
import com.ebank.ebanking2.model.dto.CompteDTO;
import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.entity.Compte;
import com.ebank.ebanking2.model.mapper.ClientMapper;
import com.ebank.ebanking2.model.mapper.CompteMapper;
import com.ebank.ebanking2.repository.ClientRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ClientService {

    @Autowired
    private ClientRepo clientRepo;
    @Autowired
    private ClientMapper clientMapper;
    public ClientDTO save(ClientDTO clientDTO) {
        Client client = new Client();
        client= clientMapper.clientDTOToClient(clientDTO);
        client= clientRepo.save(client);
        return clientMapper.clientToClientDTO(client);
    }

    public List<ClientDTO> getAllClients() {
        return clientRepo.findAll().stream()
                .map(client -> new ClientDTO(client.getId(), client.getUsername(), client.getEmail(),
                        client.getComptes().stream()
                                .map(c -> new CompteDTO(c.getId(), c.getSolde(), c.getStatus()))
                                .collect(Collectors.toList())))
                .collect(Collectors.toList());
    }

    public ClientDTO getClientById(String id) {
        Client client = clientRepo.findById(id).orElseThrow();
        return new ClientDTO(client.getId(), client.getUsername(), client.getEmail(),
                client.getComptes().stream()
                        .map(c -> new CompteDTO(c.getId(), c.getSolde(), c.getStatus()))
                        .collect(Collectors.toList()));
    }
}