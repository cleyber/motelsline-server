/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package motelsline.server.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author MotelsLine
 */
public class Hash {

    public static String sha256(String input) throws NoSuchAlgorithmException{
        MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
        byte[] result = mDigest.digest(input.getBytes());
        StringBuilder sBuilder = new StringBuilder();
        for(int i = 0; i < result.length; i++){
            sBuilder.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
        }
        return sBuilder.toString();
    }
}
