package top.ychen.qasystem.controller;

import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import top.ychen.qasystem.common.ResponseResult;
import top.ychen.qasystem.entity.Question;
import top.ychen.qasystem.service.QuestionService;

import java.util.List;

@RestController
@RequestMapping("/questions")
public class QuestionController {
    @Resource
    private QuestionService questionService;

    @PostMapping("/ask")
    public void askQuestion(@RequestBody Question question) {
        questionService.askQuestion(question);
    }

    @GetMapping("/all")
    public ResponseResult getAllQuestions() {
        List<Question> questions = questionService.getAllQuestions();
        return ResponseResult.builder()
                .code(200)
                .msg("所有问题获取成功")
                .data(questions)
                .build();
    }

    @GetMapping("/{id}")
    public ResponseResult findQuestionById(@PathVariable Integer id) {
        Question question = questionService.findQuestionById(id);
        return ResponseResult.builder()
                .code(200)
                .msg("根据id查到的单个问题获取成功")
                .data(question)
                .build()  ;
    }
}
