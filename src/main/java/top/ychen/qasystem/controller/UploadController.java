package top.ychen.qasystem.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/upload")
public class UploadController {

    @Value("${upload.path}")
    private String uploadPath;

    @Value("${server.servlet.context-path}")
    private String contextPath;

    @PostMapping("/image")
    public ResponseEntity<Map<String, String>> uploadImage(@RequestParam("file") MultipartFile file) {
        Map<String, String> response = new HashMap<>();
        try {
            if (file.isEmpty()) {
                response.put("message", "文件为空");
                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
            }

            // 生成文件名
            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            Path filePath = Paths.get(uploadPath, fileName);

            // 保存文件
            Files.copy(file.getInputStream(), filePath);

            // 输出文件路径
            System.out.println("文件已保存到: " + filePath.toAbsolutePath());

            // 返回文件的访问 URL
            String fileUrl = contextPath + "/uploads/" + fileName;
            response.put("url", fileUrl);
            response.put("alt", "图片描述"); // 这里可以动态生成或从请求参数中获取
            response.put("href", fileUrl); // 提供 href 以便于与前端接口兼容

            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (IOException e) {
            response.put("message", "文件上传失败: " + e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/video")
    public ResponseEntity<Map<String, String>> uploadVideo(@RequestParam("file") MultipartFile file) {
        Map<String, String> response = new HashMap<>();
        try {
            if (file.isEmpty()) {
                response.put("message", "文件为空");
                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
            }

            // 生成文件名
            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            Path filePath = Paths.get(uploadPath, fileName);

            // 保存文件
            Files.copy(file.getInputStream(), filePath);

            // 输出文件路径
            System.out.println("文件已保存到: " + filePath.toAbsolutePath());

            // 返回文件的访问 URL
            String fileUrl = contextPath + "/uploads/" + fileName;
            response.put("url", fileUrl);
            response.put("alt", "视频描述"); // 为视频提供一个描述字段
            response.put("href", fileUrl); // 提供 href 以便于与前端接口兼容

            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (IOException e) {
            response.put("message", "文件上传失败: " + e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}