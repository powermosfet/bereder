#ifndef PWM_H
#define PWM_H

#define PWM_BUFFER_SIZE 20

struct Color {
    int red;
    int green;
    int blue;
};

void pwm_task(void *params);

#endif
