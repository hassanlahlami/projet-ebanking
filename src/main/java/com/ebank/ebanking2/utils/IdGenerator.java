package com.ebank.ebanking2.utils;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class IdGenerator {

    private String PREFIX;
    private int ID_LENGTH;

    public String generateNextId(String lastId) {
        if (lastId == null || lastId.isEmpty()) {
            return PREFIX + String.format("%0" + ID_LENGTH + "d", 1);
        }
        String numericPart = lastId.substring(PREFIX.length());
        long number = Long.parseLong(numericPart) + 1;
        return PREFIX + String.format("%0" + ID_LENGTH + "d", number);
    }

}