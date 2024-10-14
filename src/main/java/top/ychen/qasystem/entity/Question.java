package top.ychen.qasystem.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Question {
    private Integer id;
    private String title;
    private String content;
    private Integer userId;
    private java.sql.Timestamp createdAt;
    private User user;
    private List<Answer> answers;
}
