#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/message_buffer.h"
#include "esp_log.h"
#include "driver/pwm.h"

#include "include/pwm-task.h"

#define GPIO_WEMOS_D3   0
#define GPIO_WEMOS_D2   4
#define GPIO_WEMOS_D1   5

// PWM period 1024us (976hz), same as depth
#define PWM_PERIOD    (1024)

static const char *TAG = "PWM task";

// pwm pin number
const uint32_t pin_num[3] = {
    GPIO_WEMOS_D3,
    GPIO_WEMOS_D2,
    GPIO_WEMOS_D1
};

// duties table, real_duty = duties[x]/PERIOD
uint32_t duties[3] = {
    0, 0, 0
};

// phase table, delay = (phase[x]/360)*PERIOD
int16_t phase[3] = {
    0, 0, 0
};

void pwm_task(void *params)
{
    MessageBufferHandle_t pwm_buffer = params;
    char data[PWM_BUFFER_SIZE];
    size_t data_len;
    int red, green, blue;
    char num_buffer[PWM_BUFFER_SIZE + 1];
    char num_substr[PWM_BUFFER_SIZE + 1];
    char *num_start;
    char *num_end;

    pwm_init(PWM_PERIOD, duties, 3, pin_num);
    pwm_set_phases(phase);
    pwm_start();

    for(;;) {
        data_len = xMessageBufferReceive(pwm_buffer,
                              &data,          // void *pvRxData,
                              sizeof(data),   //size_t xBufferLengthBytes,
                              portMAX_DELAY); // TickType_t xTicksToWait );

        red = 0;
        green = 0;
        blue = 0;

        red = blue;
        green = red;
        blue = green;

        strncpy(num_buffer, data, data_len);
        num_buffer[data_len] = '\0';
        num_start = num_buffer;

        // Parse red component
        num_end = strchr(num_start, ';');
        if(!num_end) {
            continue;
        }
        strncpy(num_substr, num_start, num_end - num_start);
        num_substr[num_end - num_start] = '\0';
        red = atoi(num_substr);
        num_start = num_end + 1;

        // Parse green component
        num_end = strchr(num_start, ';');
        if(!num_end) {
            continue;
        }
        strncpy(num_substr, num_start, num_end - num_start);
        num_substr[num_end - num_start] = '\0';
        green = atoi(num_substr);
        num_start = num_end + 1;

        // Parse blue component
        blue = atoi(num_start);
        
        ESP_LOGI(TAG, "red: %d", red);
        ESP_LOGI(TAG, "green: %d", green);
        ESP_LOGI(TAG, "blue: %d", blue);
        duties[0] = red;
        duties[1] = green;
        duties[2] = blue;

        pwm_set_duties(duties);
        pwm_start();
    }
}


