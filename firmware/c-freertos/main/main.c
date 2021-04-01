#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "nvs_flash.h"
#include "lwip/sys.h"

#include "../components/system-task/include/system-task.h"
#include "../components/mqtt-task/include/mqtt-task.h"
#include "../components/pwm-task/include/pwm-task.h"

static const char *TAG = "main module";

static EventGroupHandle_t system_events;
static MessageBufferHandle_t pwm_buffer;
static struct MqttTaskConfig mqttTaskConfig;

void app_main()
{
    ESP_LOGI(TAG, "[APP] Startup..");
    ESP_LOGI(TAG, "[APP] Free memory: %d bytes", esp_get_free_heap_size());
    ESP_LOGI(TAG, "[APP] IDF version: %s", esp_get_idf_version());

    esp_log_level_set("*", ESP_LOG_INFO);
    esp_log_level_set("MQTT_CLIENT", ESP_LOG_VERBOSE);
    esp_log_level_set("MQTT_EXAMPLE", ESP_LOG_VERBOSE);
    esp_log_level_set("TRANSPORT_TCP", ESP_LOG_VERBOSE);
    esp_log_level_set("TRANSPORT_SSL", ESP_LOG_VERBOSE);
    esp_log_level_set("TRANSPORT", ESP_LOG_VERBOSE);
    esp_log_level_set("OUTBOX", ESP_LOG_VERBOSE);

    ESP_ERROR_CHECK(nvs_flash_init());

    system_events = xEventGroupCreate();
    pwm_buffer = xMessageBufferCreate(PWM_BUFFER_SIZE);
    mqttTaskConfig.wifi_semaphore = wifi_semaphore;
    mqttTaskConfig.pwm_buffer = pwm_buffer;


    xTaskCreate(system_task, "System task", 1024 * 5, &system_events, 3, NULL);
    xTaskCreate(mqtt_task, "MQTT task", 1024 * 5, &mqttTaskConfig, 2, NULL);
    xTaskCreate(pwm_task, "MQTT task", 1024 * 5, pwm_buffer, 2, NULL);
}
