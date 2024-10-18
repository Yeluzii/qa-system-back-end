package top.ychen.qasystem.controller;

import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import top.ychen.qasystem.common.ResponseResult;
import top.ychen.qasystem.entity.Answer;
import top.ychen.qasystem.service.AnswerService;

import java.util.List;

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
