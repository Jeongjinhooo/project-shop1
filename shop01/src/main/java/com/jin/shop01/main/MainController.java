package com.jin.shop01.main;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
    
        //���� GET ����
        @RequestMapping("/main.do")
        public String main() {
            return "/main/main";
        }
        

        
}



