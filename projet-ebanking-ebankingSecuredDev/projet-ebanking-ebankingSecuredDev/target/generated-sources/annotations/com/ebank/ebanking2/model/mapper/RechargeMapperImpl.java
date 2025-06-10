package com.ebank.ebanking2.model.mapper;

import com.ebank.ebanking2.model.dto.RechargeDTO;
import com.ebank.ebanking2.model.dto.RechargeResDTO;
import com.ebank.ebanking2.model.entity.Recharge;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-06-10T20:38:27+0100",
    comments = "version: 1.6.3, compiler: javac, environment: Java 23 (Oracle Corporation)"
)
@Component
public class RechargeMapperImpl implements RechargeMapper {

    @Override
    public RechargeResDTO ToResDTO(Recharge recharge) {
        if ( recharge == null ) {
            return null;
        }

        RechargeResDTO.RechargeResDTOBuilder<?, ?> rechargeResDTO = RechargeResDTO.builder();

        rechargeResDTO.id( recharge.getId() );
        rechargeResDTO.operateur( recharge.getOperateur() );
        rechargeResDTO.phoneNumber( recharge.getPhoneNumber() );
        rechargeResDTO.montant( recharge.getMontant() );
        rechargeResDTO.createdAt( recharge.getCreatedAt() );

        return rechargeResDTO.build();
    }

    @Override
    public List<RechargeResDTO> ToResDTOList(List<Recharge> recharges) {
        if ( recharges == null ) {
            return null;
        }

        List<RechargeResDTO> list = new ArrayList<RechargeResDTO>( recharges.size() );
        for ( Recharge recharge : recharges ) {
            list.add( ToResDTO( recharge ) );
        }

        return list;
    }

    @Override
    public Recharge ToEntity(RechargeDTO rechargeDTO) {
        if ( rechargeDTO == null ) {
            return null;
        }

        Recharge recharge = new Recharge();

        recharge.setOperateur( rechargeDTO.getOperateur() );
        recharge.setPhoneNumber( rechargeDTO.getPhoneNumber() );
        recharge.setMontant( rechargeDTO.getMontant() );

        return recharge;
    }
}
