package top.ychen.qasystem.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtil {

    /**
     * 生成密码的 MD5 哈希值
     *
     * @param password 明文密码
     * @return 哈希后的密码
     */
    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                String hex = Integer.toHexString(0xFF & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 验证密码是否匹配
     *
     * @param rawPassword 明文密码
     * @param storedPassword 存储的哈希密码
     * @return 如果密码匹配返回 true，否则返回 false
     */
    public static boolean checkPassword(String rawPassword, String storedPassword) {
        String hashedPassword = hashPassword(rawPassword);
        return storedPassword.equals(hashedPassword);
    }

    public static void main(String[] args) {
        String rawPassword = "password123";
        String hashedPassword = hashPassword(rawPassword);
        System.out.println("加密后: " + hashedPassword);
        System.out.println("密码匹配: " + checkPassword(rawPassword, hashedPassword));
    }
}
