package com.box.small.user.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
}
