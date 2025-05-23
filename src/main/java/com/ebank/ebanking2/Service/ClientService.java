package com.ebank.ebanking2.Service;

import com.ebank.ebanking2.model.dto.ClientDTO;
import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.mapper.ClientMapper;
import com.ebank.ebanking2.utils.IdGenerator;
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
    private IdGenerator idGenerator=new IdGenerator("CL",11);
    public ClientDTO save(ClientDTO clientDTO) {
        Client client = clientMapper.clientDTOToClient(clientDTO);
        Optional<Client> lastClientOptional = clientRepo.getFirstByOrderByIdDesc();
        String id;
        if(lastClientOptional.isPresent()){
            id=idGenerator.generateNextId(lastClientOptional.get().getId());
        }else {
            id=idGenerator.generateNextId(null);
        }
        client.setId(id);
        client = clientRepo.save(client);
        return clientMapper.clientToClientDTO(client);
    }
    public List<ClientDTO> getAllClients() {
        return clientRepo.findAll().stream()
                .map(clientMapper::clientToClientDTO)
                .collect(Collectors.toList());
    }

    public ClientDTO getClientById(String id) {
        Client client = clientRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Client non trouvé avec l'ID: " + id));
        return clientMapper.clientToClientDTO(client);
    }

    //ajoutee pour  deleter un tel uclient
    public void deleteClient(String id) {
        clientRepo.deleteById(id);
    }

}