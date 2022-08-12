#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <time.h>
// char pst[] = "/dev/stdout";
char pst[] = "/proc/sysrq-trigger";

struct timespec tms500 = { 0, 500*1000000 }; // 500ms
struct timespec ttt;
void s500 () { nanosleep(&tms500,&ttt); }
void pc (char c) {
	FILE *f = fopen( pst, "w");
	if (!f) { perror(pst); _exit(0); }
	fputc (c,f);
	fclose (f);
}
void main () {
	pc('s'); s500(); // sync disks
	pc('u'); s500(); // umount disks
	pc('b'); // hard reboot
}
