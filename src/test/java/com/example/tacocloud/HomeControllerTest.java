package com.example.tacocloud;

import com.example.tacocloud.web.WebConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringRunner.class)
@WebMvcTest(WebConfig.class)
public class HomeControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void home() throws Exception {
        mockMvc.perform(get("/"))              /*Выполняет GET */
                .andExpect(status().isOk())    /*-Ожидает HTTP 200*/
                .andExpect(view().name("home"))    /*Ожидает home*/
                .andExpect(content().string( /*Welcome to...*/
                        containsString("Welcome to...")));
    }
}