CC = gcc
CFLAGS = -I.
DEPS =
OBJ = reboot.o

all: reboot
%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)
reboot: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
clean:
	rm -f reboot $(OBJ)
install:
	strip reboot
	sudo cp reboot /sbin/
	sudo chown root /sbin/reboot
	sudo chmod u+s /sbin/reboot
