package com.example.demo;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Omar Ismail
 * @since 5/9/2023
 */
@RestController
public class TestController {


    @GetMapping("/foo")
    public ResponseEntity<String> test() {

        return ResponseEntity.ok("Hello Jalal");
    }

}
