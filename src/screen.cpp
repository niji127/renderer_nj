#include <glad/glad.h>
#include "screen.h"

void Screen::createWindow()
{
    window = glfwCreateWindow(size.width, size.height, "renderer_nj", nullptr, nullptr);
    glfwMakeContextCurrent(window);
    if (window == nullptr)
    {
        std::cout << "Failed to create GLFW window" << std::endl;
        glfwTerminate();
    }
    glfwSetWindowUserPointer(window, this);
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);
    glfwSetCursorPosCallback(window, mouse_callback);
    glfwSetScrollCallback(window, scroll_callback);

    glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_DISABLED);
}

void Screen::resize(int new_width,int new_height)
{
    size.width = new_width;
    size.height = new_height;
    aspect_ratio = (float)size.width / (float)size.height;
}

void Screen::processInput()
{
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
        glfwSetWindowShouldClose(window, true);
    float current_time = static_cast<float>(glfwGetTime());
    float delta_time = current_time - last_time;
    last_time = current_time;
    if (glfwGetKey(window, GLFW_KEY_W) == GLFW_PRESS)
        camera.ProcessKeyboard(FORWARD, delta_time);
    if (glfwGetKey(window, GLFW_KEY_S) == GLFW_PRESS)
        camera.ProcessKeyboard(BACKWARD, delta_time);
    if (glfwGetKey(window, GLFW_KEY_A) == GLFW_PRESS)
        camera.ProcessKeyboard(LEFT, delta_time);
    if (glfwGetKey(window, GLFW_KEY_D) == GLFW_PRESS)
        camera.ProcessKeyboard(RIGHT, delta_time);
}

void framebuffer_size_callback(GLFWwindow *window, int width, int height)
{
    Screen *screen = (Screen *)glfwGetWindowUserPointer(window);
    screen->resize(width, height);
    glViewport(0, 0, width, height);
}

void mouse_callback(GLFWwindow *window, double xposIn, double yposIn)
{
    float xpos = static_cast<float>(xposIn);
    float ypos = static_cast<float>(yposIn);

    Screen *screen = (Screen *)glfwGetWindowUserPointer(window);
    if (screen->is_first_mouse)
    {
        screen->lastX = xpos;
        screen->lastY = ypos;
        screen->is_first_mouse = false;
    }

    float xoffset = xpos - screen->lastX;
    float yoffset = screen->lastY - ypos;

    screen->lastX = xpos;
    screen->lastY = ypos;

    screen->camera.ProcessMouseMovement(xoffset, yoffset);
}


void scroll_callback(GLFWwindow *window, double xoffset, double yoffset)
{
    Screen *screen = (Screen *)glfwGetWindowUserPointer(window);
    screen->camera.ProcessMouseScroll(static_cast<float>(yoffset));
}
