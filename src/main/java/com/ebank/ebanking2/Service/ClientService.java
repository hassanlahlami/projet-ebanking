package com.ebank.ebanking2.Service;

import com.ebank.ebanking2.model.dto.ClientDTO;
import com.ebank.ebanking2.model.dto.ClientResDTO;
import com.ebank.ebanking2.model.dto.Clientchangedto;
import com.ebank.ebanking2.model.dto.EcodeDTO;
import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.mapper.ClientMapper;
import com.ebank.ebanking2.repository.ClientRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
    public Client getClientnodtoById(Long id) {
        Client client = clientRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Client non trouvé avec l'ID: " + id));
        return client;
    }

    //ajoutee pour  deleter un tel client
    public void deleteClient(Long id) {
        clientRepo.deleteById(id);
    }
    public void updateclient(long id,Clientchangedto clientchangedto) {

    Client client=getClientnodtoById(id);
        client.setEmail(clientchangedto.getEmail());
        client.setPhone(clientchangedto.getPhone());
        client.setUsername(clientchangedto.getName());
        clientRepo.save(client);


    }

    public Client getclientbyemail(String email) {
            return clientRepo.findByEmail(email);
    }


    public boolean saveEcode(EcodeDTO ecodeDTO) {
        Optional<Client> client=clientRepo.findById(ecodeDTO.getClientId());
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String hashedEcode = encoder.encode(ecodeDTO.getCode());
        client.get().setCode(hashedEcode);
        clientRepo.save(client.get());
        return true;
    }


    public boolean verifyEcode(EcodeDTO ecodeDTO) {
        Optional<Client> client=clientRepo.findById(ecodeDTO.getClientId());
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.matches(ecodeDTO.getCode(), client.get().getCode());
    }
}