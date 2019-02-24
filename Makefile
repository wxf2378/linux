target=app
src=$(wildcard ./*.c)
obj=$(patsubst ./%.c, ./%.o, $(src))
## Makefile内置的参数, 大写, 可覆盖
CC = gcc ## 默认CC=cc
CPPFLAGS = -I
CFLAGS = -Wall -g -c
LDFLAGS = -L -l
$(target):$(obj)
	$(CC) $(obj) -o $(target)

%.o:%.c
	$(CC) -c &< -o $@

.PHONY:clean
clean:
	-rm: ## 忽略错误, 如果执行错误继续执行下面的内容
	rm -f $(obj) $(target)
