CC = gcc
CFLAGS = -I.
DEPS =
TGT = reboot
OBJ = $(TGT).o

all: $(TGT)
%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)
reboot: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
clean:
	rm -f $(TGT) $(OBJ)
install:
	strip $(TGT)
	sudo cp $(TGT) /sbin/$(TGT)
	sudo chown root /sbin/$(TGT)
	sudo chmod u+s /sbin/$(TGT)
