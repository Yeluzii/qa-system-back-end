package top.ychen.qasystem.controller;

import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import top.ychen.qasystem.common.ResponseResult;
import top.ychen.qasystem.entity.Answer;
import top.ychen.qasystem.service.AnswerService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/answers")
public class AnswerController {
    @Resource
    private AnswerService answerService;

    @PostMapping("/reply")
    public ResponseResult<Void> answerQuestion(@RequestBody Answer answer) {
        try{
            answerService.answerQuestion(answer);
            return ResponseResult.<Void>builder()
                    .code(201)
                    .msg("问题提交成功")
                    .build();
        }catch(Exception e){
            return ResponseResult.<Void>builder()
                    .code(400)
                    .msg(e.getMessage())
                    .build();
        }
    }

    @GetMapping("/questionId/{questionId}")
    public ResponseResult<List<Answer>> getAnswerByQuestionId(@PathVariable Integer questionId) {
        List<Answer> answerList = answerService.getAnswerByQuestionId(questionId);
        return ResponseResult.<List<Answer>>builder()
                .code(200)
                .msg("获取questionId为 " + questionId + " 的回复成功！")
                .data(answerList)
                .build();
    }

    @GetMapping("/questionId/{questionId}/page")
    public ResponseResult<Map<String, Object>> getByPage(@PathVariable Integer questionId, @RequestParam(defaultValue = "3") int limit, @RequestParam(defaultValue = "0") int offset) {
        if (questionId == null) {
            return ResponseResult.<Map<String, Object>>builder()
                    .code(400)
                    .msg("questionId is required")
                    .build();
        }

        try {
            Map<String, Object> map = new HashMap<>();
            List<Answer> answers = answerService.getAnswerByPageByQuestionId(questionId, limit, offset);
            map.put("answers", answers);
            map.put("total", answerService.getAnswerByQuestionId(questionId).size());

            return ResponseResult.<Map<String, Object>>builder()
                    .code(200)
                    .msg("根据页码获取 questionId 为 " + questionId + " 的回复成功")
                    .data(map)
                    .build();
        } catch (Exception e) {
            return ResponseResult.<Map<String, Object>>builder()
                    .code(500)
                    .msg("服务器内部错误: " + e.getMessage())
                    .build();
        }
    }

    @GetMapping("/userId/{userId}")
    public ResponseResult<List<Answer>> getAnswerByUserId(@PathVariable Integer userId) {
        List<Answer> answerList = answerService.getAnswerByUserId(userId);
        return ResponseResult.<List<Answer>>builder()
                .code(200)
                .msg("获取userId为 " + userId + " 的回复成功")
                .data(answerList)
                .build();
    }
}
