#include "esp_log.h"
#include "lwip/sys.h"
#include "mqtt_client.h"

#include "include/mqtt-task.h"

#define TOPIC_ALIVE

static const char *TAG = "MQTT module";

static struct MqttTaskConfig *cfg;

static esp_err_t mqtt_event_handler(esp_mqtt_event_handle_t event)
{
    esp_mqtt_client_handle_t client = event->client;
    int msg_id;
    // your_context_t *context = event->context;
    switch (event->event_id) {
        case MQTT_EVENT_CONNECTED:
            ESP_LOGI(TAG, "MQTT_EVENT_CONNECTED");
            msg_id = esp_mqtt_client_publish(client, "/topic/qos1", "data_3", 0, 1, 0);
            ESP_LOGI(TAG, "sent publish successful, msg_id=%d", msg_id);

            esp_mqtt_client_subscribe(client, CONFIG_MQTT_TOPIC_COLOR, 0);
            break;

        case MQTT_EVENT_DISCONNECTED:
            ESP_LOGI(TAG, "MQTT_EVENT_DISCONNECTED");
            break;

        case MQTT_EVENT_SUBSCRIBED:
            ESP_LOGI(TAG, "MQTT_EVENT_SUBSCRIBED, msg_id=%d", event->msg_id);
            msg_id = esp_mqtt_client_publish(client, CONFIG_MQTT_TOPIC_ALIVE, "true", 0, 0, 0);
            ESP_LOGI(TAG, "sent publish successful, msg_id=%d", msg_id);
            break;

        case MQTT_EVENT_UNSUBSCRIBED:
            ESP_LOGI(TAG, "MQTT_EVENT_UNSUBSCRIBED, msg_id=%d", event->msg_id);
            break;

        case MQTT_EVENT_PUBLISHED:
            ESP_LOGI(TAG, "MQTT_EVENT_PUBLISHED, msg_id=%d", event->msg_id);
            break;
            
        case MQTT_EVENT_DATA:
            ESP_LOGI(TAG, "MQTT_EVENT_DATA");
            xMessageBufferSend(cfg->pwm_buffer, //MessageBufferHandle_t xMessageBuffer,
                               event->data,     // const void *pvTxData,
                               event->data_len, // size_t xDataLengthBytes,
                               0);              // ticks to wait

            ESP_LOGI(TAG, "%d", strcmp(event->data, "ert"));
            break;

        case MQTT_EVENT_ERROR:
            ESP_LOGI(TAG, "MQTT_EVENT_ERROR");
            break;
    }
    return ESP_OK;
}

void mqtt_task(void *params) {
    ESP_LOGI(TAG, "Initializing");

    cfg = params;

    esp_mqtt_client_config_t mqtt_cfg = {
        .uri = CONFIG_MQTT_HOST,
        .event_handle = mqtt_event_handler,
    };

    for(;;) {
        ESP_LOGI(TAG, "Waiting for wifi");
        xSemaphoreTake(*(cfg->wifi_semaphore), portMAX_DELAY);

        ESP_LOGI(TAG, "Got wifi semaphore");
        vTaskDelay(1000 / portTICK_PERIOD_MS);

        ESP_LOGI(TAG, "Setting up client");
        esp_mqtt_client_handle_t client = esp_mqtt_client_init(&mqtt_cfg);
        ESP_LOGI(TAG, "Starting client");
        esp_mqtt_client_start(client);
        ESP_LOGI(TAG, "Started client");
    }
}
