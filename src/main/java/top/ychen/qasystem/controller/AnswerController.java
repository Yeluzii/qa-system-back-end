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
    public void answerQuestion(@RequestBody Answer answer) {
        answerService.answerQuestion(answer);
    }

    @GetMapping("/questionId/{questionId}")
    public ResponseResult getAnswerByQuestionId(@PathVariable Integer questionId) {
        List<Answer> answerList = answerService.getAnswerByQuestionId(questionId);
        return ResponseResult.builder().data(answerList).build();
    }

    @GetMapping("/userId/{userId}")
    public ResponseResult getAnswerByUserId(@PathVariable Integer userId) {
        List<Answer> answerList = answerService.getAnswerByUserId(userId);
        return ResponseResult.builder().data(answerList).build();
    }
}
