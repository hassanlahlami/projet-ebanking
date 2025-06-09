package com.ebank.ebanking2.Service;

import com.ebank.ebanking2.model.dto.ClientDTO;
import com.ebank.ebanking2.model.dto.ClientResDTO;
import com.ebank.ebanking2.model.dto.Clientchangedto;
import com.ebank.ebanking2.model.entity.Client;
import com.ebank.ebanking2.model.entity.User;
import com.ebank.ebanking2.model.mapper.ClientMapper;
import com.ebank.ebanking2.repository.ClientRepo;
import com.ebank.ebanking2.repository.UserRepo;
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

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private UserRepo userRepo;


    public ClientResDTO addClient(ClientDTO clientDTO) {
        Client client = clientMapper.toEntity(clientDTO);

        if (client.getPassword() != null) {
            String encryptedPassword = passwordEncoder.encode(client.getPassword());
            client.setPassword(encryptedPassword);
        }

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
//    public Client getclientbyEmail(String email) {
//            return clientRepo.findByEmail(email);
//    }
    public User getUserByEmail(String email) {
        User user = userRepo.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User non trouvé avec l'Email: " + email));
        return user;
    }
}