
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
void grade_backtrace(void);
static void lab1_switch_test(void);
static void lab1_print_cur_status(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	b8 a0 1d 11 00       	mov    $0x111da0,%eax
  10000b:	2d 16 0a 11 00       	sub    $0x110a16,%eax
  100010:	89 44 24 08          	mov    %eax,0x8(%esp)
  100014:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001b:	00 
  10001c:	c7 04 24 16 0a 11 00 	movl   $0x110a16,(%esp)
  100023:	e8 2f 36 00 00       	call   103657 <memset>

    cons_init();                // init the console
  100028:	e8 51 15 00 00       	call   10157e <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002d:	c7 45 f4 e0 37 10 00 	movl   $0x1037e0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100034:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100037:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003b:	c7 04 24 fc 37 10 00 	movl   $0x1037fc,(%esp)
  100042:	e8 d6 02 00 00       	call   10031d <cprintf>

    print_kerninfo();
  100047:	e8 e8 07 00 00       	call   100834 <print_kerninfo>

    grade_backtrace();
  10004c:	e8 8e 00 00 00       	call   1000df <grade_backtrace>

    pmm_init();                 // init physical memory management
  100051:	e8 6c 2c 00 00       	call   102cc2 <pmm_init>

    pic_init();                 // init interrupt controller
  100056:	e8 74 16 00 00       	call   1016cf <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005b:	e8 f9 17 00 00       	call   101859 <idt_init>

    clock_init();               // init clock interrupt
  100060:	e8 da 0c 00 00       	call   100d3f <clock_init>
    intr_enable();              // enable irq interrupt
  100065:	e8 c7 15 00 00       	call   101631 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  10006a:	e8 6b 01 00 00       	call   1001da <lab1_switch_test>

    /* do nothing */
    // int count = 0;
    while (1){
  10006f:	eb fe                	jmp    10006f <kern_init+0x6f>

00100071 <grade_backtrace2>:
	    // }
    }
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100071:	55                   	push   %ebp
  100072:	89 e5                	mov    %esp,%ebp
  100074:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100077:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007e:	00 
  10007f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100086:	00 
  100087:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008e:	e8 dc 0b 00 00       	call   100c6f <mon_backtrace>
}
  100093:	90                   	nop
  100094:	c9                   	leave  
  100095:	c3                   	ret    

00100096 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100096:	55                   	push   %ebp
  100097:	89 e5                	mov    %esp,%ebp
  100099:	53                   	push   %ebx
  10009a:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009d:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a0:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000a3:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000a6:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a9:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000ad:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b1:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000b5:	89 04 24             	mov    %eax,(%esp)
  1000b8:	e8 b4 ff ff ff       	call   100071 <grade_backtrace2>
}
  1000bd:	90                   	nop
  1000be:	83 c4 14             	add    $0x14,%esp
  1000c1:	5b                   	pop    %ebx
  1000c2:	5d                   	pop    %ebp
  1000c3:	c3                   	ret    

001000c4 <grade_backtrace0>:

void __attribute__((noinline))
  
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c4:	55                   	push   %ebp
  1000c5:	89 e5                	mov    %esp,%ebp
  1000c7:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000ca:	8b 45 10             	mov    0x10(%ebp),%eax
  1000cd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d4:	89 04 24             	mov    %eax,(%esp)
  1000d7:	e8 ba ff ff ff       	call   100096 <grade_backtrace1>
}
  1000dc:	90                   	nop
  1000dd:	c9                   	leave  
  1000de:	c3                   	ret    

001000df <grade_backtrace>:

void
grade_backtrace(void) {
  1000df:	55                   	push   %ebp
  1000e0:	89 e5                	mov    %esp,%ebp
  1000e2:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e5:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000ea:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f1:	ff 
  1000f2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000fd:	e8 c2 ff ff ff       	call   1000c4 <grade_backtrace0>
}
  100102:	90                   	nop
  100103:	c9                   	leave  
  100104:	c3                   	ret    

00100105 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100105:	55                   	push   %ebp
  100106:	89 e5                	mov    %esp,%ebp
  100108:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010b:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  10010e:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100111:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100114:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100117:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011b:	83 e0 03             	and    $0x3,%eax
  10011e:	89 c2                	mov    %eax,%edx
  100120:	a1 20 0a 11 00       	mov    0x110a20,%eax
  100125:	89 54 24 08          	mov    %edx,0x8(%esp)
  100129:	89 44 24 04          	mov    %eax,0x4(%esp)
  10012d:	c7 04 24 01 38 10 00 	movl   $0x103801,(%esp)
  100134:	e8 e4 01 00 00       	call   10031d <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100139:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013d:	89 c2                	mov    %eax,%edx
  10013f:	a1 20 0a 11 00       	mov    0x110a20,%eax
  100144:	89 54 24 08          	mov    %edx,0x8(%esp)
  100148:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014c:	c7 04 24 0f 38 10 00 	movl   $0x10380f,(%esp)
  100153:	e8 c5 01 00 00       	call   10031d <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100158:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015c:	89 c2                	mov    %eax,%edx
  10015e:	a1 20 0a 11 00       	mov    0x110a20,%eax
  100163:	89 54 24 08          	mov    %edx,0x8(%esp)
  100167:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016b:	c7 04 24 1d 38 10 00 	movl   $0x10381d,(%esp)
  100172:	e8 a6 01 00 00       	call   10031d <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100177:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017b:	89 c2                	mov    %eax,%edx
  10017d:	a1 20 0a 11 00       	mov    0x110a20,%eax
  100182:	89 54 24 08          	mov    %edx,0x8(%esp)
  100186:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018a:	c7 04 24 2b 38 10 00 	movl   $0x10382b,(%esp)
  100191:	e8 87 01 00 00       	call   10031d <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100196:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019a:	89 c2                	mov    %eax,%edx
  10019c:	a1 20 0a 11 00       	mov    0x110a20,%eax
  1001a1:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001a9:	c7 04 24 39 38 10 00 	movl   $0x103839,(%esp)
  1001b0:	e8 68 01 00 00       	call   10031d <cprintf>
    round ++;
  1001b5:	a1 20 0a 11 00       	mov    0x110a20,%eax
  1001ba:	40                   	inc    %eax
  1001bb:	a3 20 0a 11 00       	mov    %eax,0x110a20
}
  1001c0:	90                   	nop
  1001c1:	c9                   	leave  
  1001c2:	c3                   	ret    

001001c3 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c3:	55                   	push   %ebp
  1001c4:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO参照lab1_print_cur_status用内联汇编写
    //转成U的时候需要有ss和esp，要多pop并用这两个值更新ss和esp
    //所以先压两位栈，并在从中断返回后修复esp
    asm volatile (
  1001c6:	83 ec 08             	sub    $0x8,%esp
  1001c9:	cd 78                	int    $0x78
  1001cb:	89 ec                	mov    %ebp,%esp
	    "movl %%ebp, %%esp"//恢复栈指针
	    : 
	    : "i"(T_SWITCH_TOU)
	);

}
  1001cd:	90                   	nop
  1001ce:	5d                   	pop    %ebp
  1001cf:	c3                   	ret    

001001d0 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
    //从中断返回时，esp仍在TSS指示的堆栈中。所以要在从中断返回后修复esp
	//把tf->tf_cs和tf->tf_ds都设置为内核代码段和内核数据段
    asm volatile (
  1001d3:	cd 79                	int    $0x79
  1001d5:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"//int访问 T_SWITCH_TOK 中断
	    "movl %%ebp, %%esp \n"//强行改为内核态，会让cpu认为没有发生特权级转换，%esp的值就不对了
	    : 
	    : "i"(T_SWITCH_TOK)
	);
}
  1001d7:	90                   	nop
  1001d8:	5d                   	pop    %ebp
  1001d9:	c3                   	ret    

001001da <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001da:	55                   	push   %ebp
  1001db:	89 e5                	mov    %esp,%ebp
  1001dd:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001e0:	e8 20 ff ff ff       	call   100105 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001e5:	c7 04 24 48 38 10 00 	movl   $0x103848,(%esp)
  1001ec:	e8 2c 01 00 00       	call   10031d <cprintf>
    lab1_switch_to_user();
  1001f1:	e8 cd ff ff ff       	call   1001c3 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001f6:	e8 0a ff ff ff       	call   100105 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001fb:	c7 04 24 68 38 10 00 	movl   $0x103868,(%esp)
  100202:	e8 16 01 00 00       	call   10031d <cprintf>
    lab1_switch_to_kernel();
  100207:	e8 c4 ff ff ff       	call   1001d0 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  10020c:	e8 f4 fe ff ff       	call   100105 <lab1_print_cur_status>
}
  100211:	90                   	nop
  100212:	c9                   	leave  
  100213:	c3                   	ret    

00100214 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100214:	55                   	push   %ebp
  100215:	89 e5                	mov    %esp,%ebp
  100217:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10021a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10021e:	74 13                	je     100233 <readline+0x1f>
        cprintf("%s", prompt);
  100220:	8b 45 08             	mov    0x8(%ebp),%eax
  100223:	89 44 24 04          	mov    %eax,0x4(%esp)
  100227:	c7 04 24 87 38 10 00 	movl   $0x103887,(%esp)
  10022e:	e8 ea 00 00 00       	call   10031d <cprintf>
    }
    int i = 0, c;
  100233:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10023a:	e8 67 01 00 00       	call   1003a6 <getchar>
  10023f:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100242:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100246:	79 07                	jns    10024f <readline+0x3b>
            return NULL;
  100248:	b8 00 00 00 00       	mov    $0x0,%eax
  10024d:	eb 78                	jmp    1002c7 <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10024f:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100253:	7e 28                	jle    10027d <readline+0x69>
  100255:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  10025c:	7f 1f                	jg     10027d <readline+0x69>
            cputchar(c);
  10025e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100261:	89 04 24             	mov    %eax,(%esp)
  100264:	e8 da 00 00 00       	call   100343 <cputchar>
            buf[i ++] = c;
  100269:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10026c:	8d 50 01             	lea    0x1(%eax),%edx
  10026f:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100272:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100275:	88 90 40 0a 11 00    	mov    %dl,0x110a40(%eax)
  10027b:	eb 45                	jmp    1002c2 <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  10027d:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100281:	75 16                	jne    100299 <readline+0x85>
  100283:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100287:	7e 10                	jle    100299 <readline+0x85>
            cputchar(c);
  100289:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10028c:	89 04 24             	mov    %eax,(%esp)
  10028f:	e8 af 00 00 00       	call   100343 <cputchar>
            i --;
  100294:	ff 4d f4             	decl   -0xc(%ebp)
  100297:	eb 29                	jmp    1002c2 <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  100299:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  10029d:	74 06                	je     1002a5 <readline+0x91>
  10029f:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1002a3:	75 95                	jne    10023a <readline+0x26>
            cputchar(c);
  1002a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002a8:	89 04 24             	mov    %eax,(%esp)
  1002ab:	e8 93 00 00 00       	call   100343 <cputchar>
            buf[i] = '\0';
  1002b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002b3:	05 40 0a 11 00       	add    $0x110a40,%eax
  1002b8:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002bb:	b8 40 0a 11 00       	mov    $0x110a40,%eax
  1002c0:	eb 05                	jmp    1002c7 <readline+0xb3>
        c = getchar();
  1002c2:	e9 73 ff ff ff       	jmp    10023a <readline+0x26>
        }
    }
}
  1002c7:	c9                   	leave  
  1002c8:	c3                   	ret    

001002c9 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002c9:	55                   	push   %ebp
  1002ca:	89 e5                	mov    %esp,%ebp
  1002cc:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1002d2:	89 04 24             	mov    %eax,(%esp)
  1002d5:	e8 d1 12 00 00       	call   1015ab <cons_putc>
    (*cnt) ++;
  1002da:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002dd:	8b 00                	mov    (%eax),%eax
  1002df:	8d 50 01             	lea    0x1(%eax),%edx
  1002e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002e5:	89 10                	mov    %edx,(%eax)
}
  1002e7:	90                   	nop
  1002e8:	c9                   	leave  
  1002e9:	c3                   	ret    

001002ea <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002ea:	55                   	push   %ebp
  1002eb:	89 e5                	mov    %esp,%ebp
  1002ed:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002fa:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002fe:	8b 45 08             	mov    0x8(%ebp),%eax
  100301:	89 44 24 08          	mov    %eax,0x8(%esp)
  100305:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100308:	89 44 24 04          	mov    %eax,0x4(%esp)
  10030c:	c7 04 24 c9 02 10 00 	movl   $0x1002c9,(%esp)
  100313:	e8 7a 2b 00 00       	call   102e92 <vprintfmt>
    return cnt;
  100318:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10031b:	c9                   	leave  
  10031c:	c3                   	ret    

0010031d <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10031d:	55                   	push   %ebp
  10031e:	89 e5                	mov    %esp,%ebp
  100320:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100323:	8d 45 0c             	lea    0xc(%ebp),%eax
  100326:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100329:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10032c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100330:	8b 45 08             	mov    0x8(%ebp),%eax
  100333:	89 04 24             	mov    %eax,(%esp)
  100336:	e8 af ff ff ff       	call   1002ea <vcprintf>
  10033b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10033e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100341:	c9                   	leave  
  100342:	c3                   	ret    

00100343 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100343:	55                   	push   %ebp
  100344:	89 e5                	mov    %esp,%ebp
  100346:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100349:	8b 45 08             	mov    0x8(%ebp),%eax
  10034c:	89 04 24             	mov    %eax,(%esp)
  10034f:	e8 57 12 00 00       	call   1015ab <cons_putc>
}
  100354:	90                   	nop
  100355:	c9                   	leave  
  100356:	c3                   	ret    

00100357 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100357:	55                   	push   %ebp
  100358:	89 e5                	mov    %esp,%ebp
  10035a:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10035d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100364:	eb 13                	jmp    100379 <cputs+0x22>
        cputch(c, &cnt);
  100366:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10036a:	8d 55 f0             	lea    -0x10(%ebp),%edx
  10036d:	89 54 24 04          	mov    %edx,0x4(%esp)
  100371:	89 04 24             	mov    %eax,(%esp)
  100374:	e8 50 ff ff ff       	call   1002c9 <cputch>
    while ((c = *str ++) != '\0') {
  100379:	8b 45 08             	mov    0x8(%ebp),%eax
  10037c:	8d 50 01             	lea    0x1(%eax),%edx
  10037f:	89 55 08             	mov    %edx,0x8(%ebp)
  100382:	0f b6 00             	movzbl (%eax),%eax
  100385:	88 45 f7             	mov    %al,-0x9(%ebp)
  100388:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  10038c:	75 d8                	jne    100366 <cputs+0xf>
    }
    cputch('\n', &cnt);
  10038e:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100391:	89 44 24 04          	mov    %eax,0x4(%esp)
  100395:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  10039c:	e8 28 ff ff ff       	call   1002c9 <cputch>
    return cnt;
  1003a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1003a4:	c9                   	leave  
  1003a5:	c3                   	ret    

001003a6 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1003a6:	55                   	push   %ebp
  1003a7:	89 e5                	mov    %esp,%ebp
  1003a9:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003ac:	90                   	nop
  1003ad:	e8 23 12 00 00       	call   1015d5 <cons_getc>
  1003b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003b9:	74 f2                	je     1003ad <getchar+0x7>
        /* do nothing */;
    return c;
  1003bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003be:	c9                   	leave  
  1003bf:	c3                   	ret    

001003c0 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003c0:	55                   	push   %ebp
  1003c1:	89 e5                	mov    %esp,%ebp
  1003c3:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003c9:	8b 00                	mov    (%eax),%eax
  1003cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003ce:	8b 45 10             	mov    0x10(%ebp),%eax
  1003d1:	8b 00                	mov    (%eax),%eax
  1003d3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003dd:	e9 ca 00 00 00       	jmp    1004ac <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  1003e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003e8:	01 d0                	add    %edx,%eax
  1003ea:	89 c2                	mov    %eax,%edx
  1003ec:	c1 ea 1f             	shr    $0x1f,%edx
  1003ef:	01 d0                	add    %edx,%eax
  1003f1:	d1 f8                	sar    %eax
  1003f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003f9:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003fc:	eb 03                	jmp    100401 <stab_binsearch+0x41>
            m --;
  1003fe:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  100401:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100404:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100407:	7c 1f                	jl     100428 <stab_binsearch+0x68>
  100409:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10040c:	89 d0                	mov    %edx,%eax
  10040e:	01 c0                	add    %eax,%eax
  100410:	01 d0                	add    %edx,%eax
  100412:	c1 e0 02             	shl    $0x2,%eax
  100415:	89 c2                	mov    %eax,%edx
  100417:	8b 45 08             	mov    0x8(%ebp),%eax
  10041a:	01 d0                	add    %edx,%eax
  10041c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100420:	0f b6 c0             	movzbl %al,%eax
  100423:	39 45 14             	cmp    %eax,0x14(%ebp)
  100426:	75 d6                	jne    1003fe <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  100428:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10042b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10042e:	7d 09                	jge    100439 <stab_binsearch+0x79>
            l = true_m + 1;
  100430:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100433:	40                   	inc    %eax
  100434:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100437:	eb 73                	jmp    1004ac <stab_binsearch+0xec>
        }

        // actual binary search
        any_matches = 1;
  100439:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100440:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100443:	89 d0                	mov    %edx,%eax
  100445:	01 c0                	add    %eax,%eax
  100447:	01 d0                	add    %edx,%eax
  100449:	c1 e0 02             	shl    $0x2,%eax
  10044c:	89 c2                	mov    %eax,%edx
  10044e:	8b 45 08             	mov    0x8(%ebp),%eax
  100451:	01 d0                	add    %edx,%eax
  100453:	8b 40 08             	mov    0x8(%eax),%eax
  100456:	39 45 18             	cmp    %eax,0x18(%ebp)
  100459:	76 11                	jbe    10046c <stab_binsearch+0xac>
            *region_left = m;
  10045b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10045e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100461:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100463:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100466:	40                   	inc    %eax
  100467:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10046a:	eb 40                	jmp    1004ac <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  10046c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10046f:	89 d0                	mov    %edx,%eax
  100471:	01 c0                	add    %eax,%eax
  100473:	01 d0                	add    %edx,%eax
  100475:	c1 e0 02             	shl    $0x2,%eax
  100478:	89 c2                	mov    %eax,%edx
  10047a:	8b 45 08             	mov    0x8(%ebp),%eax
  10047d:	01 d0                	add    %edx,%eax
  10047f:	8b 40 08             	mov    0x8(%eax),%eax
  100482:	39 45 18             	cmp    %eax,0x18(%ebp)
  100485:	73 14                	jae    10049b <stab_binsearch+0xdb>
            *region_right = m - 1;
  100487:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10048a:	8d 50 ff             	lea    -0x1(%eax),%edx
  10048d:	8b 45 10             	mov    0x10(%ebp),%eax
  100490:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100492:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100495:	48                   	dec    %eax
  100496:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100499:	eb 11                	jmp    1004ac <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10049b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10049e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004a1:	89 10                	mov    %edx,(%eax)
            l = m;
  1004a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a6:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004a9:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1004ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004af:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004b2:	0f 8e 2a ff ff ff    	jle    1003e2 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  1004b8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004bc:	75 0f                	jne    1004cd <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  1004be:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004c1:	8b 00                	mov    (%eax),%eax
  1004c3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004c6:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c9:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1004cb:	eb 3e                	jmp    10050b <stab_binsearch+0x14b>
        l = *region_right;
  1004cd:	8b 45 10             	mov    0x10(%ebp),%eax
  1004d0:	8b 00                	mov    (%eax),%eax
  1004d2:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004d5:	eb 03                	jmp    1004da <stab_binsearch+0x11a>
  1004d7:	ff 4d fc             	decl   -0x4(%ebp)
  1004da:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004dd:	8b 00                	mov    (%eax),%eax
  1004df:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1004e2:	7e 1f                	jle    100503 <stab_binsearch+0x143>
  1004e4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004e7:	89 d0                	mov    %edx,%eax
  1004e9:	01 c0                	add    %eax,%eax
  1004eb:	01 d0                	add    %edx,%eax
  1004ed:	c1 e0 02             	shl    $0x2,%eax
  1004f0:	89 c2                	mov    %eax,%edx
  1004f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f5:	01 d0                	add    %edx,%eax
  1004f7:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004fb:	0f b6 c0             	movzbl %al,%eax
  1004fe:	39 45 14             	cmp    %eax,0x14(%ebp)
  100501:	75 d4                	jne    1004d7 <stab_binsearch+0x117>
        *region_left = l;
  100503:	8b 45 0c             	mov    0xc(%ebp),%eax
  100506:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100509:	89 10                	mov    %edx,(%eax)
}
  10050b:	90                   	nop
  10050c:	c9                   	leave  
  10050d:	c3                   	ret    

0010050e <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10050e:	55                   	push   %ebp
  10050f:	89 e5                	mov    %esp,%ebp
  100511:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100514:	8b 45 0c             	mov    0xc(%ebp),%eax
  100517:	c7 00 8c 38 10 00    	movl   $0x10388c,(%eax)
    info->eip_line = 0;
  10051d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100520:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100527:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052a:	c7 40 08 8c 38 10 00 	movl   $0x10388c,0x8(%eax)
    info->eip_fn_namelen = 9;
  100531:	8b 45 0c             	mov    0xc(%ebp),%eax
  100534:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10053b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10053e:	8b 55 08             	mov    0x8(%ebp),%edx
  100541:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100544:	8b 45 0c             	mov    0xc(%ebp),%eax
  100547:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10054e:	c7 45 f4 0c 41 10 00 	movl   $0x10410c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100555:	c7 45 f0 18 d4 10 00 	movl   $0x10d418,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10055c:	c7 45 ec 19 d4 10 00 	movl   $0x10d419,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100563:	c7 45 e8 37 f5 10 00 	movl   $0x10f537,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10056a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10056d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100570:	76 0b                	jbe    10057d <debuginfo_eip+0x6f>
  100572:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100575:	48                   	dec    %eax
  100576:	0f b6 00             	movzbl (%eax),%eax
  100579:	84 c0                	test   %al,%al
  10057b:	74 0a                	je     100587 <debuginfo_eip+0x79>
        return -1;
  10057d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100582:	e9 ab 02 00 00       	jmp    100832 <debuginfo_eip+0x324>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100587:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10058e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100591:	2b 45 f4             	sub    -0xc(%ebp),%eax
  100594:	c1 f8 02             	sar    $0x2,%eax
  100597:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10059d:	48                   	dec    %eax
  10059e:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a4:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005a8:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005af:	00 
  1005b0:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005b3:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005b7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005ba:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005c1:	89 04 24             	mov    %eax,(%esp)
  1005c4:	e8 f7 fd ff ff       	call   1003c0 <stab_binsearch>
    if (lfile == 0)
  1005c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005cc:	85 c0                	test   %eax,%eax
  1005ce:	75 0a                	jne    1005da <debuginfo_eip+0xcc>
        return -1;
  1005d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005d5:	e9 58 02 00 00       	jmp    100832 <debuginfo_eip+0x324>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005dd:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005e0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005e3:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1005e9:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005ed:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005f4:	00 
  1005f5:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005f8:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005fc:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1005ff:	89 44 24 04          	mov    %eax,0x4(%esp)
  100603:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100606:	89 04 24             	mov    %eax,(%esp)
  100609:	e8 b2 fd ff ff       	call   1003c0 <stab_binsearch>

    if (lfun <= rfun) {
  10060e:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100611:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100614:	39 c2                	cmp    %eax,%edx
  100616:	7f 78                	jg     100690 <debuginfo_eip+0x182>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  100618:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10061b:	89 c2                	mov    %eax,%edx
  10061d:	89 d0                	mov    %edx,%eax
  10061f:	01 c0                	add    %eax,%eax
  100621:	01 d0                	add    %edx,%eax
  100623:	c1 e0 02             	shl    $0x2,%eax
  100626:	89 c2                	mov    %eax,%edx
  100628:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10062b:	01 d0                	add    %edx,%eax
  10062d:	8b 10                	mov    (%eax),%edx
  10062f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100632:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100635:	39 c2                	cmp    %eax,%edx
  100637:	73 22                	jae    10065b <debuginfo_eip+0x14d>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100639:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10063c:	89 c2                	mov    %eax,%edx
  10063e:	89 d0                	mov    %edx,%eax
  100640:	01 c0                	add    %eax,%eax
  100642:	01 d0                	add    %edx,%eax
  100644:	c1 e0 02             	shl    $0x2,%eax
  100647:	89 c2                	mov    %eax,%edx
  100649:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10064c:	01 d0                	add    %edx,%eax
  10064e:	8b 10                	mov    (%eax),%edx
  100650:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100653:	01 c2                	add    %eax,%edx
  100655:	8b 45 0c             	mov    0xc(%ebp),%eax
  100658:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10065b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10065e:	89 c2                	mov    %eax,%edx
  100660:	89 d0                	mov    %edx,%eax
  100662:	01 c0                	add    %eax,%eax
  100664:	01 d0                	add    %edx,%eax
  100666:	c1 e0 02             	shl    $0x2,%eax
  100669:	89 c2                	mov    %eax,%edx
  10066b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10066e:	01 d0                	add    %edx,%eax
  100670:	8b 50 08             	mov    0x8(%eax),%edx
  100673:	8b 45 0c             	mov    0xc(%ebp),%eax
  100676:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100679:	8b 45 0c             	mov    0xc(%ebp),%eax
  10067c:	8b 40 10             	mov    0x10(%eax),%eax
  10067f:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100682:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100685:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100688:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10068b:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10068e:	eb 15                	jmp    1006a5 <debuginfo_eip+0x197>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100690:	8b 45 0c             	mov    0xc(%ebp),%eax
  100693:	8b 55 08             	mov    0x8(%ebp),%edx
  100696:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100699:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10069c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  10069f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006a5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006a8:	8b 40 08             	mov    0x8(%eax),%eax
  1006ab:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006b2:	00 
  1006b3:	89 04 24             	mov    %eax,(%esp)
  1006b6:	e8 18 2e 00 00       	call   1034d3 <strfind>
  1006bb:	8b 55 0c             	mov    0xc(%ebp),%edx
  1006be:	8b 52 08             	mov    0x8(%edx),%edx
  1006c1:	29 d0                	sub    %edx,%eax
  1006c3:	89 c2                	mov    %eax,%edx
  1006c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c8:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1006ce:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006d2:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006d9:	00 
  1006da:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006dd:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006e1:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006e4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006eb:	89 04 24             	mov    %eax,(%esp)
  1006ee:	e8 cd fc ff ff       	call   1003c0 <stab_binsearch>
    if (lline <= rline) {
  1006f3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006f6:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1006f9:	39 c2                	cmp    %eax,%edx
  1006fb:	7f 23                	jg     100720 <debuginfo_eip+0x212>
        info->eip_line = stabs[rline].n_desc;
  1006fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100700:	89 c2                	mov    %eax,%edx
  100702:	89 d0                	mov    %edx,%eax
  100704:	01 c0                	add    %eax,%eax
  100706:	01 d0                	add    %edx,%eax
  100708:	c1 e0 02             	shl    $0x2,%eax
  10070b:	89 c2                	mov    %eax,%edx
  10070d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100710:	01 d0                	add    %edx,%eax
  100712:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100716:	89 c2                	mov    %eax,%edx
  100718:	8b 45 0c             	mov    0xc(%ebp),%eax
  10071b:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10071e:	eb 11                	jmp    100731 <debuginfo_eip+0x223>
        return -1;
  100720:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100725:	e9 08 01 00 00       	jmp    100832 <debuginfo_eip+0x324>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  10072a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10072d:	48                   	dec    %eax
  10072e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100731:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100734:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100737:	39 c2                	cmp    %eax,%edx
  100739:	7c 56                	jl     100791 <debuginfo_eip+0x283>
           && stabs[lline].n_type != N_SOL
  10073b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10073e:	89 c2                	mov    %eax,%edx
  100740:	89 d0                	mov    %edx,%eax
  100742:	01 c0                	add    %eax,%eax
  100744:	01 d0                	add    %edx,%eax
  100746:	c1 e0 02             	shl    $0x2,%eax
  100749:	89 c2                	mov    %eax,%edx
  10074b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10074e:	01 d0                	add    %edx,%eax
  100750:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100754:	3c 84                	cmp    $0x84,%al
  100756:	74 39                	je     100791 <debuginfo_eip+0x283>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100758:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10075b:	89 c2                	mov    %eax,%edx
  10075d:	89 d0                	mov    %edx,%eax
  10075f:	01 c0                	add    %eax,%eax
  100761:	01 d0                	add    %edx,%eax
  100763:	c1 e0 02             	shl    $0x2,%eax
  100766:	89 c2                	mov    %eax,%edx
  100768:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10076b:	01 d0                	add    %edx,%eax
  10076d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100771:	3c 64                	cmp    $0x64,%al
  100773:	75 b5                	jne    10072a <debuginfo_eip+0x21c>
  100775:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100778:	89 c2                	mov    %eax,%edx
  10077a:	89 d0                	mov    %edx,%eax
  10077c:	01 c0                	add    %eax,%eax
  10077e:	01 d0                	add    %edx,%eax
  100780:	c1 e0 02             	shl    $0x2,%eax
  100783:	89 c2                	mov    %eax,%edx
  100785:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100788:	01 d0                	add    %edx,%eax
  10078a:	8b 40 08             	mov    0x8(%eax),%eax
  10078d:	85 c0                	test   %eax,%eax
  10078f:	74 99                	je     10072a <debuginfo_eip+0x21c>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100791:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100794:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100797:	39 c2                	cmp    %eax,%edx
  100799:	7c 42                	jl     1007dd <debuginfo_eip+0x2cf>
  10079b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10079e:	89 c2                	mov    %eax,%edx
  1007a0:	89 d0                	mov    %edx,%eax
  1007a2:	01 c0                	add    %eax,%eax
  1007a4:	01 d0                	add    %edx,%eax
  1007a6:	c1 e0 02             	shl    $0x2,%eax
  1007a9:	89 c2                	mov    %eax,%edx
  1007ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007ae:	01 d0                	add    %edx,%eax
  1007b0:	8b 10                	mov    (%eax),%edx
  1007b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1007b5:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1007b8:	39 c2                	cmp    %eax,%edx
  1007ba:	73 21                	jae    1007dd <debuginfo_eip+0x2cf>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007bc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007bf:	89 c2                	mov    %eax,%edx
  1007c1:	89 d0                	mov    %edx,%eax
  1007c3:	01 c0                	add    %eax,%eax
  1007c5:	01 d0                	add    %edx,%eax
  1007c7:	c1 e0 02             	shl    $0x2,%eax
  1007ca:	89 c2                	mov    %eax,%edx
  1007cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007cf:	01 d0                	add    %edx,%eax
  1007d1:	8b 10                	mov    (%eax),%edx
  1007d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007d6:	01 c2                	add    %eax,%edx
  1007d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007db:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007dd:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007e3:	39 c2                	cmp    %eax,%edx
  1007e5:	7d 46                	jge    10082d <debuginfo_eip+0x31f>
        for (lline = lfun + 1;
  1007e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007ea:	40                   	inc    %eax
  1007eb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007ee:	eb 16                	jmp    100806 <debuginfo_eip+0x2f8>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1007f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007f3:	8b 40 14             	mov    0x14(%eax),%eax
  1007f6:	8d 50 01             	lea    0x1(%eax),%edx
  1007f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007fc:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  1007ff:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100802:	40                   	inc    %eax
  100803:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100806:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100809:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  10080c:	39 c2                	cmp    %eax,%edx
  10080e:	7d 1d                	jge    10082d <debuginfo_eip+0x31f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100810:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100813:	89 c2                	mov    %eax,%edx
  100815:	89 d0                	mov    %edx,%eax
  100817:	01 c0                	add    %eax,%eax
  100819:	01 d0                	add    %edx,%eax
  10081b:	c1 e0 02             	shl    $0x2,%eax
  10081e:	89 c2                	mov    %eax,%edx
  100820:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100823:	01 d0                	add    %edx,%eax
  100825:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100829:	3c a0                	cmp    $0xa0,%al
  10082b:	74 c3                	je     1007f0 <debuginfo_eip+0x2e2>
        }
    }
    return 0;
  10082d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100832:	c9                   	leave  
  100833:	c3                   	ret    

00100834 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100834:	55                   	push   %ebp
  100835:	89 e5                	mov    %esp,%ebp
  100837:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10083a:	c7 04 24 96 38 10 00 	movl   $0x103896,(%esp)
  100841:	e8 d7 fa ff ff       	call   10031d <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100846:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10084d:	00 
  10084e:	c7 04 24 af 38 10 00 	movl   $0x1038af,(%esp)
  100855:	e8 c3 fa ff ff       	call   10031d <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10085a:	c7 44 24 04 de 37 10 	movl   $0x1037de,0x4(%esp)
  100861:	00 
  100862:	c7 04 24 c7 38 10 00 	movl   $0x1038c7,(%esp)
  100869:	e8 af fa ff ff       	call   10031d <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10086e:	c7 44 24 04 16 0a 11 	movl   $0x110a16,0x4(%esp)
  100875:	00 
  100876:	c7 04 24 df 38 10 00 	movl   $0x1038df,(%esp)
  10087d:	e8 9b fa ff ff       	call   10031d <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100882:	c7 44 24 04 a0 1d 11 	movl   $0x111da0,0x4(%esp)
  100889:	00 
  10088a:	c7 04 24 f7 38 10 00 	movl   $0x1038f7,(%esp)
  100891:	e8 87 fa ff ff       	call   10031d <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100896:	b8 a0 1d 11 00       	mov    $0x111da0,%eax
  10089b:	2d 00 00 10 00       	sub    $0x100000,%eax
  1008a0:	05 ff 03 00 00       	add    $0x3ff,%eax
  1008a5:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008ab:	85 c0                	test   %eax,%eax
  1008ad:	0f 48 c2             	cmovs  %edx,%eax
  1008b0:	c1 f8 0a             	sar    $0xa,%eax
  1008b3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008b7:	c7 04 24 10 39 10 00 	movl   $0x103910,(%esp)
  1008be:	e8 5a fa ff ff       	call   10031d <cprintf>
}
  1008c3:	90                   	nop
  1008c4:	c9                   	leave  
  1008c5:	c3                   	ret    

001008c6 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008c6:	55                   	push   %ebp
  1008c7:	89 e5                	mov    %esp,%ebp
  1008c9:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008cf:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008d2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1008d9:	89 04 24             	mov    %eax,(%esp)
  1008dc:	e8 2d fc ff ff       	call   10050e <debuginfo_eip>
  1008e1:	85 c0                	test   %eax,%eax
  1008e3:	74 15                	je     1008fa <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1008e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ec:	c7 04 24 3a 39 10 00 	movl   $0x10393a,(%esp)
  1008f3:	e8 25 fa ff ff       	call   10031d <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1008f8:	eb 6c                	jmp    100966 <print_debuginfo+0xa0>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1008fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100901:	eb 1b                	jmp    10091e <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  100903:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100906:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100909:	01 d0                	add    %edx,%eax
  10090b:	0f b6 10             	movzbl (%eax),%edx
  10090e:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100914:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100917:	01 c8                	add    %ecx,%eax
  100919:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  10091b:	ff 45 f4             	incl   -0xc(%ebp)
  10091e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100921:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100924:	7c dd                	jl     100903 <print_debuginfo+0x3d>
        fnname[j] = '\0';
  100926:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  10092c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10092f:	01 d0                	add    %edx,%eax
  100931:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100934:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100937:	8b 55 08             	mov    0x8(%ebp),%edx
  10093a:	89 d1                	mov    %edx,%ecx
  10093c:	29 c1                	sub    %eax,%ecx
  10093e:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100941:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100944:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100948:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10094e:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100952:	89 54 24 08          	mov    %edx,0x8(%esp)
  100956:	89 44 24 04          	mov    %eax,0x4(%esp)
  10095a:	c7 04 24 56 39 10 00 	movl   $0x103956,(%esp)
  100961:	e8 b7 f9 ff ff       	call   10031d <cprintf>
}
  100966:	90                   	nop
  100967:	c9                   	leave  
  100968:	c3                   	ret    

00100969 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100969:	55                   	push   %ebp
  10096a:	89 e5                	mov    %esp,%ebp
  10096c:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  10096f:	8b 45 04             	mov    0x4(%ebp),%eax
  100972:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100975:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100978:	c9                   	leave  
  100979:	c3                   	ret    

0010097a <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  10097a:	55                   	push   %ebp
  10097b:	89 e5                	mov    %esp,%ebp
  10097d:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100980:	89 e8                	mov    %ebp,%eax
  100982:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100985:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
     uint32_t ebp=read_ebp(),eip=read_eip();//获取当前ebp(内联)和eip(非内联)
  100988:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10098b:	e8 d9 ff ff ff       	call   100969 <read_eip>
  100990:	89 45 f0             	mov    %eax,-0x10(%ebp)
     for(int i=0;i<STACKFRAME_DEPTH && ebp!=0;i++)
  100993:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  10099a:	e9 84 00 00 00       	jmp    100a23 <print_stackframe+0xa9>
    //  ebp不为0就变成最一开始的那个值，如果去掉这个条件会反复输出同一个函数的信息<UNKNOWN>
     {
         cprintf("ebp:0x%08x eip:0x%08x args:",ebp,eip);
  10099f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009a2:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009a9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ad:	c7 04 24 68 39 10 00 	movl   $0x103968,(%esp)
  1009b4:	e8 64 f9 ff ff       	call   10031d <cprintf>
         // ebp向上移动4个字节为eip,eip上方是函数参数
         uint32_t *arguments=(uint32_t *)ebp+2;
  1009b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009bc:	83 c0 08             	add    $0x8,%eax
  1009bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
         for(int j=0;j<4;j++)
  1009c2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  1009c9:	eb 24                	jmp    1009ef <print_stackframe+0x75>
         {
             cprintf("0x%08x ",arguments[j]);
  1009cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009ce:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1009d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1009d8:	01 d0                	add    %edx,%eax
  1009da:	8b 00                	mov    (%eax),%eax
  1009dc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009e0:	c7 04 24 84 39 10 00 	movl   $0x103984,(%esp)
  1009e7:	e8 31 f9 ff ff       	call   10031d <cprintf>
         for(int j=0;j<4;j++)
  1009ec:	ff 45 e8             	incl   -0x18(%ebp)
  1009ef:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  1009f3:	7e d6                	jle    1009cb <print_stackframe+0x51>
         }
         cprintf("\n");
  1009f5:	c7 04 24 8c 39 10 00 	movl   $0x10398c,(%esp)
  1009fc:	e8 1c f9 ff ff       	call   10031d <cprintf>
         print_debuginfo(eip-1);//eip存地址,eip-1是函数所在
  100a01:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a04:	48                   	dec    %eax
  100a05:	89 04 24             	mov    %eax,(%esp)
  100a08:	e8 b9 fe ff ff       	call   1008c6 <print_debuginfo>
         //打印文件名行数函数名地址间距
         eip=((uint32_t *)ebp)[1];
  100a0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a10:	83 c0 04             	add    $0x4,%eax
  100a13:	8b 00                	mov    (%eax),%eax
  100a15:	89 45 f0             	mov    %eax,-0x10(%ebp)
         // ebp指针指向的位置存储的上一个ebp的地址
         ebp=((uint32_t *)ebp)[0];
  100a18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a1b:	8b 00                	mov    (%eax),%eax
  100a1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
     for(int i=0;i<STACKFRAME_DEPTH && ebp!=0;i++)
  100a20:	ff 45 ec             	incl   -0x14(%ebp)
  100a23:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100a27:	7f 0a                	jg     100a33 <print_stackframe+0xb9>
  100a29:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a2d:	0f 85 6c ff ff ff    	jne    10099f <print_stackframe+0x25>
     }
}
  100a33:	90                   	nop
  100a34:	c9                   	leave  
  100a35:	c3                   	ret    

00100a36 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a36:	55                   	push   %ebp
  100a37:	89 e5                	mov    %esp,%ebp
  100a39:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a3c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a43:	eb 0c                	jmp    100a51 <parse+0x1b>
            *buf ++ = '\0';
  100a45:	8b 45 08             	mov    0x8(%ebp),%eax
  100a48:	8d 50 01             	lea    0x1(%eax),%edx
  100a4b:	89 55 08             	mov    %edx,0x8(%ebp)
  100a4e:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a51:	8b 45 08             	mov    0x8(%ebp),%eax
  100a54:	0f b6 00             	movzbl (%eax),%eax
  100a57:	84 c0                	test   %al,%al
  100a59:	74 1d                	je     100a78 <parse+0x42>
  100a5b:	8b 45 08             	mov    0x8(%ebp),%eax
  100a5e:	0f b6 00             	movzbl (%eax),%eax
  100a61:	0f be c0             	movsbl %al,%eax
  100a64:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a68:	c7 04 24 10 3a 10 00 	movl   $0x103a10,(%esp)
  100a6f:	e8 2d 2a 00 00       	call   1034a1 <strchr>
  100a74:	85 c0                	test   %eax,%eax
  100a76:	75 cd                	jne    100a45 <parse+0xf>
        }
        if (*buf == '\0') {
  100a78:	8b 45 08             	mov    0x8(%ebp),%eax
  100a7b:	0f b6 00             	movzbl (%eax),%eax
  100a7e:	84 c0                	test   %al,%al
  100a80:	74 65                	je     100ae7 <parse+0xb1>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a82:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a86:	75 14                	jne    100a9c <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a88:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100a8f:	00 
  100a90:	c7 04 24 15 3a 10 00 	movl   $0x103a15,(%esp)
  100a97:	e8 81 f8 ff ff       	call   10031d <cprintf>
        }
        argv[argc ++] = buf;
  100a9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a9f:	8d 50 01             	lea    0x1(%eax),%edx
  100aa2:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100aa5:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100aac:	8b 45 0c             	mov    0xc(%ebp),%eax
  100aaf:	01 c2                	add    %eax,%edx
  100ab1:	8b 45 08             	mov    0x8(%ebp),%eax
  100ab4:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ab6:	eb 03                	jmp    100abb <parse+0x85>
            buf ++;
  100ab8:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100abb:	8b 45 08             	mov    0x8(%ebp),%eax
  100abe:	0f b6 00             	movzbl (%eax),%eax
  100ac1:	84 c0                	test   %al,%al
  100ac3:	74 8c                	je     100a51 <parse+0x1b>
  100ac5:	8b 45 08             	mov    0x8(%ebp),%eax
  100ac8:	0f b6 00             	movzbl (%eax),%eax
  100acb:	0f be c0             	movsbl %al,%eax
  100ace:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ad2:	c7 04 24 10 3a 10 00 	movl   $0x103a10,(%esp)
  100ad9:	e8 c3 29 00 00       	call   1034a1 <strchr>
  100ade:	85 c0                	test   %eax,%eax
  100ae0:	74 d6                	je     100ab8 <parse+0x82>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100ae2:	e9 6a ff ff ff       	jmp    100a51 <parse+0x1b>
            break;
  100ae7:	90                   	nop
        }
    }
    return argc;
  100ae8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100aeb:	c9                   	leave  
  100aec:	c3                   	ret    

00100aed <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100aed:	55                   	push   %ebp
  100aee:	89 e5                	mov    %esp,%ebp
  100af0:	53                   	push   %ebx
  100af1:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100af4:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100af7:	89 44 24 04          	mov    %eax,0x4(%esp)
  100afb:	8b 45 08             	mov    0x8(%ebp),%eax
  100afe:	89 04 24             	mov    %eax,(%esp)
  100b01:	e8 30 ff ff ff       	call   100a36 <parse>
  100b06:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b09:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b0d:	75 0a                	jne    100b19 <runcmd+0x2c>
        return 0;
  100b0f:	b8 00 00 00 00       	mov    $0x0,%eax
  100b14:	e9 83 00 00 00       	jmp    100b9c <runcmd+0xaf>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b19:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b20:	eb 5a                	jmp    100b7c <runcmd+0x8f>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b22:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b25:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b28:	89 d0                	mov    %edx,%eax
  100b2a:	01 c0                	add    %eax,%eax
  100b2c:	01 d0                	add    %edx,%eax
  100b2e:	c1 e0 02             	shl    $0x2,%eax
  100b31:	05 00 00 11 00       	add    $0x110000,%eax
  100b36:	8b 00                	mov    (%eax),%eax
  100b38:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b3c:	89 04 24             	mov    %eax,(%esp)
  100b3f:	e8 c1 28 00 00       	call   103405 <strcmp>
  100b44:	85 c0                	test   %eax,%eax
  100b46:	75 31                	jne    100b79 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b48:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b4b:	89 d0                	mov    %edx,%eax
  100b4d:	01 c0                	add    %eax,%eax
  100b4f:	01 d0                	add    %edx,%eax
  100b51:	c1 e0 02             	shl    $0x2,%eax
  100b54:	05 08 00 11 00       	add    $0x110008,%eax
  100b59:	8b 10                	mov    (%eax),%edx
  100b5b:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b5e:	83 c0 04             	add    $0x4,%eax
  100b61:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100b64:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100b67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100b6a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100b6e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b72:	89 1c 24             	mov    %ebx,(%esp)
  100b75:	ff d2                	call   *%edx
  100b77:	eb 23                	jmp    100b9c <runcmd+0xaf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100b79:	ff 45 f4             	incl   -0xc(%ebp)
  100b7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b7f:	83 f8 02             	cmp    $0x2,%eax
  100b82:	76 9e                	jbe    100b22 <runcmd+0x35>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b84:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b87:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b8b:	c7 04 24 33 3a 10 00 	movl   $0x103a33,(%esp)
  100b92:	e8 86 f7 ff ff       	call   10031d <cprintf>
    return 0;
  100b97:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100b9c:	83 c4 64             	add    $0x64,%esp
  100b9f:	5b                   	pop    %ebx
  100ba0:	5d                   	pop    %ebp
  100ba1:	c3                   	ret    

00100ba2 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100ba2:	55                   	push   %ebp
  100ba3:	89 e5                	mov    %esp,%ebp
  100ba5:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100ba8:	c7 04 24 4c 3a 10 00 	movl   $0x103a4c,(%esp)
  100baf:	e8 69 f7 ff ff       	call   10031d <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bb4:	c7 04 24 74 3a 10 00 	movl   $0x103a74,(%esp)
  100bbb:	e8 5d f7 ff ff       	call   10031d <cprintf>

    if (tf != NULL) {
  100bc0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100bc4:	74 0b                	je     100bd1 <kmonitor+0x2f>
        print_trapframe(tf);
  100bc6:	8b 45 08             	mov    0x8(%ebp),%eax
  100bc9:	89 04 24             	mov    %eax,(%esp)
  100bcc:	e8 3e 0e 00 00       	call   101a0f <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bd1:	c7 04 24 99 3a 10 00 	movl   $0x103a99,(%esp)
  100bd8:	e8 37 f6 ff ff       	call   100214 <readline>
  100bdd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100be0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100be4:	74 eb                	je     100bd1 <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100be6:	8b 45 08             	mov    0x8(%ebp),%eax
  100be9:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bf0:	89 04 24             	mov    %eax,(%esp)
  100bf3:	e8 f5 fe ff ff       	call   100aed <runcmd>
  100bf8:	85 c0                	test   %eax,%eax
  100bfa:	78 02                	js     100bfe <kmonitor+0x5c>
        if ((buf = readline("K> ")) != NULL) {
  100bfc:	eb d3                	jmp    100bd1 <kmonitor+0x2f>
                break;
  100bfe:	90                   	nop
            }
        }
    }
}
  100bff:	90                   	nop
  100c00:	c9                   	leave  
  100c01:	c3                   	ret    

00100c02 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c02:	55                   	push   %ebp
  100c03:	89 e5                	mov    %esp,%ebp
  100c05:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c08:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c0f:	eb 3d                	jmp    100c4e <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c11:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c14:	89 d0                	mov    %edx,%eax
  100c16:	01 c0                	add    %eax,%eax
  100c18:	01 d0                	add    %edx,%eax
  100c1a:	c1 e0 02             	shl    $0x2,%eax
  100c1d:	05 04 00 11 00       	add    $0x110004,%eax
  100c22:	8b 08                	mov    (%eax),%ecx
  100c24:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c27:	89 d0                	mov    %edx,%eax
  100c29:	01 c0                	add    %eax,%eax
  100c2b:	01 d0                	add    %edx,%eax
  100c2d:	c1 e0 02             	shl    $0x2,%eax
  100c30:	05 00 00 11 00       	add    $0x110000,%eax
  100c35:	8b 00                	mov    (%eax),%eax
  100c37:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c3b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c3f:	c7 04 24 9d 3a 10 00 	movl   $0x103a9d,(%esp)
  100c46:	e8 d2 f6 ff ff       	call   10031d <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c4b:	ff 45 f4             	incl   -0xc(%ebp)
  100c4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c51:	83 f8 02             	cmp    $0x2,%eax
  100c54:	76 bb                	jbe    100c11 <mon_help+0xf>
    }
    return 0;
  100c56:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c5b:	c9                   	leave  
  100c5c:	c3                   	ret    

00100c5d <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c5d:	55                   	push   %ebp
  100c5e:	89 e5                	mov    %esp,%ebp
  100c60:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c63:	e8 cc fb ff ff       	call   100834 <print_kerninfo>
    return 0;
  100c68:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c6d:	c9                   	leave  
  100c6e:	c3                   	ret    

00100c6f <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c6f:	55                   	push   %ebp
  100c70:	89 e5                	mov    %esp,%ebp
  100c72:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c75:	e8 00 fd ff ff       	call   10097a <print_stackframe>
    return 0;
  100c7a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c7f:	c9                   	leave  
  100c80:	c3                   	ret    

00100c81 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100c81:	55                   	push   %ebp
  100c82:	89 e5                	mov    %esp,%ebp
  100c84:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100c87:	a1 40 0e 11 00       	mov    0x110e40,%eax
  100c8c:	85 c0                	test   %eax,%eax
  100c8e:	75 4a                	jne    100cda <__panic+0x59>
        goto panic_dead;
    }
    is_panic = 1;
  100c90:	c7 05 40 0e 11 00 01 	movl   $0x1,0x110e40
  100c97:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100c9a:	8d 45 14             	lea    0x14(%ebp),%eax
  100c9d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100ca0:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ca3:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ca7:	8b 45 08             	mov    0x8(%ebp),%eax
  100caa:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cae:	c7 04 24 a6 3a 10 00 	movl   $0x103aa6,(%esp)
  100cb5:	e8 63 f6 ff ff       	call   10031d <cprintf>
    vcprintf(fmt, ap);
  100cba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cbd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cc1:	8b 45 10             	mov    0x10(%ebp),%eax
  100cc4:	89 04 24             	mov    %eax,(%esp)
  100cc7:	e8 1e f6 ff ff       	call   1002ea <vcprintf>
    cprintf("\n");
  100ccc:	c7 04 24 c2 3a 10 00 	movl   $0x103ac2,(%esp)
  100cd3:	e8 45 f6 ff ff       	call   10031d <cprintf>
  100cd8:	eb 01                	jmp    100cdb <__panic+0x5a>
        goto panic_dead;
  100cda:	90                   	nop
    va_end(ap);

panic_dead:
    intr_disable();
  100cdb:	e8 59 09 00 00       	call   101639 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100ce0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100ce7:	e8 b6 fe ff ff       	call   100ba2 <kmonitor>
  100cec:	eb f2                	jmp    100ce0 <__panic+0x5f>

00100cee <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100cee:	55                   	push   %ebp
  100cef:	89 e5                	mov    %esp,%ebp
  100cf1:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100cf4:	8d 45 14             	lea    0x14(%ebp),%eax
  100cf7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100cfa:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cfd:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d01:	8b 45 08             	mov    0x8(%ebp),%eax
  100d04:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d08:	c7 04 24 c4 3a 10 00 	movl   $0x103ac4,(%esp)
  100d0f:	e8 09 f6 ff ff       	call   10031d <cprintf>
    vcprintf(fmt, ap);
  100d14:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d17:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d1b:	8b 45 10             	mov    0x10(%ebp),%eax
  100d1e:	89 04 24             	mov    %eax,(%esp)
  100d21:	e8 c4 f5 ff ff       	call   1002ea <vcprintf>
    cprintf("\n");
  100d26:	c7 04 24 c2 3a 10 00 	movl   $0x103ac2,(%esp)
  100d2d:	e8 eb f5 ff ff       	call   10031d <cprintf>
    va_end(ap);
}
  100d32:	90                   	nop
  100d33:	c9                   	leave  
  100d34:	c3                   	ret    

00100d35 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d35:	55                   	push   %ebp
  100d36:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d38:	a1 40 0e 11 00       	mov    0x110e40,%eax
}
  100d3d:	5d                   	pop    %ebp
  100d3e:	c3                   	ret    

00100d3f <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d3f:	55                   	push   %ebp
  100d40:	89 e5                	mov    %esp,%ebp
  100d42:	83 ec 28             	sub    $0x28,%esp
  100d45:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100d4b:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d4f:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d53:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d57:	ee                   	out    %al,(%dx)
}
  100d58:	90                   	nop
  100d59:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d5f:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d63:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d67:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d6b:	ee                   	out    %al,(%dx)
}
  100d6c:	90                   	nop
  100d6d:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100d73:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d77:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d7b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d7f:	ee                   	out    %al,(%dx)
}
  100d80:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d81:	c7 05 28 19 11 00 00 	movl   $0x0,0x111928
  100d88:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d8b:	c7 04 24 e2 3a 10 00 	movl   $0x103ae2,(%esp)
  100d92:	e8 86 f5 ff ff       	call   10031d <cprintf>
    pic_enable(IRQ_TIMER);
  100d97:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d9e:	e8 f9 08 00 00       	call   10169c <pic_enable>
}
  100da3:	90                   	nop
  100da4:	c9                   	leave  
  100da5:	c3                   	ret    

00100da6 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100da6:	55                   	push   %ebp
  100da7:	89 e5                	mov    %esp,%ebp
  100da9:	83 ec 10             	sub    $0x10,%esp
  100dac:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100db2:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100db6:	89 c2                	mov    %eax,%edx
  100db8:	ec                   	in     (%dx),%al
  100db9:	88 45 f1             	mov    %al,-0xf(%ebp)
  100dbc:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100dc2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100dc6:	89 c2                	mov    %eax,%edx
  100dc8:	ec                   	in     (%dx),%al
  100dc9:	88 45 f5             	mov    %al,-0xb(%ebp)
  100dcc:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dd2:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dd6:	89 c2                	mov    %eax,%edx
  100dd8:	ec                   	in     (%dx),%al
  100dd9:	88 45 f9             	mov    %al,-0x7(%ebp)
  100ddc:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100de2:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100de6:	89 c2                	mov    %eax,%edx
  100de8:	ec                   	in     (%dx),%al
  100de9:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100dec:	90                   	nop
  100ded:	c9                   	leave  
  100dee:	c3                   	ret    

00100def <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100def:	55                   	push   %ebp
  100df0:	89 e5                	mov    %esp,%ebp
  100df2:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100df5:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100dfc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100dff:	0f b7 00             	movzwl (%eax),%eax
  100e02:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e06:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e09:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e0e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e11:	0f b7 00             	movzwl (%eax),%eax
  100e14:	0f b7 c0             	movzwl %ax,%eax
  100e17:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e1c:	74 12                	je     100e30 <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e1e:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e25:	66 c7 05 66 0e 11 00 	movw   $0x3b4,0x110e66
  100e2c:	b4 03 
  100e2e:	eb 13                	jmp    100e43 <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e30:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e33:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e37:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e3a:	66 c7 05 66 0e 11 00 	movw   $0x3d4,0x110e66
  100e41:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e43:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  100e4a:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100e4e:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e52:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e56:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100e5a:	ee                   	out    %al,(%dx)
}
  100e5b:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e5c:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  100e63:	40                   	inc    %eax
  100e64:	0f b7 c0             	movzwl %ax,%eax
  100e67:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e6b:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100e6f:	89 c2                	mov    %eax,%edx
  100e71:	ec                   	in     (%dx),%al
  100e72:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100e75:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100e79:	0f b6 c0             	movzbl %al,%eax
  100e7c:	c1 e0 08             	shl    $0x8,%eax
  100e7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e82:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  100e89:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100e8d:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e91:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e95:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100e99:	ee                   	out    %al,(%dx)
}
  100e9a:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100e9b:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  100ea2:	40                   	inc    %eax
  100ea3:	0f b7 c0             	movzwl %ax,%eax
  100ea6:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100eaa:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100eae:	89 c2                	mov    %eax,%edx
  100eb0:	ec                   	in     (%dx),%al
  100eb1:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100eb4:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100eb8:	0f b6 c0             	movzbl %al,%eax
  100ebb:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100ebe:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ec1:	a3 60 0e 11 00       	mov    %eax,0x110e60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100ec6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ec9:	0f b7 c0             	movzwl %ax,%eax
  100ecc:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
}
  100ed2:	90                   	nop
  100ed3:	c9                   	leave  
  100ed4:	c3                   	ret    

00100ed5 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ed5:	55                   	push   %ebp
  100ed6:	89 e5                	mov    %esp,%ebp
  100ed8:	83 ec 48             	sub    $0x48,%esp
  100edb:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100ee1:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ee5:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100ee9:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100eed:	ee                   	out    %al,(%dx)
}
  100eee:	90                   	nop
  100eef:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100ef5:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ef9:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100efd:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f01:	ee                   	out    %al,(%dx)
}
  100f02:	90                   	nop
  100f03:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f09:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f0d:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f11:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f15:	ee                   	out    %al,(%dx)
}
  100f16:	90                   	nop
  100f17:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f1d:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f21:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f25:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f29:	ee                   	out    %al,(%dx)
}
  100f2a:	90                   	nop
  100f2b:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100f31:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f35:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f39:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f3d:	ee                   	out    %al,(%dx)
}
  100f3e:	90                   	nop
  100f3f:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100f45:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f49:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f4d:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f51:	ee                   	out    %al,(%dx)
}
  100f52:	90                   	nop
  100f53:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f59:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f5d:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f61:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f65:	ee                   	out    %al,(%dx)
}
  100f66:	90                   	nop
  100f67:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f6d:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100f71:	89 c2                	mov    %eax,%edx
  100f73:	ec                   	in     (%dx),%al
  100f74:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100f77:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f7b:	3c ff                	cmp    $0xff,%al
  100f7d:	0f 95 c0             	setne  %al
  100f80:	0f b6 c0             	movzbl %al,%eax
  100f83:	a3 68 0e 11 00       	mov    %eax,0x110e68
  100f88:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f8e:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f92:	89 c2                	mov    %eax,%edx
  100f94:	ec                   	in     (%dx),%al
  100f95:	88 45 f1             	mov    %al,-0xf(%ebp)
  100f98:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100f9e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100fa2:	89 c2                	mov    %eax,%edx
  100fa4:	ec                   	in     (%dx),%al
  100fa5:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fa8:	a1 68 0e 11 00       	mov    0x110e68,%eax
  100fad:	85 c0                	test   %eax,%eax
  100faf:	74 0c                	je     100fbd <serial_init+0xe8>
        pic_enable(IRQ_COM1);
  100fb1:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fb8:	e8 df 06 00 00       	call   10169c <pic_enable>
    }
}
  100fbd:	90                   	nop
  100fbe:	c9                   	leave  
  100fbf:	c3                   	ret    

00100fc0 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fc0:	55                   	push   %ebp
  100fc1:	89 e5                	mov    %esp,%ebp
  100fc3:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fc6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fcd:	eb 08                	jmp    100fd7 <lpt_putc_sub+0x17>
        delay();
  100fcf:	e8 d2 fd ff ff       	call   100da6 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fd4:	ff 45 fc             	incl   -0x4(%ebp)
  100fd7:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100fdd:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100fe1:	89 c2                	mov    %eax,%edx
  100fe3:	ec                   	in     (%dx),%al
  100fe4:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100fe7:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100feb:	84 c0                	test   %al,%al
  100fed:	78 09                	js     100ff8 <lpt_putc_sub+0x38>
  100fef:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100ff6:	7e d7                	jle    100fcf <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  100ff8:	8b 45 08             	mov    0x8(%ebp),%eax
  100ffb:	0f b6 c0             	movzbl %al,%eax
  100ffe:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101004:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101007:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10100b:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10100f:	ee                   	out    %al,(%dx)
}
  101010:	90                   	nop
  101011:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101017:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10101b:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10101f:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101023:	ee                   	out    %al,(%dx)
}
  101024:	90                   	nop
  101025:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  10102b:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10102f:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101033:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101037:	ee                   	out    %al,(%dx)
}
  101038:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101039:	90                   	nop
  10103a:	c9                   	leave  
  10103b:	c3                   	ret    

0010103c <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10103c:	55                   	push   %ebp
  10103d:	89 e5                	mov    %esp,%ebp
  10103f:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101042:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101046:	74 0d                	je     101055 <lpt_putc+0x19>
        lpt_putc_sub(c);
  101048:	8b 45 08             	mov    0x8(%ebp),%eax
  10104b:	89 04 24             	mov    %eax,(%esp)
  10104e:	e8 6d ff ff ff       	call   100fc0 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  101053:	eb 24                	jmp    101079 <lpt_putc+0x3d>
        lpt_putc_sub('\b');
  101055:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10105c:	e8 5f ff ff ff       	call   100fc0 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101061:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101068:	e8 53 ff ff ff       	call   100fc0 <lpt_putc_sub>
        lpt_putc_sub('\b');
  10106d:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101074:	e8 47 ff ff ff       	call   100fc0 <lpt_putc_sub>
}
  101079:	90                   	nop
  10107a:	c9                   	leave  
  10107b:	c3                   	ret    

0010107c <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10107c:	55                   	push   %ebp
  10107d:	89 e5                	mov    %esp,%ebp
  10107f:	53                   	push   %ebx
  101080:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101083:	8b 45 08             	mov    0x8(%ebp),%eax
  101086:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10108b:	85 c0                	test   %eax,%eax
  10108d:	75 07                	jne    101096 <cga_putc+0x1a>
        c |= 0x0700;
  10108f:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101096:	8b 45 08             	mov    0x8(%ebp),%eax
  101099:	0f b6 c0             	movzbl %al,%eax
  10109c:	83 f8 0d             	cmp    $0xd,%eax
  10109f:	74 72                	je     101113 <cga_putc+0x97>
  1010a1:	83 f8 0d             	cmp    $0xd,%eax
  1010a4:	0f 8f a3 00 00 00    	jg     10114d <cga_putc+0xd1>
  1010aa:	83 f8 08             	cmp    $0x8,%eax
  1010ad:	74 0a                	je     1010b9 <cga_putc+0x3d>
  1010af:	83 f8 0a             	cmp    $0xa,%eax
  1010b2:	74 4c                	je     101100 <cga_putc+0x84>
  1010b4:	e9 94 00 00 00       	jmp    10114d <cga_putc+0xd1>
    case '\b':
        if (crt_pos > 0) {
  1010b9:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  1010c0:	85 c0                	test   %eax,%eax
  1010c2:	0f 84 af 00 00 00    	je     101177 <cga_putc+0xfb>
            crt_pos --;
  1010c8:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  1010cf:	48                   	dec    %eax
  1010d0:	0f b7 c0             	movzwl %ax,%eax
  1010d3:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1010dc:	98                   	cwtl   
  1010dd:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010e2:	98                   	cwtl   
  1010e3:	83 c8 20             	or     $0x20,%eax
  1010e6:	98                   	cwtl   
  1010e7:	8b 15 60 0e 11 00    	mov    0x110e60,%edx
  1010ed:	0f b7 0d 64 0e 11 00 	movzwl 0x110e64,%ecx
  1010f4:	01 c9                	add    %ecx,%ecx
  1010f6:	01 ca                	add    %ecx,%edx
  1010f8:	0f b7 c0             	movzwl %ax,%eax
  1010fb:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010fe:	eb 77                	jmp    101177 <cga_putc+0xfb>
    case '\n':
        crt_pos += CRT_COLS;
  101100:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  101107:	83 c0 50             	add    $0x50,%eax
  10110a:	0f b7 c0             	movzwl %ax,%eax
  10110d:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101113:	0f b7 1d 64 0e 11 00 	movzwl 0x110e64,%ebx
  10111a:	0f b7 0d 64 0e 11 00 	movzwl 0x110e64,%ecx
  101121:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  101126:	89 c8                	mov    %ecx,%eax
  101128:	f7 e2                	mul    %edx
  10112a:	c1 ea 06             	shr    $0x6,%edx
  10112d:	89 d0                	mov    %edx,%eax
  10112f:	c1 e0 02             	shl    $0x2,%eax
  101132:	01 d0                	add    %edx,%eax
  101134:	c1 e0 04             	shl    $0x4,%eax
  101137:	29 c1                	sub    %eax,%ecx
  101139:	89 c8                	mov    %ecx,%eax
  10113b:	0f b7 c0             	movzwl %ax,%eax
  10113e:	29 c3                	sub    %eax,%ebx
  101140:	89 d8                	mov    %ebx,%eax
  101142:	0f b7 c0             	movzwl %ax,%eax
  101145:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
        break;
  10114b:	eb 2b                	jmp    101178 <cga_putc+0xfc>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10114d:	8b 0d 60 0e 11 00    	mov    0x110e60,%ecx
  101153:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  10115a:	8d 50 01             	lea    0x1(%eax),%edx
  10115d:	0f b7 d2             	movzwl %dx,%edx
  101160:	66 89 15 64 0e 11 00 	mov    %dx,0x110e64
  101167:	01 c0                	add    %eax,%eax
  101169:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  10116c:	8b 45 08             	mov    0x8(%ebp),%eax
  10116f:	0f b7 c0             	movzwl %ax,%eax
  101172:	66 89 02             	mov    %ax,(%edx)
        break;
  101175:	eb 01                	jmp    101178 <cga_putc+0xfc>
        break;
  101177:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101178:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  10117f:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  101184:	76 5d                	jbe    1011e3 <cga_putc+0x167>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101186:	a1 60 0e 11 00       	mov    0x110e60,%eax
  10118b:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101191:	a1 60 0e 11 00       	mov    0x110e60,%eax
  101196:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  10119d:	00 
  10119e:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011a2:	89 04 24             	mov    %eax,(%esp)
  1011a5:	e8 ec 24 00 00       	call   103696 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011aa:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011b1:	eb 14                	jmp    1011c7 <cga_putc+0x14b>
            crt_buf[i] = 0x0700 | ' ';
  1011b3:	a1 60 0e 11 00       	mov    0x110e60,%eax
  1011b8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011bb:	01 d2                	add    %edx,%edx
  1011bd:	01 d0                	add    %edx,%eax
  1011bf:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011c4:	ff 45 f4             	incl   -0xc(%ebp)
  1011c7:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011ce:	7e e3                	jle    1011b3 <cga_putc+0x137>
        }
        crt_pos -= CRT_COLS;
  1011d0:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  1011d7:	83 e8 50             	sub    $0x50,%eax
  1011da:	0f b7 c0             	movzwl %ax,%eax
  1011dd:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011e3:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  1011ea:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  1011ee:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1011f2:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1011f6:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1011fa:	ee                   	out    %al,(%dx)
}
  1011fb:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  1011fc:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  101203:	c1 e8 08             	shr    $0x8,%eax
  101206:	0f b7 c0             	movzwl %ax,%eax
  101209:	0f b6 c0             	movzbl %al,%eax
  10120c:	0f b7 15 66 0e 11 00 	movzwl 0x110e66,%edx
  101213:	42                   	inc    %edx
  101214:	0f b7 d2             	movzwl %dx,%edx
  101217:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  10121b:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10121e:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101222:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101226:	ee                   	out    %al,(%dx)
}
  101227:	90                   	nop
    outb(addr_6845, 15);
  101228:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  10122f:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101233:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101237:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10123b:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10123f:	ee                   	out    %al,(%dx)
}
  101240:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  101241:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  101248:	0f b6 c0             	movzbl %al,%eax
  10124b:	0f b7 15 66 0e 11 00 	movzwl 0x110e66,%edx
  101252:	42                   	inc    %edx
  101253:	0f b7 d2             	movzwl %dx,%edx
  101256:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  10125a:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10125d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101261:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101265:	ee                   	out    %al,(%dx)
}
  101266:	90                   	nop
}
  101267:	90                   	nop
  101268:	83 c4 34             	add    $0x34,%esp
  10126b:	5b                   	pop    %ebx
  10126c:	5d                   	pop    %ebp
  10126d:	c3                   	ret    

0010126e <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10126e:	55                   	push   %ebp
  10126f:	89 e5                	mov    %esp,%ebp
  101271:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101274:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10127b:	eb 08                	jmp    101285 <serial_putc_sub+0x17>
        delay();
  10127d:	e8 24 fb ff ff       	call   100da6 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101282:	ff 45 fc             	incl   -0x4(%ebp)
  101285:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10128b:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10128f:	89 c2                	mov    %eax,%edx
  101291:	ec                   	in     (%dx),%al
  101292:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101295:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101299:	0f b6 c0             	movzbl %al,%eax
  10129c:	83 e0 20             	and    $0x20,%eax
  10129f:	85 c0                	test   %eax,%eax
  1012a1:	75 09                	jne    1012ac <serial_putc_sub+0x3e>
  1012a3:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012aa:	7e d1                	jle    10127d <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  1012ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1012af:	0f b6 c0             	movzbl %al,%eax
  1012b2:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012b8:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012bb:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012bf:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012c3:	ee                   	out    %al,(%dx)
}
  1012c4:	90                   	nop
}
  1012c5:	90                   	nop
  1012c6:	c9                   	leave  
  1012c7:	c3                   	ret    

001012c8 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012c8:	55                   	push   %ebp
  1012c9:	89 e5                	mov    %esp,%ebp
  1012cb:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012ce:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012d2:	74 0d                	je     1012e1 <serial_putc+0x19>
        serial_putc_sub(c);
  1012d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1012d7:	89 04 24             	mov    %eax,(%esp)
  1012da:	e8 8f ff ff ff       	call   10126e <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012df:	eb 24                	jmp    101305 <serial_putc+0x3d>
        serial_putc_sub('\b');
  1012e1:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012e8:	e8 81 ff ff ff       	call   10126e <serial_putc_sub>
        serial_putc_sub(' ');
  1012ed:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012f4:	e8 75 ff ff ff       	call   10126e <serial_putc_sub>
        serial_putc_sub('\b');
  1012f9:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101300:	e8 69 ff ff ff       	call   10126e <serial_putc_sub>
}
  101305:	90                   	nop
  101306:	c9                   	leave  
  101307:	c3                   	ret    

00101308 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101308:	55                   	push   %ebp
  101309:	89 e5                	mov    %esp,%ebp
  10130b:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  10130e:	eb 33                	jmp    101343 <cons_intr+0x3b>
        if (c != 0) {
  101310:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101314:	74 2d                	je     101343 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101316:	a1 84 10 11 00       	mov    0x111084,%eax
  10131b:	8d 50 01             	lea    0x1(%eax),%edx
  10131e:	89 15 84 10 11 00    	mov    %edx,0x111084
  101324:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101327:	88 90 80 0e 11 00    	mov    %dl,0x110e80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  10132d:	a1 84 10 11 00       	mov    0x111084,%eax
  101332:	3d 00 02 00 00       	cmp    $0x200,%eax
  101337:	75 0a                	jne    101343 <cons_intr+0x3b>
                cons.wpos = 0;
  101339:	c7 05 84 10 11 00 00 	movl   $0x0,0x111084
  101340:	00 00 00 
    while ((c = (*proc)()) != -1) {
  101343:	8b 45 08             	mov    0x8(%ebp),%eax
  101346:	ff d0                	call   *%eax
  101348:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10134b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10134f:	75 bf                	jne    101310 <cons_intr+0x8>
            }
        }
    }
}
  101351:	90                   	nop
  101352:	90                   	nop
  101353:	c9                   	leave  
  101354:	c3                   	ret    

00101355 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101355:	55                   	push   %ebp
  101356:	89 e5                	mov    %esp,%ebp
  101358:	83 ec 10             	sub    $0x10,%esp
  10135b:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101361:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101365:	89 c2                	mov    %eax,%edx
  101367:	ec                   	in     (%dx),%al
  101368:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10136b:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10136f:	0f b6 c0             	movzbl %al,%eax
  101372:	83 e0 01             	and    $0x1,%eax
  101375:	85 c0                	test   %eax,%eax
  101377:	75 07                	jne    101380 <serial_proc_data+0x2b>
        return -1;
  101379:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10137e:	eb 2a                	jmp    1013aa <serial_proc_data+0x55>
  101380:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101386:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10138a:	89 c2                	mov    %eax,%edx
  10138c:	ec                   	in     (%dx),%al
  10138d:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101390:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101394:	0f b6 c0             	movzbl %al,%eax
  101397:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10139a:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  10139e:	75 07                	jne    1013a7 <serial_proc_data+0x52>
        c = '\b';
  1013a0:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1013a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1013aa:	c9                   	leave  
  1013ab:	c3                   	ret    

001013ac <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013ac:	55                   	push   %ebp
  1013ad:	89 e5                	mov    %esp,%ebp
  1013af:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013b2:	a1 68 0e 11 00       	mov    0x110e68,%eax
  1013b7:	85 c0                	test   %eax,%eax
  1013b9:	74 0c                	je     1013c7 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013bb:	c7 04 24 55 13 10 00 	movl   $0x101355,(%esp)
  1013c2:	e8 41 ff ff ff       	call   101308 <cons_intr>
    }
}
  1013c7:	90                   	nop
  1013c8:	c9                   	leave  
  1013c9:	c3                   	ret    

001013ca <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013ca:	55                   	push   %ebp
  1013cb:	89 e5                	mov    %esp,%ebp
  1013cd:	83 ec 38             	sub    $0x38,%esp
  1013d0:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1013d9:	89 c2                	mov    %eax,%edx
  1013db:	ec                   	in     (%dx),%al
  1013dc:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013df:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013e3:	0f b6 c0             	movzbl %al,%eax
  1013e6:	83 e0 01             	and    $0x1,%eax
  1013e9:	85 c0                	test   %eax,%eax
  1013eb:	75 0a                	jne    1013f7 <kbd_proc_data+0x2d>
        return -1;
  1013ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013f2:	e9 56 01 00 00       	jmp    10154d <kbd_proc_data+0x183>
  1013f7:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101400:	89 c2                	mov    %eax,%edx
  101402:	ec                   	in     (%dx),%al
  101403:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101406:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  10140a:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  10140d:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101411:	75 17                	jne    10142a <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  101413:	a1 88 10 11 00       	mov    0x111088,%eax
  101418:	83 c8 40             	or     $0x40,%eax
  10141b:	a3 88 10 11 00       	mov    %eax,0x111088
        return 0;
  101420:	b8 00 00 00 00       	mov    $0x0,%eax
  101425:	e9 23 01 00 00       	jmp    10154d <kbd_proc_data+0x183>
    } else if (data & 0x80) {
  10142a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10142e:	84 c0                	test   %al,%al
  101430:	79 45                	jns    101477 <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101432:	a1 88 10 11 00       	mov    0x111088,%eax
  101437:	83 e0 40             	and    $0x40,%eax
  10143a:	85 c0                	test   %eax,%eax
  10143c:	75 08                	jne    101446 <kbd_proc_data+0x7c>
  10143e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101442:	24 7f                	and    $0x7f,%al
  101444:	eb 04                	jmp    10144a <kbd_proc_data+0x80>
  101446:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10144a:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10144d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101451:	0f b6 80 40 00 11 00 	movzbl 0x110040(%eax),%eax
  101458:	0c 40                	or     $0x40,%al
  10145a:	0f b6 c0             	movzbl %al,%eax
  10145d:	f7 d0                	not    %eax
  10145f:	89 c2                	mov    %eax,%edx
  101461:	a1 88 10 11 00       	mov    0x111088,%eax
  101466:	21 d0                	and    %edx,%eax
  101468:	a3 88 10 11 00       	mov    %eax,0x111088
        return 0;
  10146d:	b8 00 00 00 00       	mov    $0x0,%eax
  101472:	e9 d6 00 00 00       	jmp    10154d <kbd_proc_data+0x183>
    } else if (shift & E0ESC) {
  101477:	a1 88 10 11 00       	mov    0x111088,%eax
  10147c:	83 e0 40             	and    $0x40,%eax
  10147f:	85 c0                	test   %eax,%eax
  101481:	74 11                	je     101494 <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101483:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101487:	a1 88 10 11 00       	mov    0x111088,%eax
  10148c:	83 e0 bf             	and    $0xffffffbf,%eax
  10148f:	a3 88 10 11 00       	mov    %eax,0x111088
    }

    shift |= shiftcode[data];
  101494:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101498:	0f b6 80 40 00 11 00 	movzbl 0x110040(%eax),%eax
  10149f:	0f b6 d0             	movzbl %al,%edx
  1014a2:	a1 88 10 11 00       	mov    0x111088,%eax
  1014a7:	09 d0                	or     %edx,%eax
  1014a9:	a3 88 10 11 00       	mov    %eax,0x111088
    shift ^= togglecode[data];
  1014ae:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014b2:	0f b6 80 40 01 11 00 	movzbl 0x110140(%eax),%eax
  1014b9:	0f b6 d0             	movzbl %al,%edx
  1014bc:	a1 88 10 11 00       	mov    0x111088,%eax
  1014c1:	31 d0                	xor    %edx,%eax
  1014c3:	a3 88 10 11 00       	mov    %eax,0x111088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014c8:	a1 88 10 11 00       	mov    0x111088,%eax
  1014cd:	83 e0 03             	and    $0x3,%eax
  1014d0:	8b 14 85 40 05 11 00 	mov    0x110540(,%eax,4),%edx
  1014d7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014db:	01 d0                	add    %edx,%eax
  1014dd:	0f b6 00             	movzbl (%eax),%eax
  1014e0:	0f b6 c0             	movzbl %al,%eax
  1014e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014e6:	a1 88 10 11 00       	mov    0x111088,%eax
  1014eb:	83 e0 08             	and    $0x8,%eax
  1014ee:	85 c0                	test   %eax,%eax
  1014f0:	74 22                	je     101514 <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  1014f2:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014f6:	7e 0c                	jle    101504 <kbd_proc_data+0x13a>
  1014f8:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014fc:	7f 06                	jg     101504 <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  1014fe:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101502:	eb 10                	jmp    101514 <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  101504:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101508:	7e 0a                	jle    101514 <kbd_proc_data+0x14a>
  10150a:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10150e:	7f 04                	jg     101514 <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  101510:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101514:	a1 88 10 11 00       	mov    0x111088,%eax
  101519:	f7 d0                	not    %eax
  10151b:	83 e0 06             	and    $0x6,%eax
  10151e:	85 c0                	test   %eax,%eax
  101520:	75 28                	jne    10154a <kbd_proc_data+0x180>
  101522:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101529:	75 1f                	jne    10154a <kbd_proc_data+0x180>
        cprintf("Rebooting!\n");
  10152b:	c7 04 24 fd 3a 10 00 	movl   $0x103afd,(%esp)
  101532:	e8 e6 ed ff ff       	call   10031d <cprintf>
  101537:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  10153d:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101541:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101545:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101548:	ee                   	out    %al,(%dx)
}
  101549:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10154a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10154d:	c9                   	leave  
  10154e:	c3                   	ret    

0010154f <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  10154f:	55                   	push   %ebp
  101550:	89 e5                	mov    %esp,%ebp
  101552:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101555:	c7 04 24 ca 13 10 00 	movl   $0x1013ca,(%esp)
  10155c:	e8 a7 fd ff ff       	call   101308 <cons_intr>
}
  101561:	90                   	nop
  101562:	c9                   	leave  
  101563:	c3                   	ret    

00101564 <kbd_init>:

static void
kbd_init(void) {
  101564:	55                   	push   %ebp
  101565:	89 e5                	mov    %esp,%ebp
  101567:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  10156a:	e8 e0 ff ff ff       	call   10154f <kbd_intr>
    pic_enable(IRQ_KBD);
  10156f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101576:	e8 21 01 00 00       	call   10169c <pic_enable>
}
  10157b:	90                   	nop
  10157c:	c9                   	leave  
  10157d:	c3                   	ret    

0010157e <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10157e:	55                   	push   %ebp
  10157f:	89 e5                	mov    %esp,%ebp
  101581:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101584:	e8 66 f8 ff ff       	call   100def <cga_init>
    serial_init();
  101589:	e8 47 f9 ff ff       	call   100ed5 <serial_init>
    kbd_init();
  10158e:	e8 d1 ff ff ff       	call   101564 <kbd_init>
    if (!serial_exists) {
  101593:	a1 68 0e 11 00       	mov    0x110e68,%eax
  101598:	85 c0                	test   %eax,%eax
  10159a:	75 0c                	jne    1015a8 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  10159c:	c7 04 24 09 3b 10 00 	movl   $0x103b09,(%esp)
  1015a3:	e8 75 ed ff ff       	call   10031d <cprintf>
    }
}
  1015a8:	90                   	nop
  1015a9:	c9                   	leave  
  1015aa:	c3                   	ret    

001015ab <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015ab:	55                   	push   %ebp
  1015ac:	89 e5                	mov    %esp,%ebp
  1015ae:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1015b4:	89 04 24             	mov    %eax,(%esp)
  1015b7:	e8 80 fa ff ff       	call   10103c <lpt_putc>
    cga_putc(c);
  1015bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1015bf:	89 04 24             	mov    %eax,(%esp)
  1015c2:	e8 b5 fa ff ff       	call   10107c <cga_putc>
    serial_putc(c);
  1015c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1015ca:	89 04 24             	mov    %eax,(%esp)
  1015cd:	e8 f6 fc ff ff       	call   1012c8 <serial_putc>
}
  1015d2:	90                   	nop
  1015d3:	c9                   	leave  
  1015d4:	c3                   	ret    

001015d5 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015d5:	55                   	push   %ebp
  1015d6:	89 e5                	mov    %esp,%ebp
  1015d8:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015db:	e8 cc fd ff ff       	call   1013ac <serial_intr>
    kbd_intr();
  1015e0:	e8 6a ff ff ff       	call   10154f <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015e5:	8b 15 80 10 11 00    	mov    0x111080,%edx
  1015eb:	a1 84 10 11 00       	mov    0x111084,%eax
  1015f0:	39 c2                	cmp    %eax,%edx
  1015f2:	74 36                	je     10162a <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015f4:	a1 80 10 11 00       	mov    0x111080,%eax
  1015f9:	8d 50 01             	lea    0x1(%eax),%edx
  1015fc:	89 15 80 10 11 00    	mov    %edx,0x111080
  101602:	0f b6 80 80 0e 11 00 	movzbl 0x110e80(%eax),%eax
  101609:	0f b6 c0             	movzbl %al,%eax
  10160c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  10160f:	a1 80 10 11 00       	mov    0x111080,%eax
  101614:	3d 00 02 00 00       	cmp    $0x200,%eax
  101619:	75 0a                	jne    101625 <cons_getc+0x50>
            cons.rpos = 0;
  10161b:	c7 05 80 10 11 00 00 	movl   $0x0,0x111080
  101622:	00 00 00 
        }
        return c;
  101625:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101628:	eb 05                	jmp    10162f <cons_getc+0x5a>
    }
    return 0;
  10162a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10162f:	c9                   	leave  
  101630:	c3                   	ret    

00101631 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101631:	55                   	push   %ebp
  101632:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101634:	fb                   	sti    
}
  101635:	90                   	nop
    sti();
}
  101636:	90                   	nop
  101637:	5d                   	pop    %ebp
  101638:	c3                   	ret    

00101639 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101639:	55                   	push   %ebp
  10163a:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  10163c:	fa                   	cli    
}
  10163d:	90                   	nop
    cli();
}
  10163e:	90                   	nop
  10163f:	5d                   	pop    %ebp
  101640:	c3                   	ret    

00101641 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101641:	55                   	push   %ebp
  101642:	89 e5                	mov    %esp,%ebp
  101644:	83 ec 14             	sub    $0x14,%esp
  101647:	8b 45 08             	mov    0x8(%ebp),%eax
  10164a:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  10164e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101651:	66 a3 50 05 11 00    	mov    %ax,0x110550
    if (did_init) {
  101657:	a1 8c 10 11 00       	mov    0x11108c,%eax
  10165c:	85 c0                	test   %eax,%eax
  10165e:	74 39                	je     101699 <pic_setmask+0x58>
        outb(IO_PIC1 + 1, mask);
  101660:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101663:	0f b6 c0             	movzbl %al,%eax
  101666:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  10166c:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10166f:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101673:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101677:	ee                   	out    %al,(%dx)
}
  101678:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  101679:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10167d:	c1 e8 08             	shr    $0x8,%eax
  101680:	0f b7 c0             	movzwl %ax,%eax
  101683:	0f b6 c0             	movzbl %al,%eax
  101686:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  10168c:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10168f:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101693:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101697:	ee                   	out    %al,(%dx)
}
  101698:	90                   	nop
    }
}
  101699:	90                   	nop
  10169a:	c9                   	leave  
  10169b:	c3                   	ret    

0010169c <pic_enable>:

void
pic_enable(unsigned int irq) {
  10169c:	55                   	push   %ebp
  10169d:	89 e5                	mov    %esp,%ebp
  10169f:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  1016a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1016a5:	ba 01 00 00 00       	mov    $0x1,%edx
  1016aa:	88 c1                	mov    %al,%cl
  1016ac:	d3 e2                	shl    %cl,%edx
  1016ae:	89 d0                	mov    %edx,%eax
  1016b0:	98                   	cwtl   
  1016b1:	f7 d0                	not    %eax
  1016b3:	0f bf d0             	movswl %ax,%edx
  1016b6:	0f b7 05 50 05 11 00 	movzwl 0x110550,%eax
  1016bd:	98                   	cwtl   
  1016be:	21 d0                	and    %edx,%eax
  1016c0:	98                   	cwtl   
  1016c1:	0f b7 c0             	movzwl %ax,%eax
  1016c4:	89 04 24             	mov    %eax,(%esp)
  1016c7:	e8 75 ff ff ff       	call   101641 <pic_setmask>
}
  1016cc:	90                   	nop
  1016cd:	c9                   	leave  
  1016ce:	c3                   	ret    

001016cf <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016cf:	55                   	push   %ebp
  1016d0:	89 e5                	mov    %esp,%ebp
  1016d2:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016d5:	c7 05 8c 10 11 00 01 	movl   $0x1,0x11108c
  1016dc:	00 00 00 
  1016df:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1016e5:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016e9:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1016ed:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1016f1:	ee                   	out    %al,(%dx)
}
  1016f2:	90                   	nop
  1016f3:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1016f9:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016fd:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  101701:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101705:	ee                   	out    %al,(%dx)
}
  101706:	90                   	nop
  101707:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  10170d:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101711:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101715:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101719:	ee                   	out    %al,(%dx)
}
  10171a:	90                   	nop
  10171b:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  101721:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101725:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101729:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10172d:	ee                   	out    %al,(%dx)
}
  10172e:	90                   	nop
  10172f:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101735:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101739:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10173d:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101741:	ee                   	out    %al,(%dx)
}
  101742:	90                   	nop
  101743:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101749:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10174d:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101751:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101755:	ee                   	out    %al,(%dx)
}
  101756:	90                   	nop
  101757:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  10175d:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101761:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101765:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101769:	ee                   	out    %al,(%dx)
}
  10176a:	90                   	nop
  10176b:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101771:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101775:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101779:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10177d:	ee                   	out    %al,(%dx)
}
  10177e:	90                   	nop
  10177f:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101785:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101789:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10178d:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101791:	ee                   	out    %al,(%dx)
}
  101792:	90                   	nop
  101793:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101799:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10179d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1017a1:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1017a5:	ee                   	out    %al,(%dx)
}
  1017a6:	90                   	nop
  1017a7:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  1017ad:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017b1:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1017b5:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1017b9:	ee                   	out    %al,(%dx)
}
  1017ba:	90                   	nop
  1017bb:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1017c1:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017c5:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1017c9:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1017cd:	ee                   	out    %al,(%dx)
}
  1017ce:	90                   	nop
  1017cf:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  1017d5:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017d9:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1017dd:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1017e1:	ee                   	out    %al,(%dx)
}
  1017e2:	90                   	nop
  1017e3:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1017e9:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ed:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1017f1:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1017f5:	ee                   	out    %al,(%dx)
}
  1017f6:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017f7:	0f b7 05 50 05 11 00 	movzwl 0x110550,%eax
  1017fe:	3d ff ff 00 00       	cmp    $0xffff,%eax
  101803:	74 0f                	je     101814 <pic_init+0x145>
        pic_setmask(irq_mask);
  101805:	0f b7 05 50 05 11 00 	movzwl 0x110550,%eax
  10180c:	89 04 24             	mov    %eax,(%esp)
  10180f:	e8 2d fe ff ff       	call   101641 <pic_setmask>
    }
}
  101814:	90                   	nop
  101815:	c9                   	leave  
  101816:	c3                   	ret    

00101817 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101817:	55                   	push   %ebp
  101818:	89 e5                	mov    %esp,%ebp
  10181a:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10181d:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101824:	00 
  101825:	c7 04 24 40 3b 10 00 	movl   $0x103b40,(%esp)
  10182c:	e8 ec ea ff ff       	call   10031d <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  101831:	c7 04 24 4a 3b 10 00 	movl   $0x103b4a,(%esp)
  101838:	e8 e0 ea ff ff       	call   10031d <cprintf>
    panic("EOT: kernel seems ok.");
  10183d:	c7 44 24 08 58 3b 10 	movl   $0x103b58,0x8(%esp)
  101844:	00 
  101845:	c7 44 24 04 12 00 00 	movl   $0x12,0x4(%esp)
  10184c:	00 
  10184d:	c7 04 24 6e 3b 10 00 	movl   $0x103b6e,(%esp)
  101854:	e8 28 f4 ff ff       	call   100c81 <__panic>

00101859 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101859:	55                   	push   %ebp
  10185a:	89 e5                	mov    %esp,%ebp
  10185c:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
     //kern/mm/mmu.h中定义SETGATE
     extern uintptr_t __vectors[];//(1)
     for(int i=0;i<256;i++)//参考答案写的是sizeof(idt)/sizeof(struct gatedesc)但实际上值都一样答案更规范而已
  10185f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101866:	e9 c4 00 00 00       	jmp    10192f <idt_init+0xd6>
     {//arg1表示处理函数的入口地址，arg2为0表示中断门，arg3段选择子(GD_KTEXT定义在memlayout.h中)
     //#define GD_KTEXT    ((SEG_KTEXT) << 3)       arg4为__vectors[]数组内容 arg5设置特权级。中断都设置为内核级，即第0级
         SETGATE(idt[i],0,GD_KTEXT,__vectors[i],DPL_KERNEL);//(2)使用SETGATE宏初始化idt
  10186b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10186e:	8b 04 85 e0 05 11 00 	mov    0x1105e0(,%eax,4),%eax
  101875:	0f b7 d0             	movzwl %ax,%edx
  101878:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10187b:	66 89 14 c5 a0 10 11 	mov    %dx,0x1110a0(,%eax,8)
  101882:	00 
  101883:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101886:	66 c7 04 c5 a2 10 11 	movw   $0x8,0x1110a2(,%eax,8)
  10188d:	00 08 00 
  101890:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101893:	0f b6 14 c5 a4 10 11 	movzbl 0x1110a4(,%eax,8),%edx
  10189a:	00 
  10189b:	80 e2 e0             	and    $0xe0,%dl
  10189e:	88 14 c5 a4 10 11 00 	mov    %dl,0x1110a4(,%eax,8)
  1018a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018a8:	0f b6 14 c5 a4 10 11 	movzbl 0x1110a4(,%eax,8),%edx
  1018af:	00 
  1018b0:	80 e2 1f             	and    $0x1f,%dl
  1018b3:	88 14 c5 a4 10 11 00 	mov    %dl,0x1110a4(,%eax,8)
  1018ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018bd:	0f b6 14 c5 a5 10 11 	movzbl 0x1110a5(,%eax,8),%edx
  1018c4:	00 
  1018c5:	80 e2 f0             	and    $0xf0,%dl
  1018c8:	80 ca 0e             	or     $0xe,%dl
  1018cb:	88 14 c5 a5 10 11 00 	mov    %dl,0x1110a5(,%eax,8)
  1018d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d5:	0f b6 14 c5 a5 10 11 	movzbl 0x1110a5(,%eax,8),%edx
  1018dc:	00 
  1018dd:	80 e2 ef             	and    $0xef,%dl
  1018e0:	88 14 c5 a5 10 11 00 	mov    %dl,0x1110a5(,%eax,8)
  1018e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ea:	0f b6 14 c5 a5 10 11 	movzbl 0x1110a5(,%eax,8),%edx
  1018f1:	00 
  1018f2:	80 e2 9f             	and    $0x9f,%dl
  1018f5:	88 14 c5 a5 10 11 00 	mov    %dl,0x1110a5(,%eax,8)
  1018fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ff:	0f b6 14 c5 a5 10 11 	movzbl 0x1110a5(,%eax,8),%edx
  101906:	00 
  101907:	80 ca 80             	or     $0x80,%dl
  10190a:	88 14 c5 a5 10 11 00 	mov    %dl,0x1110a5(,%eax,8)
  101911:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101914:	8b 04 85 e0 05 11 00 	mov    0x1105e0(,%eax,4),%eax
  10191b:	c1 e8 10             	shr    $0x10,%eax
  10191e:	0f b7 d0             	movzwl %ax,%edx
  101921:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101924:	66 89 14 c5 a6 10 11 	mov    %dx,0x1110a6(,%eax,8)
  10192b:	00 
     for(int i=0;i<256;i++)//参考答案写的是sizeof(idt)/sizeof(struct gatedesc)但实际上值都一样答案更规范而已
  10192c:	ff 45 fc             	incl   -0x4(%ebp)
  10192f:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  101936:	0f 8e 2f ff ff ff    	jle    10186b <idt_init+0x12>
     }
     //从用户态权限切换到内核态权限T_SWITCH_TOK   用户是OU
    //  SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
     SETGATE(idt[T_SWITCH_TOK], 1, KERNEL_CS, __vectors[T_SWITCH_TOK], 3);
  10193c:	a1 c4 07 11 00       	mov    0x1107c4,%eax
  101941:	0f b7 c0             	movzwl %ax,%eax
  101944:	66 a3 68 14 11 00    	mov    %ax,0x111468
  10194a:	66 c7 05 6a 14 11 00 	movw   $0x8,0x11146a
  101951:	08 00 
  101953:	0f b6 05 6c 14 11 00 	movzbl 0x11146c,%eax
  10195a:	24 e0                	and    $0xe0,%al
  10195c:	a2 6c 14 11 00       	mov    %al,0x11146c
  101961:	0f b6 05 6c 14 11 00 	movzbl 0x11146c,%eax
  101968:	24 1f                	and    $0x1f,%al
  10196a:	a2 6c 14 11 00       	mov    %al,0x11146c
  10196f:	0f b6 05 6d 14 11 00 	movzbl 0x11146d,%eax
  101976:	0c 0f                	or     $0xf,%al
  101978:	a2 6d 14 11 00       	mov    %al,0x11146d
  10197d:	0f b6 05 6d 14 11 00 	movzbl 0x11146d,%eax
  101984:	24 ef                	and    $0xef,%al
  101986:	a2 6d 14 11 00       	mov    %al,0x11146d
  10198b:	0f b6 05 6d 14 11 00 	movzbl 0x11146d,%eax
  101992:	0c 60                	or     $0x60,%al
  101994:	a2 6d 14 11 00       	mov    %al,0x11146d
  101999:	0f b6 05 6d 14 11 00 	movzbl 0x11146d,%eax
  1019a0:	0c 80                	or     $0x80,%al
  1019a2:	a2 6d 14 11 00       	mov    %al,0x11146d
  1019a7:	a1 c4 07 11 00       	mov    0x1107c4,%eax
  1019ac:	c1 e8 10             	shr    $0x10,%eax
  1019af:	0f b7 c0             	movzwl %ax,%eax
  1019b2:	66 a3 6e 14 11 00    	mov    %ax,0x11146e
  1019b8:	c7 45 f8 60 05 11 00 	movl   $0x110560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  1019bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1019c2:	0f 01 18             	lidtl  (%eax)
}
  1019c5:	90                   	nop
     lidt(&idt_pd);//(3)用lidt指令告诉CPU idt在哪，idt_pd参数被定义在该文件开始，其结构pseudodesc被定义在libs/x86.h

}
  1019c6:	90                   	nop
  1019c7:	c9                   	leave  
  1019c8:	c3                   	ret    

001019c9 <trapname>:

static const char *
trapname(int trapno) {
  1019c9:	55                   	push   %ebp
  1019ca:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1019cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1019cf:	83 f8 13             	cmp    $0x13,%eax
  1019d2:	77 0c                	ja     1019e0 <trapname+0x17>
        return excnames[trapno];
  1019d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d7:	8b 04 85 c0 3e 10 00 	mov    0x103ec0(,%eax,4),%eax
  1019de:	eb 18                	jmp    1019f8 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1019e0:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1019e4:	7e 0d                	jle    1019f3 <trapname+0x2a>
  1019e6:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019ea:	7f 07                	jg     1019f3 <trapname+0x2a>
        return "Hardware Interrupt";
  1019ec:	b8 7f 3b 10 00       	mov    $0x103b7f,%eax
  1019f1:	eb 05                	jmp    1019f8 <trapname+0x2f>
    }
    return "(unknown trap)";
  1019f3:	b8 92 3b 10 00       	mov    $0x103b92,%eax
}
  1019f8:	5d                   	pop    %ebp
  1019f9:	c3                   	ret    

001019fa <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019fa:	55                   	push   %ebp
  1019fb:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019fd:	8b 45 08             	mov    0x8(%ebp),%eax
  101a00:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a04:	83 f8 08             	cmp    $0x8,%eax
  101a07:	0f 94 c0             	sete   %al
  101a0a:	0f b6 c0             	movzbl %al,%eax
}
  101a0d:	5d                   	pop    %ebp
  101a0e:	c3                   	ret    

00101a0f <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101a0f:	55                   	push   %ebp
  101a10:	89 e5                	mov    %esp,%ebp
  101a12:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101a15:	8b 45 08             	mov    0x8(%ebp),%eax
  101a18:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a1c:	c7 04 24 d3 3b 10 00 	movl   $0x103bd3,(%esp)
  101a23:	e8 f5 e8 ff ff       	call   10031d <cprintf>
    print_regs(&tf->tf_regs);
  101a28:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2b:	89 04 24             	mov    %eax,(%esp)
  101a2e:	e8 8d 01 00 00       	call   101bc0 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a33:	8b 45 08             	mov    0x8(%ebp),%eax
  101a36:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a3a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a3e:	c7 04 24 e4 3b 10 00 	movl   $0x103be4,(%esp)
  101a45:	e8 d3 e8 ff ff       	call   10031d <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a4a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a4d:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a51:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a55:	c7 04 24 f7 3b 10 00 	movl   $0x103bf7,(%esp)
  101a5c:	e8 bc e8 ff ff       	call   10031d <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a61:	8b 45 08             	mov    0x8(%ebp),%eax
  101a64:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a68:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a6c:	c7 04 24 0a 3c 10 00 	movl   $0x103c0a,(%esp)
  101a73:	e8 a5 e8 ff ff       	call   10031d <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a78:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7b:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a7f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a83:	c7 04 24 1d 3c 10 00 	movl   $0x103c1d,(%esp)
  101a8a:	e8 8e e8 ff ff       	call   10031d <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a8f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a92:	8b 40 30             	mov    0x30(%eax),%eax
  101a95:	89 04 24             	mov    %eax,(%esp)
  101a98:	e8 2c ff ff ff       	call   1019c9 <trapname>
  101a9d:	8b 55 08             	mov    0x8(%ebp),%edx
  101aa0:	8b 52 30             	mov    0x30(%edx),%edx
  101aa3:	89 44 24 08          	mov    %eax,0x8(%esp)
  101aa7:	89 54 24 04          	mov    %edx,0x4(%esp)
  101aab:	c7 04 24 30 3c 10 00 	movl   $0x103c30,(%esp)
  101ab2:	e8 66 e8 ff ff       	call   10031d <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101ab7:	8b 45 08             	mov    0x8(%ebp),%eax
  101aba:	8b 40 34             	mov    0x34(%eax),%eax
  101abd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac1:	c7 04 24 42 3c 10 00 	movl   $0x103c42,(%esp)
  101ac8:	e8 50 e8 ff ff       	call   10031d <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101acd:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad0:	8b 40 38             	mov    0x38(%eax),%eax
  101ad3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ad7:	c7 04 24 51 3c 10 00 	movl   $0x103c51,(%esp)
  101ade:	e8 3a e8 ff ff       	call   10031d <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101ae3:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae6:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101aea:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aee:	c7 04 24 60 3c 10 00 	movl   $0x103c60,(%esp)
  101af5:	e8 23 e8 ff ff       	call   10031d <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101afa:	8b 45 08             	mov    0x8(%ebp),%eax
  101afd:	8b 40 40             	mov    0x40(%eax),%eax
  101b00:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b04:	c7 04 24 73 3c 10 00 	movl   $0x103c73,(%esp)
  101b0b:	e8 0d e8 ff ff       	call   10031d <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b10:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101b17:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101b1e:	eb 3d                	jmp    101b5d <print_trapframe+0x14e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101b20:	8b 45 08             	mov    0x8(%ebp),%eax
  101b23:	8b 50 40             	mov    0x40(%eax),%edx
  101b26:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b29:	21 d0                	and    %edx,%eax
  101b2b:	85 c0                	test   %eax,%eax
  101b2d:	74 28                	je     101b57 <print_trapframe+0x148>
  101b2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b32:	8b 04 85 80 05 11 00 	mov    0x110580(,%eax,4),%eax
  101b39:	85 c0                	test   %eax,%eax
  101b3b:	74 1a                	je     101b57 <print_trapframe+0x148>
            cprintf("%s,", IA32flags[i]);
  101b3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b40:	8b 04 85 80 05 11 00 	mov    0x110580(,%eax,4),%eax
  101b47:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b4b:	c7 04 24 82 3c 10 00 	movl   $0x103c82,(%esp)
  101b52:	e8 c6 e7 ff ff       	call   10031d <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b57:	ff 45 f4             	incl   -0xc(%ebp)
  101b5a:	d1 65 f0             	shll   -0x10(%ebp)
  101b5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b60:	83 f8 17             	cmp    $0x17,%eax
  101b63:	76 bb                	jbe    101b20 <print_trapframe+0x111>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b65:	8b 45 08             	mov    0x8(%ebp),%eax
  101b68:	8b 40 40             	mov    0x40(%eax),%eax
  101b6b:	c1 e8 0c             	shr    $0xc,%eax
  101b6e:	83 e0 03             	and    $0x3,%eax
  101b71:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b75:	c7 04 24 86 3c 10 00 	movl   $0x103c86,(%esp)
  101b7c:	e8 9c e7 ff ff       	call   10031d <cprintf>

    if (!trap_in_kernel(tf)) {
  101b81:	8b 45 08             	mov    0x8(%ebp),%eax
  101b84:	89 04 24             	mov    %eax,(%esp)
  101b87:	e8 6e fe ff ff       	call   1019fa <trap_in_kernel>
  101b8c:	85 c0                	test   %eax,%eax
  101b8e:	75 2d                	jne    101bbd <print_trapframe+0x1ae>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b90:	8b 45 08             	mov    0x8(%ebp),%eax
  101b93:	8b 40 44             	mov    0x44(%eax),%eax
  101b96:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b9a:	c7 04 24 8f 3c 10 00 	movl   $0x103c8f,(%esp)
  101ba1:	e8 77 e7 ff ff       	call   10031d <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101ba6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba9:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101bad:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb1:	c7 04 24 9e 3c 10 00 	movl   $0x103c9e,(%esp)
  101bb8:	e8 60 e7 ff ff       	call   10031d <cprintf>
    }
}
  101bbd:	90                   	nop
  101bbe:	c9                   	leave  
  101bbf:	c3                   	ret    

00101bc0 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101bc0:	55                   	push   %ebp
  101bc1:	89 e5                	mov    %esp,%ebp
  101bc3:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101bc6:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc9:	8b 00                	mov    (%eax),%eax
  101bcb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bcf:	c7 04 24 b1 3c 10 00 	movl   $0x103cb1,(%esp)
  101bd6:	e8 42 e7 ff ff       	call   10031d <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101bdb:	8b 45 08             	mov    0x8(%ebp),%eax
  101bde:	8b 40 04             	mov    0x4(%eax),%eax
  101be1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101be5:	c7 04 24 c0 3c 10 00 	movl   $0x103cc0,(%esp)
  101bec:	e8 2c e7 ff ff       	call   10031d <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bf1:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf4:	8b 40 08             	mov    0x8(%eax),%eax
  101bf7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bfb:	c7 04 24 cf 3c 10 00 	movl   $0x103ccf,(%esp)
  101c02:	e8 16 e7 ff ff       	call   10031d <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101c07:	8b 45 08             	mov    0x8(%ebp),%eax
  101c0a:	8b 40 0c             	mov    0xc(%eax),%eax
  101c0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c11:	c7 04 24 de 3c 10 00 	movl   $0x103cde,(%esp)
  101c18:	e8 00 e7 ff ff       	call   10031d <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c1d:	8b 45 08             	mov    0x8(%ebp),%eax
  101c20:	8b 40 10             	mov    0x10(%eax),%eax
  101c23:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c27:	c7 04 24 ed 3c 10 00 	movl   $0x103ced,(%esp)
  101c2e:	e8 ea e6 ff ff       	call   10031d <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c33:	8b 45 08             	mov    0x8(%ebp),%eax
  101c36:	8b 40 14             	mov    0x14(%eax),%eax
  101c39:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c3d:	c7 04 24 fc 3c 10 00 	movl   $0x103cfc,(%esp)
  101c44:	e8 d4 e6 ff ff       	call   10031d <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c49:	8b 45 08             	mov    0x8(%ebp),%eax
  101c4c:	8b 40 18             	mov    0x18(%eax),%eax
  101c4f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c53:	c7 04 24 0b 3d 10 00 	movl   $0x103d0b,(%esp)
  101c5a:	e8 be e6 ff ff       	call   10031d <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c5f:	8b 45 08             	mov    0x8(%ebp),%eax
  101c62:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c65:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c69:	c7 04 24 1a 3d 10 00 	movl   $0x103d1a,(%esp)
  101c70:	e8 a8 e6 ff ff       	call   10031d <cprintf>
}
  101c75:	90                   	nop
  101c76:	c9                   	leave  
  101c77:	c3                   	ret    

00101c78 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
struct trapframe switchk2u, *switchu2k;//创建trapeframe
static struct trapframe *saved_tf;//challenge2中保存trapframe地址
static void
trap_dispatch(struct trapframe *tf) {
  101c78:	55                   	push   %ebp
  101c79:	89 e5                	mov    %esp,%ebp
  101c7b:	57                   	push   %edi
  101c7c:	56                   	push   %esi
  101c7d:	53                   	push   %ebx
  101c7e:	83 ec 2c             	sub    $0x2c,%esp
    char c;
    switch (tf->tf_trapno) {
  101c81:	8b 45 08             	mov    0x8(%ebp),%eax
  101c84:	8b 40 30             	mov    0x30(%eax),%eax
  101c87:	83 f8 79             	cmp    $0x79,%eax
  101c8a:	0f 84 d3 02 00 00    	je     101f63 <trap_dispatch+0x2eb>
  101c90:	83 f8 79             	cmp    $0x79,%eax
  101c93:	0f 87 47 03 00 00    	ja     101fe0 <trap_dispatch+0x368>
  101c99:	83 f8 78             	cmp    $0x78,%eax
  101c9c:	0f 84 dd 01 00 00    	je     101e7f <trap_dispatch+0x207>
  101ca2:	83 f8 78             	cmp    $0x78,%eax
  101ca5:	0f 87 35 03 00 00    	ja     101fe0 <trap_dispatch+0x368>
  101cab:	83 f8 2f             	cmp    $0x2f,%eax
  101cae:	0f 87 2c 03 00 00    	ja     101fe0 <trap_dispatch+0x368>
  101cb4:	83 f8 2e             	cmp    $0x2e,%eax
  101cb7:	0f 83 58 03 00 00    	jae    102015 <trap_dispatch+0x39d>
  101cbd:	83 f8 24             	cmp    $0x24,%eax
  101cc0:	74 5e                	je     101d20 <trap_dispatch+0xa8>
  101cc2:	83 f8 24             	cmp    $0x24,%eax
  101cc5:	0f 87 15 03 00 00    	ja     101fe0 <trap_dispatch+0x368>
  101ccb:	83 f8 20             	cmp    $0x20,%eax
  101cce:	74 0a                	je     101cda <trap_dispatch+0x62>
  101cd0:	83 f8 21             	cmp    $0x21,%eax
  101cd3:	74 74                	je     101d49 <trap_dispatch+0xd1>
  101cd5:	e9 06 03 00 00       	jmp    101fe0 <trap_dispatch+0x368>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks++;//TICK_NUM在开头被定义为100
  101cda:	a1 28 19 11 00       	mov    0x111928,%eax
  101cdf:	40                   	inc    %eax
  101ce0:	a3 28 19 11 00       	mov    %eax,0x111928
        if(ticks%TICK_NUM==0)
  101ce5:	8b 0d 28 19 11 00    	mov    0x111928,%ecx
  101ceb:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101cf0:	89 c8                	mov    %ecx,%eax
  101cf2:	f7 e2                	mul    %edx
  101cf4:	c1 ea 05             	shr    $0x5,%edx
  101cf7:	89 d0                	mov    %edx,%eax
  101cf9:	c1 e0 02             	shl    $0x2,%eax
  101cfc:	01 d0                	add    %edx,%eax
  101cfe:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101d05:	01 d0                	add    %edx,%eax
  101d07:	c1 e0 02             	shl    $0x2,%eax
  101d0a:	29 c1                	sub    %eax,%ecx
  101d0c:	89 ca                	mov    %ecx,%edx
  101d0e:	85 d2                	test   %edx,%edx
  101d10:	0f 85 02 03 00 00    	jne    102018 <trap_dispatch+0x3a0>
        {
            print_ticks();
  101d16:	e8 fc fa ff ff       	call   101817 <print_ticks>
        }
        break;
  101d1b:	e9 f8 02 00 00       	jmp    102018 <trap_dispatch+0x3a0>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101d20:	e8 b0 f8 ff ff       	call   1015d5 <cons_getc>
  101d25:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101d28:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d2c:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d30:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d34:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d38:	c7 04 24 29 3d 10 00 	movl   $0x103d29,(%esp)
  101d3f:	e8 d9 e5 ff ff       	call   10031d <cprintf>
        break;
  101d44:	e9 d9 02 00 00       	jmp    102022 <trap_dispatch+0x3aa>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d49:	e8 87 f8 ff ff       	call   1015d5 <cons_getc>
  101d4e:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d51:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d55:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d59:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d61:	c7 04 24 3b 3d 10 00 	movl   $0x103d3b,(%esp)
  101d68:	e8 b0 e5 ff ff       	call   10031d <cprintf>

        //challenge2键盘中断
        if (c == 0x30) { // 0切内核 ASCII
  101d6d:	80 7d e7 30          	cmpb   $0x30,-0x19(%ebp)
  101d71:	75 6a                	jne    101ddd <trap_dispatch+0x165>
		saved_tf = __move_up_stack2((uint32_t)(tf) + sizeof(struct trapframe) - 8, (uint32_t) tf, tf->tf_esp);
  101d73:	8b 45 08             	mov    0x8(%ebp),%eax
  101d76:	8b 50 44             	mov    0x44(%eax),%edx
  101d79:	8b 45 08             	mov    0x8(%ebp),%eax
  101d7c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101d7f:	83 c1 44             	add    $0x44,%ecx
  101d82:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d86:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d8a:	89 0c 24             	mov    %ecx,(%esp)
  101d8d:	e8 16 03 00 00       	call   1020a8 <__move_up_stack2>
  101d92:	a3 a0 18 11 00       	mov    %eax,0x1118a0
		saved_tf->tf_cs = KERNEL_CS;
  101d97:	a1 a0 18 11 00       	mov    0x1118a0,%eax
  101d9c:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
		saved_tf->tf_ds = saved_tf->tf_es = saved_tf->tf_fs = saved_tf->tf_gs = KERNEL_DS;
  101da2:	a1 a0 18 11 00       	mov    0x1118a0,%eax
  101da7:	66 c7 40 20 10 00    	movw   $0x10,0x20(%eax)
  101dad:	8b 15 a0 18 11 00    	mov    0x1118a0,%edx
  101db3:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101db7:	66 89 42 24          	mov    %ax,0x24(%edx)
  101dbb:	a1 a0 18 11 00       	mov    0x1118a0,%eax
  101dc0:	0f b7 52 24          	movzwl 0x24(%edx),%edx
  101dc4:	66 89 50 28          	mov    %dx,0x28(%eax)
  101dc8:	8b 15 a0 18 11 00    	mov    0x1118a0,%edx
  101dce:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101dd2:	66 89 42 2c          	mov    %ax,0x2c(%edx)
		asm volatile (
  101dd6:	b8 10 00 00 00       	mov    $0x10,%eax
  101ddb:	8e d0                	mov    %eax,%ss
				"movw %0, %%ss"
				:
				: "r"(KERNEL_DS)
			     );
	}
	if (c == 0x33) { // 3切用户
  101ddd:	80 7d e7 33          	cmpb   $0x33,-0x19(%ebp)
  101de1:	0f 85 34 02 00 00    	jne    10201b <trap_dispatch+0x3a3>
		saved_tf = (struct trapname*) ((uint32_t)(tf) - 8);
  101de7:	8b 45 08             	mov    0x8(%ebp),%eax
  101dea:	83 e8 08             	sub    $0x8,%eax
  101ded:	a3 a0 18 11 00       	mov    %eax,0x1118a0

		__move_down_stack2( (uint32_t)(tf) + sizeof(struct trapframe) - 8 , (uint32_t) tf );
  101df2:	8b 45 08             	mov    0x8(%ebp),%eax
  101df5:	8b 55 08             	mov    0x8(%ebp),%edx
  101df8:	83 c2 44             	add    $0x44,%edx
  101dfb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101dff:	89 14 24             	mov    %edx,(%esp)
  101e02:	e8 5a 02 00 00       	call   102061 <__move_down_stack2>

		saved_tf->tf_eflags |= FL_IOPL_MASK;
  101e07:	a1 a0 18 11 00       	mov    0x1118a0,%eax
  101e0c:	8b 50 40             	mov    0x40(%eax),%edx
  101e0f:	a1 a0 18 11 00       	mov    0x1118a0,%eax
  101e14:	81 ca 00 30 00 00    	or     $0x3000,%edx
  101e1a:	89 50 40             	mov    %edx,0x40(%eax)
		saved_tf->tf_cs = USER_CS;
  101e1d:	a1 a0 18 11 00       	mov    0x1118a0,%eax
  101e22:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
		saved_tf->tf_ds = saved_tf->tf_es = saved_tf->tf_fs = saved_tf->tf_ss = saved_tf->tf_gs = USER_DS;
  101e28:	8b 15 a0 18 11 00    	mov    0x1118a0,%edx
  101e2e:	66 c7 42 20 23 00    	movw   $0x23,0x20(%edx)
  101e34:	a1 a0 18 11 00       	mov    0x1118a0,%eax
  101e39:	0f b7 52 20          	movzwl 0x20(%edx),%edx
  101e3d:	66 89 50 48          	mov    %dx,0x48(%eax)
  101e41:	8b 15 a0 18 11 00    	mov    0x1118a0,%edx
  101e47:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101e4b:	66 89 42 24          	mov    %ax,0x24(%edx)
  101e4f:	a1 a0 18 11 00       	mov    0x1118a0,%eax
  101e54:	0f b7 52 24          	movzwl 0x24(%edx),%edx
  101e58:	66 89 50 28          	mov    %dx,0x28(%eax)
  101e5c:	8b 15 a0 18 11 00    	mov    0x1118a0,%edx
  101e62:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101e66:	66 89 42 2c          	mov    %ax,0x2c(%edx)
		saved_tf->tf_esp = (uint32_t)(saved_tf + 1);
  101e6a:	a1 a0 18 11 00       	mov    0x1118a0,%eax
  101e6f:	8d 50 4c             	lea    0x4c(%eax),%edx
  101e72:	a1 a0 18 11 00       	mov    0x1118a0,%eax
  101e77:	89 50 44             	mov    %edx,0x44(%eax)
	}
        break;
  101e7a:	e9 9c 01 00 00       	jmp    10201b <trap_dispatch+0x3a3>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    //将调用io所需权限降低，才能正常输出文本
    case T_SWITCH_TOU:
        if (tf->tf_cs != USER_CS) {
  101e7f:	8b 45 08             	mov    0x8(%ebp),%eax
  101e82:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e86:	83 f8 1b             	cmp    $0x1b,%eax
  101e89:	0f 84 8f 01 00 00    	je     10201e <trap_dispatch+0x3a6>
            //当前在内核态，需要建立切换到user所需的trapframe结构的数据switchktou
            switchk2u = *tf;
  101e8f:	8b 55 08             	mov    0x8(%ebp),%edx
  101e92:	b8 40 19 11 00       	mov    $0x111940,%eax
  101e97:	bb 4c 00 00 00       	mov    $0x4c,%ebx
  101e9c:	89 c1                	mov    %eax,%ecx
  101e9e:	83 e1 01             	and    $0x1,%ecx
  101ea1:	85 c9                	test   %ecx,%ecx
  101ea3:	74 0c                	je     101eb1 <trap_dispatch+0x239>
  101ea5:	0f b6 0a             	movzbl (%edx),%ecx
  101ea8:	88 08                	mov    %cl,(%eax)
  101eaa:	8d 40 01             	lea    0x1(%eax),%eax
  101ead:	8d 52 01             	lea    0x1(%edx),%edx
  101eb0:	4b                   	dec    %ebx
  101eb1:	89 c1                	mov    %eax,%ecx
  101eb3:	83 e1 02             	and    $0x2,%ecx
  101eb6:	85 c9                	test   %ecx,%ecx
  101eb8:	74 0f                	je     101ec9 <trap_dispatch+0x251>
  101eba:	0f b7 0a             	movzwl (%edx),%ecx
  101ebd:	66 89 08             	mov    %cx,(%eax)
  101ec0:	8d 40 02             	lea    0x2(%eax),%eax
  101ec3:	8d 52 02             	lea    0x2(%edx),%edx
  101ec6:	83 eb 02             	sub    $0x2,%ebx
  101ec9:	89 df                	mov    %ebx,%edi
  101ecb:	83 e7 fc             	and    $0xfffffffc,%edi
  101ece:	b9 00 00 00 00       	mov    $0x0,%ecx
  101ed3:	8b 34 0a             	mov    (%edx,%ecx,1),%esi
  101ed6:	89 34 08             	mov    %esi,(%eax,%ecx,1)
  101ed9:	83 c1 04             	add    $0x4,%ecx
  101edc:	39 f9                	cmp    %edi,%ecx
  101ede:	72 f3                	jb     101ed3 <trap_dispatch+0x25b>
  101ee0:	01 c8                	add    %ecx,%eax
  101ee2:	01 ca                	add    %ecx,%edx
  101ee4:	b9 00 00 00 00       	mov    $0x0,%ecx
  101ee9:	89 de                	mov    %ebx,%esi
  101eeb:	83 e6 02             	and    $0x2,%esi
  101eee:	85 f6                	test   %esi,%esi
  101ef0:	74 0b                	je     101efd <trap_dispatch+0x285>
  101ef2:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
  101ef6:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
  101efa:	83 c1 02             	add    $0x2,%ecx
  101efd:	83 e3 01             	and    $0x1,%ebx
  101f00:	85 db                	test   %ebx,%ebx
  101f02:	74 07                	je     101f0b <trap_dispatch+0x293>
  101f04:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
  101f08:	88 14 08             	mov    %dl,(%eax,%ecx,1)
            //将CS,DS,ES,SS都设置为user
            switchk2u.tf_cs = USER_CS;
  101f0b:	66 c7 05 7c 19 11 00 	movw   $0x1b,0x11197c
  101f12:	1b 00 
            switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;
  101f14:	66 c7 05 88 19 11 00 	movw   $0x23,0x111988
  101f1b:	23 00 
  101f1d:	0f b7 05 88 19 11 00 	movzwl 0x111988,%eax
  101f24:	66 a3 68 19 11 00    	mov    %ax,0x111968
  101f2a:	0f b7 05 68 19 11 00 	movzwl 0x111968,%eax
  101f31:	66 a3 6c 19 11 00    	mov    %ax,0x11196c
            switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
  101f37:	8b 45 08             	mov    0x8(%ebp),%eax
  101f3a:	83 c0 44             	add    $0x44,%eax
  101f3d:	a3 84 19 11 00       	mov    %eax,0x111984
            //设置EFLAG的I/O特权位，使得在用户态可使用in/out指令
            switchk2u.tf_eflags |= FL_IOPL_MASK;
  101f42:	a1 80 19 11 00       	mov    0x111980,%eax
  101f47:	0d 00 30 00 00       	or     $0x3000,%eax
  101f4c:	a3 80 19 11 00       	mov    %eax,0x111980
            //设置临时栈，指向switchktou，iret返回时，CPU会从switchktou恢复数据
            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
  101f51:	8b 45 08             	mov    0x8(%ebp),%eax
  101f54:	83 e8 04             	sub    $0x4,%eax
  101f57:	ba 40 19 11 00       	mov    $0x111940,%edx
  101f5c:	89 10                	mov    %edx,(%eax)
        }
        break;
  101f5e:	e9 bb 00 00 00       	jmp    10201e <trap_dispatch+0x3a6>
    case T_SWITCH_TOK:
        if (tf->tf_cs != KERNEL_CS) {
  101f63:	8b 45 08             	mov    0x8(%ebp),%eax
  101f66:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101f6a:	83 f8 08             	cmp    $0x8,%eax
  101f6d:	0f 84 ae 00 00 00    	je     102021 <trap_dispatch+0x3a9>
            //发出中断时CPU处于用户态，在处理完此中断后，CPU扔在内核态运行，
            //所以把tf->tf_cs和tf->tf_ds都设置为内核代码段和内核数据段
            tf->tf_cs = KERNEL_CS;
  101f73:	8b 45 08             	mov    0x8(%ebp),%eax
  101f76:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds = tf->tf_es = KERNEL_DS;
  101f7c:	8b 45 08             	mov    0x8(%ebp),%eax
  101f7f:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101f85:	8b 45 08             	mov    0x8(%ebp),%eax
  101f88:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101f8c:	8b 45 08             	mov    0x8(%ebp),%eax
  101f8f:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            //设置EFLAGS，让用户态不能执行in/out指令
            tf->tf_eflags &= ~FL_IOPL_MASK;
  101f93:	8b 45 08             	mov    0x8(%ebp),%eax
  101f96:	8b 40 40             	mov    0x40(%eax),%eax
  101f99:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101f9e:	89 c2                	mov    %eax,%edx
  101fa0:	8b 45 08             	mov    0x8(%ebp),%eax
  101fa3:	89 50 40             	mov    %edx,0x40(%eax)
            switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));
  101fa6:	8b 45 08             	mov    0x8(%ebp),%eax
  101fa9:	8b 40 44             	mov    0x44(%eax),%eax
  101fac:	83 e8 44             	sub    $0x44,%eax
  101faf:	a3 8c 19 11 00       	mov    %eax,0x11198c
            //在栈中留出sizeof(tf-8)的空间把user的数据放过去
            memmove(switchu2k, tf, sizeof(struct trapframe) - 8);
  101fb4:	a1 8c 19 11 00       	mov    0x11198c,%eax
  101fb9:	c7 44 24 08 44 00 00 	movl   $0x44,0x8(%esp)
  101fc0:	00 
  101fc1:	8b 55 08             	mov    0x8(%ebp),%edx
  101fc4:	89 54 24 04          	mov    %edx,0x4(%esp)
  101fc8:	89 04 24             	mov    %eax,(%esp)
  101fcb:	e8 c6 16 00 00       	call   103696 <memmove>
            //设置临时栈，指向switchktok，iret返回时，CPU会从switchktok恢复数据
            *((uint32_t *)tf - 1) = (uint32_t)switchu2k;
  101fd0:	8b 15 8c 19 11 00    	mov    0x11198c,%edx
  101fd6:	8b 45 08             	mov    0x8(%ebp),%eax
  101fd9:	83 e8 04             	sub    $0x4,%eax
  101fdc:	89 10                	mov    %edx,(%eax)
        }
        break;
  101fde:	eb 41                	jmp    102021 <trap_dispatch+0x3a9>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101fe0:	8b 45 08             	mov    0x8(%ebp),%eax
  101fe3:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101fe7:	83 e0 03             	and    $0x3,%eax
  101fea:	85 c0                	test   %eax,%eax
  101fec:	75 34                	jne    102022 <trap_dispatch+0x3aa>
            print_trapframe(tf);
  101fee:	8b 45 08             	mov    0x8(%ebp),%eax
  101ff1:	89 04 24             	mov    %eax,(%esp)
  101ff4:	e8 16 fa ff ff       	call   101a0f <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101ff9:	c7 44 24 08 4a 3d 10 	movl   $0x103d4a,0x8(%esp)
  102000:	00 
  102001:	c7 44 24 04 ef 00 00 	movl   $0xef,0x4(%esp)
  102008:	00 
  102009:	c7 04 24 6e 3b 10 00 	movl   $0x103b6e,(%esp)
  102010:	e8 6c ec ff ff       	call   100c81 <__panic>
        break;
  102015:	90                   	nop
  102016:	eb 0a                	jmp    102022 <trap_dispatch+0x3aa>
        break;
  102018:	90                   	nop
  102019:	eb 07                	jmp    102022 <trap_dispatch+0x3aa>
        break;
  10201b:	90                   	nop
  10201c:	eb 04                	jmp    102022 <trap_dispatch+0x3aa>
        break;
  10201e:	90                   	nop
  10201f:	eb 01                	jmp    102022 <trap_dispatch+0x3aa>
        break;
  102021:	90                   	nop
        }
    }
}
  102022:	90                   	nop
  102023:	83 c4 2c             	add    $0x2c,%esp
  102026:	5b                   	pop    %ebx
  102027:	5e                   	pop    %esi
  102028:	5f                   	pop    %edi
  102029:	5d                   	pop    %ebp
  10202a:	c3                   	ret    

0010202b <trap>:
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * alltraps会call trap
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  10202b:	55                   	push   %ebp
  10202c:	89 e5                	mov    %esp,%ebp
  10202e:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  102031:	8b 45 08             	mov    0x8(%ebp),%eax
  102034:	89 04 24             	mov    %eax,(%esp)
  102037:	e8 3c fc ff ff       	call   101c78 <trap_dispatch>
}
  10203c:	90                   	nop
  10203d:	c9                   	leave  
  10203e:	c3                   	ret    

0010203f <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  10203f:	1e                   	push   %ds
    pushl %es
  102040:	06                   	push   %es
    pushl %fs
  102041:	0f a0                	push   %fs
    pushl %gs
  102043:	0f a8                	push   %gs
    pushal
  102045:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102046:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  10204b:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  10204d:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  10204f:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102050:	e8 d6 ff ff ff       	call   10202b <trap>

    # pop the pushed stack pointer
    popl %esp
  102055:	5c                   	pop    %esp

00102056 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102056:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102057:	0f a9                	pop    %gs
    popl %fs
  102059:	0f a1                	pop    %fs
    popl %es
  10205b:	07                   	pop    %es
    popl %ds
  10205c:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  10205d:	83 c4 08             	add    $0x8,%esp
    iret
  102060:	cf                   	iret   

00102061 <__move_down_stack2>:

#challenge2
.globl __move_down_stack2 
# 整个栈向下平移2字节用以保存esp ss
__move_down_stack2:
    pushl %ebp
  102061:	55                   	push   %ebp
    movl %esp, %ebp
  102062:	89 e5                	mov    %esp,%ebp

    pushl %ebx
  102064:	53                   	push   %ebx
    pushl %esi
  102065:	56                   	push   %esi
    pushl %edi
  102066:	57                   	push   %edi

    movl 8(%ebp), %ebx # ebx用来保存当前trapframe的最高地址
  102067:	8b 5d 08             	mov    0x8(%ebp),%ebx
    movl 12(%ebp), %edi #分别减8得到真正的值
  10206a:	8b 7d 0c             	mov    0xc(%ebp),%edi
    subl $8, -4(%edi) # 修改esp的值使其与平移过后的栈保持一致
  10206d:	83 6f fc 08          	subl   $0x8,-0x4(%edi)
    movl %esp, %eax
  102071:	89 e0                	mov    %esp,%eax

    cmpl %eax, %ebx
  102073:	39 c3                	cmp    %eax,%ebx
    jle loop_end
  102075:	7e 0c                	jle    102083 <loop_end>

00102077 <loop_start>:

loop_start:
    movb (%eax), %cl
  102077:	8a 08                	mov    (%eax),%cl
    movb %cl, -8(%eax)
  102079:	88 48 f8             	mov    %cl,-0x8(%eax)
    addl $1, %eax
  10207c:	83 c0 01             	add    $0x1,%eax
    cmpl %eax, %ebx
  10207f:	39 c3                	cmp    %eax,%ebx
    jg loop_start
  102081:	7f f4                	jg     102077 <loop_start>

00102083 <loop_end>:

loop_end: 
    subl $8, %esp 
  102083:	83 ec 08             	sub    $0x8,%esp
    subl $8, %ebp 
  102086:	83 ed 08             	sub    $0x8,%ebp
    
    movl %ebp, %eax
  102089:	89 e8                	mov    %ebp,%eax
    cmpl %eax, %ebx
  10208b:	39 c3                	cmp    %eax,%ebx
    jle ebp_loop_end
  10208d:	7e 14                	jle    1020a3 <ebp_loop_end>

0010208f <ebp_loop_begin>:

ebp_loop_begin:
    movl (%eax), %ecx
  10208f:	8b 08                	mov    (%eax),%ecx

    cmpl $0, %ecx
  102091:	83 f9 00             	cmp    $0x0,%ecx
    je ebp_loop_end
  102094:	74 0d                	je     1020a3 <ebp_loop_end>
    cmpl %ecx, %ebx
  102096:	39 cb                	cmp    %ecx,%ebx
    jle ebp_loop_end
  102098:	7e 09                	jle    1020a3 <ebp_loop_end>
    subl $8, %ecx
  10209a:	83 e9 08             	sub    $0x8,%ecx
    movl %ecx, (%eax)
  10209d:	89 08                	mov    %ecx,(%eax)
    movl %ecx, %eax
  10209f:	89 c8                	mov    %ecx,%eax
    jmp ebp_loop_begin
  1020a1:	eb ec                	jmp    10208f <ebp_loop_begin>

001020a3 <ebp_loop_end>:

ebp_loop_end:

    popl %edi
  1020a3:	5f                   	pop    %edi
    popl %esi
  1020a4:	5e                   	pop    %esi
    popl %ebx
  1020a5:	5b                   	pop    %ebx

    popl %ebp
  1020a6:	5d                   	pop    %ebp
    ret 
  1020a7:	c3                   	ret    

001020a8 <__move_up_stack2>:

.globl __move_up_stack2
# 整个栈向上平移2字节用以保存esp ss
__move_up_stack2:
    pushl %ebp 
  1020a8:	55                   	push   %ebp
    movl %esp, %ebp
  1020a9:	89 e5                	mov    %esp,%ebp

    pushl %ebx
  1020ab:	53                   	push   %ebx
    pushl %edi
  1020ac:	57                   	push   %edi
    pushl %esi
  1020ad:	56                   	push   %esi

#把所有的tf_end以下的copy到用户栈 
    movl 8(%ebp), %eax
  1020ae:	8b 45 08             	mov    0x8(%ebp),%eax
    subl $1, %eax
  1020b1:	83 e8 01             	sub    $0x1,%eax
    movl 16(%ebp), %ebx # ebx存用户栈指针
  1020b4:	8b 5d 10             	mov    0x10(%ebp),%ebx
    
    cmpl %eax, %esp
  1020b7:	39 c4                	cmp    %eax,%esp
    jg copy_loop_end
  1020b9:	7f 0e                	jg     1020c9 <copy_loop_end>

001020bb <copy_loop_begin>:

copy_loop_begin:
    subl $1, %ebx
  1020bb:	83 eb 01             	sub    $0x1,%ebx
    movb (%eax), %cl
  1020be:	8a 08                	mov    (%eax),%cl
    movb %cl, (%ebx)
  1020c0:	88 0b                	mov    %cl,(%ebx)

    subl $1, %eax
  1020c2:	83 e8 01             	sub    $0x1,%eax
    cmpl %eax, %esp
  1020c5:	39 c4                	cmp    %eax,%esp
    jle copy_loop_begin
  1020c7:	7e f2                	jle    1020bb <copy_loop_begin>

001020c9 <copy_loop_end>:

copy_loop_end:

#将ebp中所有的值都修正
    movl %ebp, %eax
  1020c9:	89 e8                	mov    %ebp,%eax
    cmpl %eax, 8(%ebp)
  1020cb:	39 45 08             	cmp    %eax,0x8(%ebp)
    jle fix_ebp_loop_end
  1020ce:	7e 20                	jle    1020f0 <fix_ebp_loop_end>

001020d0 <fix_ebp_loop_begin>:

fix_ebp_loop_begin:
    movl %eax, %edi
  1020d0:	89 c7                	mov    %eax,%edi
    subl 8(%ebp), %edi
  1020d2:	2b 7d 08             	sub    0x8(%ebp),%edi
    addl 16(%ebp), %edi # edi <=> eax
  1020d5:	03 7d 10             	add    0x10(%ebp),%edi

    cmpl (%eax), %esp 
  1020d8:	3b 20                	cmp    (%eax),%esp
    jle normal_condition
  1020da:	7e 06                	jle    1020e2 <normal_condition>
    movl (%eax), %esi
  1020dc:	8b 30                	mov    (%eax),%esi
    movl %esi, (%edi)
  1020de:	89 37                	mov    %esi,(%edi)
    jmp fix_ebp_loop_end
  1020e0:	eb 0e                	jmp    1020f0 <fix_ebp_loop_end>

001020e2 <normal_condition>:

normal_condition:
    movl (%eax), %esi
  1020e2:	8b 30                	mov    (%eax),%esi
    subl 8(%ebp), %esi
  1020e4:	2b 75 08             	sub    0x8(%ebp),%esi
    addl 16(%ebp), %esi
  1020e7:	03 75 10             	add    0x10(%ebp),%esi
    movl %esi, (%edi)
  1020ea:	89 37                	mov    %esi,(%edi)
    movl (%eax), %eax
  1020ec:	8b 00                	mov    (%eax),%eax
    jmp fix_ebp_loop_begin
  1020ee:	eb e0                	jmp    1020d0 <fix_ebp_loop_begin>

001020f0 <fix_ebp_loop_end>:

fix_ebp_loop_end:

    movl 12(%ebp), %eax
  1020f0:	8b 45 0c             	mov    0xc(%ebp),%eax
    subl $4, %eax
  1020f3:	83 e8 04             	sub    $0x4,%eax

    movl %eax, %edi
  1020f6:	89 c7                	mov    %eax,%edi
    subl 8(%ebp), %edi
  1020f8:	2b 7d 08             	sub    0x8(%ebp),%edi
    addl 16(%ebp), %edi
  1020fb:	03 7d 10             	add    0x10(%ebp),%edi

    movl (%eax), %esi
  1020fe:	8b 30                	mov    (%eax),%esi
    subl 8(%ebp), %esi
  102100:	2b 75 08             	sub    0x8(%ebp),%esi
    addl 16(%ebp), %esi
  102103:	03 75 10             	add    0x10(%ebp),%esi

    movl %esi, (%edi)
  102106:	89 37                	mov    %esi,(%edi)

    movl 12(%ebp), %eax
  102108:	8b 45 0c             	mov    0xc(%ebp),%eax
    subl 8(%ebp), %eax
  10210b:	2b 45 08             	sub    0x8(%ebp),%eax
    addl 16(%ebp), %eax
  10210e:	03 45 10             	add    0x10(%ebp),%eax

# switch to user stack
    movl %ebx, %esp
  102111:	89 dc                	mov    %ebx,%esp
    movl %ebp, %esi
  102113:	89 ee                	mov    %ebp,%esi
    subl 8(%ebp), %esi
  102115:	2b 75 08             	sub    0x8(%ebp),%esi
    addl 16(%ebp), %esi
  102118:	03 75 10             	add    0x10(%ebp),%esi
    movl %esi, %ebp
  10211b:	89 f5                	mov    %esi,%ebp

    popl %esi
  10211d:	5e                   	pop    %esi
    popl %edi
  10211e:	5f                   	pop    %edi
    popl %ebx
  10211f:	5b                   	pop    %ebx

    popl %ebp
  102120:	5d                   	pop    %ebp
    ret
  102121:	c3                   	ret    

00102122 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  102122:	6a 00                	push   $0x0
  pushl $0
  102124:	6a 00                	push   $0x0
  jmp __alltraps
  102126:	e9 14 ff ff ff       	jmp    10203f <__alltraps>

0010212b <vector1>:
.globl vector1
vector1:
  pushl $0
  10212b:	6a 00                	push   $0x0
  pushl $1
  10212d:	6a 01                	push   $0x1
  jmp __alltraps
  10212f:	e9 0b ff ff ff       	jmp    10203f <__alltraps>

00102134 <vector2>:
.globl vector2
vector2:
  pushl $0
  102134:	6a 00                	push   $0x0
  pushl $2
  102136:	6a 02                	push   $0x2
  jmp __alltraps
  102138:	e9 02 ff ff ff       	jmp    10203f <__alltraps>

0010213d <vector3>:
.globl vector3
vector3:
  pushl $0
  10213d:	6a 00                	push   $0x0
  pushl $3
  10213f:	6a 03                	push   $0x3
  jmp __alltraps
  102141:	e9 f9 fe ff ff       	jmp    10203f <__alltraps>

00102146 <vector4>:
.globl vector4
vector4:
  pushl $0
  102146:	6a 00                	push   $0x0
  pushl $4
  102148:	6a 04                	push   $0x4
  jmp __alltraps
  10214a:	e9 f0 fe ff ff       	jmp    10203f <__alltraps>

0010214f <vector5>:
.globl vector5
vector5:
  pushl $0
  10214f:	6a 00                	push   $0x0
  pushl $5
  102151:	6a 05                	push   $0x5
  jmp __alltraps
  102153:	e9 e7 fe ff ff       	jmp    10203f <__alltraps>

00102158 <vector6>:
.globl vector6
vector6:
  pushl $0
  102158:	6a 00                	push   $0x0
  pushl $6
  10215a:	6a 06                	push   $0x6
  jmp __alltraps
  10215c:	e9 de fe ff ff       	jmp    10203f <__alltraps>

00102161 <vector7>:
.globl vector7
vector7:
  pushl $0
  102161:	6a 00                	push   $0x0
  pushl $7
  102163:	6a 07                	push   $0x7
  jmp __alltraps
  102165:	e9 d5 fe ff ff       	jmp    10203f <__alltraps>

0010216a <vector8>:
.globl vector8
vector8:
  pushl $8
  10216a:	6a 08                	push   $0x8
  jmp __alltraps
  10216c:	e9 ce fe ff ff       	jmp    10203f <__alltraps>

00102171 <vector9>:
.globl vector9
vector9:
  pushl $9
  102171:	6a 09                	push   $0x9
  jmp __alltraps
  102173:	e9 c7 fe ff ff       	jmp    10203f <__alltraps>

00102178 <vector10>:
.globl vector10
vector10:
  pushl $10
  102178:	6a 0a                	push   $0xa
  jmp __alltraps
  10217a:	e9 c0 fe ff ff       	jmp    10203f <__alltraps>

0010217f <vector11>:
.globl vector11
vector11:
  pushl $11
  10217f:	6a 0b                	push   $0xb
  jmp __alltraps
  102181:	e9 b9 fe ff ff       	jmp    10203f <__alltraps>

00102186 <vector12>:
.globl vector12
vector12:
  pushl $12
  102186:	6a 0c                	push   $0xc
  jmp __alltraps
  102188:	e9 b2 fe ff ff       	jmp    10203f <__alltraps>

0010218d <vector13>:
.globl vector13
vector13:
  pushl $13
  10218d:	6a 0d                	push   $0xd
  jmp __alltraps
  10218f:	e9 ab fe ff ff       	jmp    10203f <__alltraps>

00102194 <vector14>:
.globl vector14
vector14:
  pushl $14
  102194:	6a 0e                	push   $0xe
  jmp __alltraps
  102196:	e9 a4 fe ff ff       	jmp    10203f <__alltraps>

0010219b <vector15>:
.globl vector15
vector15:
  pushl $0
  10219b:	6a 00                	push   $0x0
  pushl $15
  10219d:	6a 0f                	push   $0xf
  jmp __alltraps
  10219f:	e9 9b fe ff ff       	jmp    10203f <__alltraps>

001021a4 <vector16>:
.globl vector16
vector16:
  pushl $0
  1021a4:	6a 00                	push   $0x0
  pushl $16
  1021a6:	6a 10                	push   $0x10
  jmp __alltraps
  1021a8:	e9 92 fe ff ff       	jmp    10203f <__alltraps>

001021ad <vector17>:
.globl vector17
vector17:
  pushl $17
  1021ad:	6a 11                	push   $0x11
  jmp __alltraps
  1021af:	e9 8b fe ff ff       	jmp    10203f <__alltraps>

001021b4 <vector18>:
.globl vector18
vector18:
  pushl $0
  1021b4:	6a 00                	push   $0x0
  pushl $18
  1021b6:	6a 12                	push   $0x12
  jmp __alltraps
  1021b8:	e9 82 fe ff ff       	jmp    10203f <__alltraps>

001021bd <vector19>:
.globl vector19
vector19:
  pushl $0
  1021bd:	6a 00                	push   $0x0
  pushl $19
  1021bf:	6a 13                	push   $0x13
  jmp __alltraps
  1021c1:	e9 79 fe ff ff       	jmp    10203f <__alltraps>

001021c6 <vector20>:
.globl vector20
vector20:
  pushl $0
  1021c6:	6a 00                	push   $0x0
  pushl $20
  1021c8:	6a 14                	push   $0x14
  jmp __alltraps
  1021ca:	e9 70 fe ff ff       	jmp    10203f <__alltraps>

001021cf <vector21>:
.globl vector21
vector21:
  pushl $0
  1021cf:	6a 00                	push   $0x0
  pushl $21
  1021d1:	6a 15                	push   $0x15
  jmp __alltraps
  1021d3:	e9 67 fe ff ff       	jmp    10203f <__alltraps>

001021d8 <vector22>:
.globl vector22
vector22:
  pushl $0
  1021d8:	6a 00                	push   $0x0
  pushl $22
  1021da:	6a 16                	push   $0x16
  jmp __alltraps
  1021dc:	e9 5e fe ff ff       	jmp    10203f <__alltraps>

001021e1 <vector23>:
.globl vector23
vector23:
  pushl $0
  1021e1:	6a 00                	push   $0x0
  pushl $23
  1021e3:	6a 17                	push   $0x17
  jmp __alltraps
  1021e5:	e9 55 fe ff ff       	jmp    10203f <__alltraps>

001021ea <vector24>:
.globl vector24
vector24:
  pushl $0
  1021ea:	6a 00                	push   $0x0
  pushl $24
  1021ec:	6a 18                	push   $0x18
  jmp __alltraps
  1021ee:	e9 4c fe ff ff       	jmp    10203f <__alltraps>

001021f3 <vector25>:
.globl vector25
vector25:
  pushl $0
  1021f3:	6a 00                	push   $0x0
  pushl $25
  1021f5:	6a 19                	push   $0x19
  jmp __alltraps
  1021f7:	e9 43 fe ff ff       	jmp    10203f <__alltraps>

001021fc <vector26>:
.globl vector26
vector26:
  pushl $0
  1021fc:	6a 00                	push   $0x0
  pushl $26
  1021fe:	6a 1a                	push   $0x1a
  jmp __alltraps
  102200:	e9 3a fe ff ff       	jmp    10203f <__alltraps>

00102205 <vector27>:
.globl vector27
vector27:
  pushl $0
  102205:	6a 00                	push   $0x0
  pushl $27
  102207:	6a 1b                	push   $0x1b
  jmp __alltraps
  102209:	e9 31 fe ff ff       	jmp    10203f <__alltraps>

0010220e <vector28>:
.globl vector28
vector28:
  pushl $0
  10220e:	6a 00                	push   $0x0
  pushl $28
  102210:	6a 1c                	push   $0x1c
  jmp __alltraps
  102212:	e9 28 fe ff ff       	jmp    10203f <__alltraps>

00102217 <vector29>:
.globl vector29
vector29:
  pushl $0
  102217:	6a 00                	push   $0x0
  pushl $29
  102219:	6a 1d                	push   $0x1d
  jmp __alltraps
  10221b:	e9 1f fe ff ff       	jmp    10203f <__alltraps>

00102220 <vector30>:
.globl vector30
vector30:
  pushl $0
  102220:	6a 00                	push   $0x0
  pushl $30
  102222:	6a 1e                	push   $0x1e
  jmp __alltraps
  102224:	e9 16 fe ff ff       	jmp    10203f <__alltraps>

00102229 <vector31>:
.globl vector31
vector31:
  pushl $0
  102229:	6a 00                	push   $0x0
  pushl $31
  10222b:	6a 1f                	push   $0x1f
  jmp __alltraps
  10222d:	e9 0d fe ff ff       	jmp    10203f <__alltraps>

00102232 <vector32>:
.globl vector32
vector32:
  pushl $0
  102232:	6a 00                	push   $0x0
  pushl $32
  102234:	6a 20                	push   $0x20
  jmp __alltraps
  102236:	e9 04 fe ff ff       	jmp    10203f <__alltraps>

0010223b <vector33>:
.globl vector33
vector33:
  pushl $0
  10223b:	6a 00                	push   $0x0
  pushl $33
  10223d:	6a 21                	push   $0x21
  jmp __alltraps
  10223f:	e9 fb fd ff ff       	jmp    10203f <__alltraps>

00102244 <vector34>:
.globl vector34
vector34:
  pushl $0
  102244:	6a 00                	push   $0x0
  pushl $34
  102246:	6a 22                	push   $0x22
  jmp __alltraps
  102248:	e9 f2 fd ff ff       	jmp    10203f <__alltraps>

0010224d <vector35>:
.globl vector35
vector35:
  pushl $0
  10224d:	6a 00                	push   $0x0
  pushl $35
  10224f:	6a 23                	push   $0x23
  jmp __alltraps
  102251:	e9 e9 fd ff ff       	jmp    10203f <__alltraps>

00102256 <vector36>:
.globl vector36
vector36:
  pushl $0
  102256:	6a 00                	push   $0x0
  pushl $36
  102258:	6a 24                	push   $0x24
  jmp __alltraps
  10225a:	e9 e0 fd ff ff       	jmp    10203f <__alltraps>

0010225f <vector37>:
.globl vector37
vector37:
  pushl $0
  10225f:	6a 00                	push   $0x0
  pushl $37
  102261:	6a 25                	push   $0x25
  jmp __alltraps
  102263:	e9 d7 fd ff ff       	jmp    10203f <__alltraps>

00102268 <vector38>:
.globl vector38
vector38:
  pushl $0
  102268:	6a 00                	push   $0x0
  pushl $38
  10226a:	6a 26                	push   $0x26
  jmp __alltraps
  10226c:	e9 ce fd ff ff       	jmp    10203f <__alltraps>

00102271 <vector39>:
.globl vector39
vector39:
  pushl $0
  102271:	6a 00                	push   $0x0
  pushl $39
  102273:	6a 27                	push   $0x27
  jmp __alltraps
  102275:	e9 c5 fd ff ff       	jmp    10203f <__alltraps>

0010227a <vector40>:
.globl vector40
vector40:
  pushl $0
  10227a:	6a 00                	push   $0x0
  pushl $40
  10227c:	6a 28                	push   $0x28
  jmp __alltraps
  10227e:	e9 bc fd ff ff       	jmp    10203f <__alltraps>

00102283 <vector41>:
.globl vector41
vector41:
  pushl $0
  102283:	6a 00                	push   $0x0
  pushl $41
  102285:	6a 29                	push   $0x29
  jmp __alltraps
  102287:	e9 b3 fd ff ff       	jmp    10203f <__alltraps>

0010228c <vector42>:
.globl vector42
vector42:
  pushl $0
  10228c:	6a 00                	push   $0x0
  pushl $42
  10228e:	6a 2a                	push   $0x2a
  jmp __alltraps
  102290:	e9 aa fd ff ff       	jmp    10203f <__alltraps>

00102295 <vector43>:
.globl vector43
vector43:
  pushl $0
  102295:	6a 00                	push   $0x0
  pushl $43
  102297:	6a 2b                	push   $0x2b
  jmp __alltraps
  102299:	e9 a1 fd ff ff       	jmp    10203f <__alltraps>

0010229e <vector44>:
.globl vector44
vector44:
  pushl $0
  10229e:	6a 00                	push   $0x0
  pushl $44
  1022a0:	6a 2c                	push   $0x2c
  jmp __alltraps
  1022a2:	e9 98 fd ff ff       	jmp    10203f <__alltraps>

001022a7 <vector45>:
.globl vector45
vector45:
  pushl $0
  1022a7:	6a 00                	push   $0x0
  pushl $45
  1022a9:	6a 2d                	push   $0x2d
  jmp __alltraps
  1022ab:	e9 8f fd ff ff       	jmp    10203f <__alltraps>

001022b0 <vector46>:
.globl vector46
vector46:
  pushl $0
  1022b0:	6a 00                	push   $0x0
  pushl $46
  1022b2:	6a 2e                	push   $0x2e
  jmp __alltraps
  1022b4:	e9 86 fd ff ff       	jmp    10203f <__alltraps>

001022b9 <vector47>:
.globl vector47
vector47:
  pushl $0
  1022b9:	6a 00                	push   $0x0
  pushl $47
  1022bb:	6a 2f                	push   $0x2f
  jmp __alltraps
  1022bd:	e9 7d fd ff ff       	jmp    10203f <__alltraps>

001022c2 <vector48>:
.globl vector48
vector48:
  pushl $0
  1022c2:	6a 00                	push   $0x0
  pushl $48
  1022c4:	6a 30                	push   $0x30
  jmp __alltraps
  1022c6:	e9 74 fd ff ff       	jmp    10203f <__alltraps>

001022cb <vector49>:
.globl vector49
vector49:
  pushl $0
  1022cb:	6a 00                	push   $0x0
  pushl $49
  1022cd:	6a 31                	push   $0x31
  jmp __alltraps
  1022cf:	e9 6b fd ff ff       	jmp    10203f <__alltraps>

001022d4 <vector50>:
.globl vector50
vector50:
  pushl $0
  1022d4:	6a 00                	push   $0x0
  pushl $50
  1022d6:	6a 32                	push   $0x32
  jmp __alltraps
  1022d8:	e9 62 fd ff ff       	jmp    10203f <__alltraps>

001022dd <vector51>:
.globl vector51
vector51:
  pushl $0
  1022dd:	6a 00                	push   $0x0
  pushl $51
  1022df:	6a 33                	push   $0x33
  jmp __alltraps
  1022e1:	e9 59 fd ff ff       	jmp    10203f <__alltraps>

001022e6 <vector52>:
.globl vector52
vector52:
  pushl $0
  1022e6:	6a 00                	push   $0x0
  pushl $52
  1022e8:	6a 34                	push   $0x34
  jmp __alltraps
  1022ea:	e9 50 fd ff ff       	jmp    10203f <__alltraps>

001022ef <vector53>:
.globl vector53
vector53:
  pushl $0
  1022ef:	6a 00                	push   $0x0
  pushl $53
  1022f1:	6a 35                	push   $0x35
  jmp __alltraps
  1022f3:	e9 47 fd ff ff       	jmp    10203f <__alltraps>

001022f8 <vector54>:
.globl vector54
vector54:
  pushl $0
  1022f8:	6a 00                	push   $0x0
  pushl $54
  1022fa:	6a 36                	push   $0x36
  jmp __alltraps
  1022fc:	e9 3e fd ff ff       	jmp    10203f <__alltraps>

00102301 <vector55>:
.globl vector55
vector55:
  pushl $0
  102301:	6a 00                	push   $0x0
  pushl $55
  102303:	6a 37                	push   $0x37
  jmp __alltraps
  102305:	e9 35 fd ff ff       	jmp    10203f <__alltraps>

0010230a <vector56>:
.globl vector56
vector56:
  pushl $0
  10230a:	6a 00                	push   $0x0
  pushl $56
  10230c:	6a 38                	push   $0x38
  jmp __alltraps
  10230e:	e9 2c fd ff ff       	jmp    10203f <__alltraps>

00102313 <vector57>:
.globl vector57
vector57:
  pushl $0
  102313:	6a 00                	push   $0x0
  pushl $57
  102315:	6a 39                	push   $0x39
  jmp __alltraps
  102317:	e9 23 fd ff ff       	jmp    10203f <__alltraps>

0010231c <vector58>:
.globl vector58
vector58:
  pushl $0
  10231c:	6a 00                	push   $0x0
  pushl $58
  10231e:	6a 3a                	push   $0x3a
  jmp __alltraps
  102320:	e9 1a fd ff ff       	jmp    10203f <__alltraps>

00102325 <vector59>:
.globl vector59
vector59:
  pushl $0
  102325:	6a 00                	push   $0x0
  pushl $59
  102327:	6a 3b                	push   $0x3b
  jmp __alltraps
  102329:	e9 11 fd ff ff       	jmp    10203f <__alltraps>

0010232e <vector60>:
.globl vector60
vector60:
  pushl $0
  10232e:	6a 00                	push   $0x0
  pushl $60
  102330:	6a 3c                	push   $0x3c
  jmp __alltraps
  102332:	e9 08 fd ff ff       	jmp    10203f <__alltraps>

00102337 <vector61>:
.globl vector61
vector61:
  pushl $0
  102337:	6a 00                	push   $0x0
  pushl $61
  102339:	6a 3d                	push   $0x3d
  jmp __alltraps
  10233b:	e9 ff fc ff ff       	jmp    10203f <__alltraps>

00102340 <vector62>:
.globl vector62
vector62:
  pushl $0
  102340:	6a 00                	push   $0x0
  pushl $62
  102342:	6a 3e                	push   $0x3e
  jmp __alltraps
  102344:	e9 f6 fc ff ff       	jmp    10203f <__alltraps>

00102349 <vector63>:
.globl vector63
vector63:
  pushl $0
  102349:	6a 00                	push   $0x0
  pushl $63
  10234b:	6a 3f                	push   $0x3f
  jmp __alltraps
  10234d:	e9 ed fc ff ff       	jmp    10203f <__alltraps>

00102352 <vector64>:
.globl vector64
vector64:
  pushl $0
  102352:	6a 00                	push   $0x0
  pushl $64
  102354:	6a 40                	push   $0x40
  jmp __alltraps
  102356:	e9 e4 fc ff ff       	jmp    10203f <__alltraps>

0010235b <vector65>:
.globl vector65
vector65:
  pushl $0
  10235b:	6a 00                	push   $0x0
  pushl $65
  10235d:	6a 41                	push   $0x41
  jmp __alltraps
  10235f:	e9 db fc ff ff       	jmp    10203f <__alltraps>

00102364 <vector66>:
.globl vector66
vector66:
  pushl $0
  102364:	6a 00                	push   $0x0
  pushl $66
  102366:	6a 42                	push   $0x42
  jmp __alltraps
  102368:	e9 d2 fc ff ff       	jmp    10203f <__alltraps>

0010236d <vector67>:
.globl vector67
vector67:
  pushl $0
  10236d:	6a 00                	push   $0x0
  pushl $67
  10236f:	6a 43                	push   $0x43
  jmp __alltraps
  102371:	e9 c9 fc ff ff       	jmp    10203f <__alltraps>

00102376 <vector68>:
.globl vector68
vector68:
  pushl $0
  102376:	6a 00                	push   $0x0
  pushl $68
  102378:	6a 44                	push   $0x44
  jmp __alltraps
  10237a:	e9 c0 fc ff ff       	jmp    10203f <__alltraps>

0010237f <vector69>:
.globl vector69
vector69:
  pushl $0
  10237f:	6a 00                	push   $0x0
  pushl $69
  102381:	6a 45                	push   $0x45
  jmp __alltraps
  102383:	e9 b7 fc ff ff       	jmp    10203f <__alltraps>

00102388 <vector70>:
.globl vector70
vector70:
  pushl $0
  102388:	6a 00                	push   $0x0
  pushl $70
  10238a:	6a 46                	push   $0x46
  jmp __alltraps
  10238c:	e9 ae fc ff ff       	jmp    10203f <__alltraps>

00102391 <vector71>:
.globl vector71
vector71:
  pushl $0
  102391:	6a 00                	push   $0x0
  pushl $71
  102393:	6a 47                	push   $0x47
  jmp __alltraps
  102395:	e9 a5 fc ff ff       	jmp    10203f <__alltraps>

0010239a <vector72>:
.globl vector72
vector72:
  pushl $0
  10239a:	6a 00                	push   $0x0
  pushl $72
  10239c:	6a 48                	push   $0x48
  jmp __alltraps
  10239e:	e9 9c fc ff ff       	jmp    10203f <__alltraps>

001023a3 <vector73>:
.globl vector73
vector73:
  pushl $0
  1023a3:	6a 00                	push   $0x0
  pushl $73
  1023a5:	6a 49                	push   $0x49
  jmp __alltraps
  1023a7:	e9 93 fc ff ff       	jmp    10203f <__alltraps>

001023ac <vector74>:
.globl vector74
vector74:
  pushl $0
  1023ac:	6a 00                	push   $0x0
  pushl $74
  1023ae:	6a 4a                	push   $0x4a
  jmp __alltraps
  1023b0:	e9 8a fc ff ff       	jmp    10203f <__alltraps>

001023b5 <vector75>:
.globl vector75
vector75:
  pushl $0
  1023b5:	6a 00                	push   $0x0
  pushl $75
  1023b7:	6a 4b                	push   $0x4b
  jmp __alltraps
  1023b9:	e9 81 fc ff ff       	jmp    10203f <__alltraps>

001023be <vector76>:
.globl vector76
vector76:
  pushl $0
  1023be:	6a 00                	push   $0x0
  pushl $76
  1023c0:	6a 4c                	push   $0x4c
  jmp __alltraps
  1023c2:	e9 78 fc ff ff       	jmp    10203f <__alltraps>

001023c7 <vector77>:
.globl vector77
vector77:
  pushl $0
  1023c7:	6a 00                	push   $0x0
  pushl $77
  1023c9:	6a 4d                	push   $0x4d
  jmp __alltraps
  1023cb:	e9 6f fc ff ff       	jmp    10203f <__alltraps>

001023d0 <vector78>:
.globl vector78
vector78:
  pushl $0
  1023d0:	6a 00                	push   $0x0
  pushl $78
  1023d2:	6a 4e                	push   $0x4e
  jmp __alltraps
  1023d4:	e9 66 fc ff ff       	jmp    10203f <__alltraps>

001023d9 <vector79>:
.globl vector79
vector79:
  pushl $0
  1023d9:	6a 00                	push   $0x0
  pushl $79
  1023db:	6a 4f                	push   $0x4f
  jmp __alltraps
  1023dd:	e9 5d fc ff ff       	jmp    10203f <__alltraps>

001023e2 <vector80>:
.globl vector80
vector80:
  pushl $0
  1023e2:	6a 00                	push   $0x0
  pushl $80
  1023e4:	6a 50                	push   $0x50
  jmp __alltraps
  1023e6:	e9 54 fc ff ff       	jmp    10203f <__alltraps>

001023eb <vector81>:
.globl vector81
vector81:
  pushl $0
  1023eb:	6a 00                	push   $0x0
  pushl $81
  1023ed:	6a 51                	push   $0x51
  jmp __alltraps
  1023ef:	e9 4b fc ff ff       	jmp    10203f <__alltraps>

001023f4 <vector82>:
.globl vector82
vector82:
  pushl $0
  1023f4:	6a 00                	push   $0x0
  pushl $82
  1023f6:	6a 52                	push   $0x52
  jmp __alltraps
  1023f8:	e9 42 fc ff ff       	jmp    10203f <__alltraps>

001023fd <vector83>:
.globl vector83
vector83:
  pushl $0
  1023fd:	6a 00                	push   $0x0
  pushl $83
  1023ff:	6a 53                	push   $0x53
  jmp __alltraps
  102401:	e9 39 fc ff ff       	jmp    10203f <__alltraps>

00102406 <vector84>:
.globl vector84
vector84:
  pushl $0
  102406:	6a 00                	push   $0x0
  pushl $84
  102408:	6a 54                	push   $0x54
  jmp __alltraps
  10240a:	e9 30 fc ff ff       	jmp    10203f <__alltraps>

0010240f <vector85>:
.globl vector85
vector85:
  pushl $0
  10240f:	6a 00                	push   $0x0
  pushl $85
  102411:	6a 55                	push   $0x55
  jmp __alltraps
  102413:	e9 27 fc ff ff       	jmp    10203f <__alltraps>

00102418 <vector86>:
.globl vector86
vector86:
  pushl $0
  102418:	6a 00                	push   $0x0
  pushl $86
  10241a:	6a 56                	push   $0x56
  jmp __alltraps
  10241c:	e9 1e fc ff ff       	jmp    10203f <__alltraps>

00102421 <vector87>:
.globl vector87
vector87:
  pushl $0
  102421:	6a 00                	push   $0x0
  pushl $87
  102423:	6a 57                	push   $0x57
  jmp __alltraps
  102425:	e9 15 fc ff ff       	jmp    10203f <__alltraps>

0010242a <vector88>:
.globl vector88
vector88:
  pushl $0
  10242a:	6a 00                	push   $0x0
  pushl $88
  10242c:	6a 58                	push   $0x58
  jmp __alltraps
  10242e:	e9 0c fc ff ff       	jmp    10203f <__alltraps>

00102433 <vector89>:
.globl vector89
vector89:
  pushl $0
  102433:	6a 00                	push   $0x0
  pushl $89
  102435:	6a 59                	push   $0x59
  jmp __alltraps
  102437:	e9 03 fc ff ff       	jmp    10203f <__alltraps>

0010243c <vector90>:
.globl vector90
vector90:
  pushl $0
  10243c:	6a 00                	push   $0x0
  pushl $90
  10243e:	6a 5a                	push   $0x5a
  jmp __alltraps
  102440:	e9 fa fb ff ff       	jmp    10203f <__alltraps>

00102445 <vector91>:
.globl vector91
vector91:
  pushl $0
  102445:	6a 00                	push   $0x0
  pushl $91
  102447:	6a 5b                	push   $0x5b
  jmp __alltraps
  102449:	e9 f1 fb ff ff       	jmp    10203f <__alltraps>

0010244e <vector92>:
.globl vector92
vector92:
  pushl $0
  10244e:	6a 00                	push   $0x0
  pushl $92
  102450:	6a 5c                	push   $0x5c
  jmp __alltraps
  102452:	e9 e8 fb ff ff       	jmp    10203f <__alltraps>

00102457 <vector93>:
.globl vector93
vector93:
  pushl $0
  102457:	6a 00                	push   $0x0
  pushl $93
  102459:	6a 5d                	push   $0x5d
  jmp __alltraps
  10245b:	e9 df fb ff ff       	jmp    10203f <__alltraps>

00102460 <vector94>:
.globl vector94
vector94:
  pushl $0
  102460:	6a 00                	push   $0x0
  pushl $94
  102462:	6a 5e                	push   $0x5e
  jmp __alltraps
  102464:	e9 d6 fb ff ff       	jmp    10203f <__alltraps>

00102469 <vector95>:
.globl vector95
vector95:
  pushl $0
  102469:	6a 00                	push   $0x0
  pushl $95
  10246b:	6a 5f                	push   $0x5f
  jmp __alltraps
  10246d:	e9 cd fb ff ff       	jmp    10203f <__alltraps>

00102472 <vector96>:
.globl vector96
vector96:
  pushl $0
  102472:	6a 00                	push   $0x0
  pushl $96
  102474:	6a 60                	push   $0x60
  jmp __alltraps
  102476:	e9 c4 fb ff ff       	jmp    10203f <__alltraps>

0010247b <vector97>:
.globl vector97
vector97:
  pushl $0
  10247b:	6a 00                	push   $0x0
  pushl $97
  10247d:	6a 61                	push   $0x61
  jmp __alltraps
  10247f:	e9 bb fb ff ff       	jmp    10203f <__alltraps>

00102484 <vector98>:
.globl vector98
vector98:
  pushl $0
  102484:	6a 00                	push   $0x0
  pushl $98
  102486:	6a 62                	push   $0x62
  jmp __alltraps
  102488:	e9 b2 fb ff ff       	jmp    10203f <__alltraps>

0010248d <vector99>:
.globl vector99
vector99:
  pushl $0
  10248d:	6a 00                	push   $0x0
  pushl $99
  10248f:	6a 63                	push   $0x63
  jmp __alltraps
  102491:	e9 a9 fb ff ff       	jmp    10203f <__alltraps>

00102496 <vector100>:
.globl vector100
vector100:
  pushl $0
  102496:	6a 00                	push   $0x0
  pushl $100
  102498:	6a 64                	push   $0x64
  jmp __alltraps
  10249a:	e9 a0 fb ff ff       	jmp    10203f <__alltraps>

0010249f <vector101>:
.globl vector101
vector101:
  pushl $0
  10249f:	6a 00                	push   $0x0
  pushl $101
  1024a1:	6a 65                	push   $0x65
  jmp __alltraps
  1024a3:	e9 97 fb ff ff       	jmp    10203f <__alltraps>

001024a8 <vector102>:
.globl vector102
vector102:
  pushl $0
  1024a8:	6a 00                	push   $0x0
  pushl $102
  1024aa:	6a 66                	push   $0x66
  jmp __alltraps
  1024ac:	e9 8e fb ff ff       	jmp    10203f <__alltraps>

001024b1 <vector103>:
.globl vector103
vector103:
  pushl $0
  1024b1:	6a 00                	push   $0x0
  pushl $103
  1024b3:	6a 67                	push   $0x67
  jmp __alltraps
  1024b5:	e9 85 fb ff ff       	jmp    10203f <__alltraps>

001024ba <vector104>:
.globl vector104
vector104:
  pushl $0
  1024ba:	6a 00                	push   $0x0
  pushl $104
  1024bc:	6a 68                	push   $0x68
  jmp __alltraps
  1024be:	e9 7c fb ff ff       	jmp    10203f <__alltraps>

001024c3 <vector105>:
.globl vector105
vector105:
  pushl $0
  1024c3:	6a 00                	push   $0x0
  pushl $105
  1024c5:	6a 69                	push   $0x69
  jmp __alltraps
  1024c7:	e9 73 fb ff ff       	jmp    10203f <__alltraps>

001024cc <vector106>:
.globl vector106
vector106:
  pushl $0
  1024cc:	6a 00                	push   $0x0
  pushl $106
  1024ce:	6a 6a                	push   $0x6a
  jmp __alltraps
  1024d0:	e9 6a fb ff ff       	jmp    10203f <__alltraps>

001024d5 <vector107>:
.globl vector107
vector107:
  pushl $0
  1024d5:	6a 00                	push   $0x0
  pushl $107
  1024d7:	6a 6b                	push   $0x6b
  jmp __alltraps
  1024d9:	e9 61 fb ff ff       	jmp    10203f <__alltraps>

001024de <vector108>:
.globl vector108
vector108:
  pushl $0
  1024de:	6a 00                	push   $0x0
  pushl $108
  1024e0:	6a 6c                	push   $0x6c
  jmp __alltraps
  1024e2:	e9 58 fb ff ff       	jmp    10203f <__alltraps>

001024e7 <vector109>:
.globl vector109
vector109:
  pushl $0
  1024e7:	6a 00                	push   $0x0
  pushl $109
  1024e9:	6a 6d                	push   $0x6d
  jmp __alltraps
  1024eb:	e9 4f fb ff ff       	jmp    10203f <__alltraps>

001024f0 <vector110>:
.globl vector110
vector110:
  pushl $0
  1024f0:	6a 00                	push   $0x0
  pushl $110
  1024f2:	6a 6e                	push   $0x6e
  jmp __alltraps
  1024f4:	e9 46 fb ff ff       	jmp    10203f <__alltraps>

001024f9 <vector111>:
.globl vector111
vector111:
  pushl $0
  1024f9:	6a 00                	push   $0x0
  pushl $111
  1024fb:	6a 6f                	push   $0x6f
  jmp __alltraps
  1024fd:	e9 3d fb ff ff       	jmp    10203f <__alltraps>

00102502 <vector112>:
.globl vector112
vector112:
  pushl $0
  102502:	6a 00                	push   $0x0
  pushl $112
  102504:	6a 70                	push   $0x70
  jmp __alltraps
  102506:	e9 34 fb ff ff       	jmp    10203f <__alltraps>

0010250b <vector113>:
.globl vector113
vector113:
  pushl $0
  10250b:	6a 00                	push   $0x0
  pushl $113
  10250d:	6a 71                	push   $0x71
  jmp __alltraps
  10250f:	e9 2b fb ff ff       	jmp    10203f <__alltraps>

00102514 <vector114>:
.globl vector114
vector114:
  pushl $0
  102514:	6a 00                	push   $0x0
  pushl $114
  102516:	6a 72                	push   $0x72
  jmp __alltraps
  102518:	e9 22 fb ff ff       	jmp    10203f <__alltraps>

0010251d <vector115>:
.globl vector115
vector115:
  pushl $0
  10251d:	6a 00                	push   $0x0
  pushl $115
  10251f:	6a 73                	push   $0x73
  jmp __alltraps
  102521:	e9 19 fb ff ff       	jmp    10203f <__alltraps>

00102526 <vector116>:
.globl vector116
vector116:
  pushl $0
  102526:	6a 00                	push   $0x0
  pushl $116
  102528:	6a 74                	push   $0x74
  jmp __alltraps
  10252a:	e9 10 fb ff ff       	jmp    10203f <__alltraps>

0010252f <vector117>:
.globl vector117
vector117:
  pushl $0
  10252f:	6a 00                	push   $0x0
  pushl $117
  102531:	6a 75                	push   $0x75
  jmp __alltraps
  102533:	e9 07 fb ff ff       	jmp    10203f <__alltraps>

00102538 <vector118>:
.globl vector118
vector118:
  pushl $0
  102538:	6a 00                	push   $0x0
  pushl $118
  10253a:	6a 76                	push   $0x76
  jmp __alltraps
  10253c:	e9 fe fa ff ff       	jmp    10203f <__alltraps>

00102541 <vector119>:
.globl vector119
vector119:
  pushl $0
  102541:	6a 00                	push   $0x0
  pushl $119
  102543:	6a 77                	push   $0x77
  jmp __alltraps
  102545:	e9 f5 fa ff ff       	jmp    10203f <__alltraps>

0010254a <vector120>:
.globl vector120
vector120:
  pushl $0
  10254a:	6a 00                	push   $0x0
  pushl $120
  10254c:	6a 78                	push   $0x78
  jmp __alltraps
  10254e:	e9 ec fa ff ff       	jmp    10203f <__alltraps>

00102553 <vector121>:
.globl vector121
vector121:
  pushl $0
  102553:	6a 00                	push   $0x0
  pushl $121
  102555:	6a 79                	push   $0x79
  jmp __alltraps
  102557:	e9 e3 fa ff ff       	jmp    10203f <__alltraps>

0010255c <vector122>:
.globl vector122
vector122:
  pushl $0
  10255c:	6a 00                	push   $0x0
  pushl $122
  10255e:	6a 7a                	push   $0x7a
  jmp __alltraps
  102560:	e9 da fa ff ff       	jmp    10203f <__alltraps>

00102565 <vector123>:
.globl vector123
vector123:
  pushl $0
  102565:	6a 00                	push   $0x0
  pushl $123
  102567:	6a 7b                	push   $0x7b
  jmp __alltraps
  102569:	e9 d1 fa ff ff       	jmp    10203f <__alltraps>

0010256e <vector124>:
.globl vector124
vector124:
  pushl $0
  10256e:	6a 00                	push   $0x0
  pushl $124
  102570:	6a 7c                	push   $0x7c
  jmp __alltraps
  102572:	e9 c8 fa ff ff       	jmp    10203f <__alltraps>

00102577 <vector125>:
.globl vector125
vector125:
  pushl $0
  102577:	6a 00                	push   $0x0
  pushl $125
  102579:	6a 7d                	push   $0x7d
  jmp __alltraps
  10257b:	e9 bf fa ff ff       	jmp    10203f <__alltraps>

00102580 <vector126>:
.globl vector126
vector126:
  pushl $0
  102580:	6a 00                	push   $0x0
  pushl $126
  102582:	6a 7e                	push   $0x7e
  jmp __alltraps
  102584:	e9 b6 fa ff ff       	jmp    10203f <__alltraps>

00102589 <vector127>:
.globl vector127
vector127:
  pushl $0
  102589:	6a 00                	push   $0x0
  pushl $127
  10258b:	6a 7f                	push   $0x7f
  jmp __alltraps
  10258d:	e9 ad fa ff ff       	jmp    10203f <__alltraps>

00102592 <vector128>:
.globl vector128
vector128:
  pushl $0
  102592:	6a 00                	push   $0x0
  pushl $128
  102594:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102599:	e9 a1 fa ff ff       	jmp    10203f <__alltraps>

0010259e <vector129>:
.globl vector129
vector129:
  pushl $0
  10259e:	6a 00                	push   $0x0
  pushl $129
  1025a0:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  1025a5:	e9 95 fa ff ff       	jmp    10203f <__alltraps>

001025aa <vector130>:
.globl vector130
vector130:
  pushl $0
  1025aa:	6a 00                	push   $0x0
  pushl $130
  1025ac:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  1025b1:	e9 89 fa ff ff       	jmp    10203f <__alltraps>

001025b6 <vector131>:
.globl vector131
vector131:
  pushl $0
  1025b6:	6a 00                	push   $0x0
  pushl $131
  1025b8:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  1025bd:	e9 7d fa ff ff       	jmp    10203f <__alltraps>

001025c2 <vector132>:
.globl vector132
vector132:
  pushl $0
  1025c2:	6a 00                	push   $0x0
  pushl $132
  1025c4:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1025c9:	e9 71 fa ff ff       	jmp    10203f <__alltraps>

001025ce <vector133>:
.globl vector133
vector133:
  pushl $0
  1025ce:	6a 00                	push   $0x0
  pushl $133
  1025d0:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1025d5:	e9 65 fa ff ff       	jmp    10203f <__alltraps>

001025da <vector134>:
.globl vector134
vector134:
  pushl $0
  1025da:	6a 00                	push   $0x0
  pushl $134
  1025dc:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1025e1:	e9 59 fa ff ff       	jmp    10203f <__alltraps>

001025e6 <vector135>:
.globl vector135
vector135:
  pushl $0
  1025e6:	6a 00                	push   $0x0
  pushl $135
  1025e8:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1025ed:	e9 4d fa ff ff       	jmp    10203f <__alltraps>

001025f2 <vector136>:
.globl vector136
vector136:
  pushl $0
  1025f2:	6a 00                	push   $0x0
  pushl $136
  1025f4:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1025f9:	e9 41 fa ff ff       	jmp    10203f <__alltraps>

001025fe <vector137>:
.globl vector137
vector137:
  pushl $0
  1025fe:	6a 00                	push   $0x0
  pushl $137
  102600:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102605:	e9 35 fa ff ff       	jmp    10203f <__alltraps>

0010260a <vector138>:
.globl vector138
vector138:
  pushl $0
  10260a:	6a 00                	push   $0x0
  pushl $138
  10260c:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102611:	e9 29 fa ff ff       	jmp    10203f <__alltraps>

00102616 <vector139>:
.globl vector139
vector139:
  pushl $0
  102616:	6a 00                	push   $0x0
  pushl $139
  102618:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  10261d:	e9 1d fa ff ff       	jmp    10203f <__alltraps>

00102622 <vector140>:
.globl vector140
vector140:
  pushl $0
  102622:	6a 00                	push   $0x0
  pushl $140
  102624:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102629:	e9 11 fa ff ff       	jmp    10203f <__alltraps>

0010262e <vector141>:
.globl vector141
vector141:
  pushl $0
  10262e:	6a 00                	push   $0x0
  pushl $141
  102630:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  102635:	e9 05 fa ff ff       	jmp    10203f <__alltraps>

0010263a <vector142>:
.globl vector142
vector142:
  pushl $0
  10263a:	6a 00                	push   $0x0
  pushl $142
  10263c:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102641:	e9 f9 f9 ff ff       	jmp    10203f <__alltraps>

00102646 <vector143>:
.globl vector143
vector143:
  pushl $0
  102646:	6a 00                	push   $0x0
  pushl $143
  102648:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  10264d:	e9 ed f9 ff ff       	jmp    10203f <__alltraps>

00102652 <vector144>:
.globl vector144
vector144:
  pushl $0
  102652:	6a 00                	push   $0x0
  pushl $144
  102654:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102659:	e9 e1 f9 ff ff       	jmp    10203f <__alltraps>

0010265e <vector145>:
.globl vector145
vector145:
  pushl $0
  10265e:	6a 00                	push   $0x0
  pushl $145
  102660:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102665:	e9 d5 f9 ff ff       	jmp    10203f <__alltraps>

0010266a <vector146>:
.globl vector146
vector146:
  pushl $0
  10266a:	6a 00                	push   $0x0
  pushl $146
  10266c:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102671:	e9 c9 f9 ff ff       	jmp    10203f <__alltraps>

00102676 <vector147>:
.globl vector147
vector147:
  pushl $0
  102676:	6a 00                	push   $0x0
  pushl $147
  102678:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10267d:	e9 bd f9 ff ff       	jmp    10203f <__alltraps>

00102682 <vector148>:
.globl vector148
vector148:
  pushl $0
  102682:	6a 00                	push   $0x0
  pushl $148
  102684:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102689:	e9 b1 f9 ff ff       	jmp    10203f <__alltraps>

0010268e <vector149>:
.globl vector149
vector149:
  pushl $0
  10268e:	6a 00                	push   $0x0
  pushl $149
  102690:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102695:	e9 a5 f9 ff ff       	jmp    10203f <__alltraps>

0010269a <vector150>:
.globl vector150
vector150:
  pushl $0
  10269a:	6a 00                	push   $0x0
  pushl $150
  10269c:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1026a1:	e9 99 f9 ff ff       	jmp    10203f <__alltraps>

001026a6 <vector151>:
.globl vector151
vector151:
  pushl $0
  1026a6:	6a 00                	push   $0x0
  pushl $151
  1026a8:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1026ad:	e9 8d f9 ff ff       	jmp    10203f <__alltraps>

001026b2 <vector152>:
.globl vector152
vector152:
  pushl $0
  1026b2:	6a 00                	push   $0x0
  pushl $152
  1026b4:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1026b9:	e9 81 f9 ff ff       	jmp    10203f <__alltraps>

001026be <vector153>:
.globl vector153
vector153:
  pushl $0
  1026be:	6a 00                	push   $0x0
  pushl $153
  1026c0:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1026c5:	e9 75 f9 ff ff       	jmp    10203f <__alltraps>

001026ca <vector154>:
.globl vector154
vector154:
  pushl $0
  1026ca:	6a 00                	push   $0x0
  pushl $154
  1026cc:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1026d1:	e9 69 f9 ff ff       	jmp    10203f <__alltraps>

001026d6 <vector155>:
.globl vector155
vector155:
  pushl $0
  1026d6:	6a 00                	push   $0x0
  pushl $155
  1026d8:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1026dd:	e9 5d f9 ff ff       	jmp    10203f <__alltraps>

001026e2 <vector156>:
.globl vector156
vector156:
  pushl $0
  1026e2:	6a 00                	push   $0x0
  pushl $156
  1026e4:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1026e9:	e9 51 f9 ff ff       	jmp    10203f <__alltraps>

001026ee <vector157>:
.globl vector157
vector157:
  pushl $0
  1026ee:	6a 00                	push   $0x0
  pushl $157
  1026f0:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1026f5:	e9 45 f9 ff ff       	jmp    10203f <__alltraps>

001026fa <vector158>:
.globl vector158
vector158:
  pushl $0
  1026fa:	6a 00                	push   $0x0
  pushl $158
  1026fc:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102701:	e9 39 f9 ff ff       	jmp    10203f <__alltraps>

00102706 <vector159>:
.globl vector159
vector159:
  pushl $0
  102706:	6a 00                	push   $0x0
  pushl $159
  102708:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  10270d:	e9 2d f9 ff ff       	jmp    10203f <__alltraps>

00102712 <vector160>:
.globl vector160
vector160:
  pushl $0
  102712:	6a 00                	push   $0x0
  pushl $160
  102714:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102719:	e9 21 f9 ff ff       	jmp    10203f <__alltraps>

0010271e <vector161>:
.globl vector161
vector161:
  pushl $0
  10271e:	6a 00                	push   $0x0
  pushl $161
  102720:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102725:	e9 15 f9 ff ff       	jmp    10203f <__alltraps>

0010272a <vector162>:
.globl vector162
vector162:
  pushl $0
  10272a:	6a 00                	push   $0x0
  pushl $162
  10272c:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102731:	e9 09 f9 ff ff       	jmp    10203f <__alltraps>

00102736 <vector163>:
.globl vector163
vector163:
  pushl $0
  102736:	6a 00                	push   $0x0
  pushl $163
  102738:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  10273d:	e9 fd f8 ff ff       	jmp    10203f <__alltraps>

00102742 <vector164>:
.globl vector164
vector164:
  pushl $0
  102742:	6a 00                	push   $0x0
  pushl $164
  102744:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102749:	e9 f1 f8 ff ff       	jmp    10203f <__alltraps>

0010274e <vector165>:
.globl vector165
vector165:
  pushl $0
  10274e:	6a 00                	push   $0x0
  pushl $165
  102750:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102755:	e9 e5 f8 ff ff       	jmp    10203f <__alltraps>

0010275a <vector166>:
.globl vector166
vector166:
  pushl $0
  10275a:	6a 00                	push   $0x0
  pushl $166
  10275c:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102761:	e9 d9 f8 ff ff       	jmp    10203f <__alltraps>

00102766 <vector167>:
.globl vector167
vector167:
  pushl $0
  102766:	6a 00                	push   $0x0
  pushl $167
  102768:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  10276d:	e9 cd f8 ff ff       	jmp    10203f <__alltraps>

00102772 <vector168>:
.globl vector168
vector168:
  pushl $0
  102772:	6a 00                	push   $0x0
  pushl $168
  102774:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102779:	e9 c1 f8 ff ff       	jmp    10203f <__alltraps>

0010277e <vector169>:
.globl vector169
vector169:
  pushl $0
  10277e:	6a 00                	push   $0x0
  pushl $169
  102780:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102785:	e9 b5 f8 ff ff       	jmp    10203f <__alltraps>

0010278a <vector170>:
.globl vector170
vector170:
  pushl $0
  10278a:	6a 00                	push   $0x0
  pushl $170
  10278c:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102791:	e9 a9 f8 ff ff       	jmp    10203f <__alltraps>

00102796 <vector171>:
.globl vector171
vector171:
  pushl $0
  102796:	6a 00                	push   $0x0
  pushl $171
  102798:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10279d:	e9 9d f8 ff ff       	jmp    10203f <__alltraps>

001027a2 <vector172>:
.globl vector172
vector172:
  pushl $0
  1027a2:	6a 00                	push   $0x0
  pushl $172
  1027a4:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1027a9:	e9 91 f8 ff ff       	jmp    10203f <__alltraps>

001027ae <vector173>:
.globl vector173
vector173:
  pushl $0
  1027ae:	6a 00                	push   $0x0
  pushl $173
  1027b0:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1027b5:	e9 85 f8 ff ff       	jmp    10203f <__alltraps>

001027ba <vector174>:
.globl vector174
vector174:
  pushl $0
  1027ba:	6a 00                	push   $0x0
  pushl $174
  1027bc:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1027c1:	e9 79 f8 ff ff       	jmp    10203f <__alltraps>

001027c6 <vector175>:
.globl vector175
vector175:
  pushl $0
  1027c6:	6a 00                	push   $0x0
  pushl $175
  1027c8:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1027cd:	e9 6d f8 ff ff       	jmp    10203f <__alltraps>

001027d2 <vector176>:
.globl vector176
vector176:
  pushl $0
  1027d2:	6a 00                	push   $0x0
  pushl $176
  1027d4:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1027d9:	e9 61 f8 ff ff       	jmp    10203f <__alltraps>

001027de <vector177>:
.globl vector177
vector177:
  pushl $0
  1027de:	6a 00                	push   $0x0
  pushl $177
  1027e0:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1027e5:	e9 55 f8 ff ff       	jmp    10203f <__alltraps>

001027ea <vector178>:
.globl vector178
vector178:
  pushl $0
  1027ea:	6a 00                	push   $0x0
  pushl $178
  1027ec:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1027f1:	e9 49 f8 ff ff       	jmp    10203f <__alltraps>

001027f6 <vector179>:
.globl vector179
vector179:
  pushl $0
  1027f6:	6a 00                	push   $0x0
  pushl $179
  1027f8:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1027fd:	e9 3d f8 ff ff       	jmp    10203f <__alltraps>

00102802 <vector180>:
.globl vector180
vector180:
  pushl $0
  102802:	6a 00                	push   $0x0
  pushl $180
  102804:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102809:	e9 31 f8 ff ff       	jmp    10203f <__alltraps>

0010280e <vector181>:
.globl vector181
vector181:
  pushl $0
  10280e:	6a 00                	push   $0x0
  pushl $181
  102810:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102815:	e9 25 f8 ff ff       	jmp    10203f <__alltraps>

0010281a <vector182>:
.globl vector182
vector182:
  pushl $0
  10281a:	6a 00                	push   $0x0
  pushl $182
  10281c:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102821:	e9 19 f8 ff ff       	jmp    10203f <__alltraps>

00102826 <vector183>:
.globl vector183
vector183:
  pushl $0
  102826:	6a 00                	push   $0x0
  pushl $183
  102828:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  10282d:	e9 0d f8 ff ff       	jmp    10203f <__alltraps>

00102832 <vector184>:
.globl vector184
vector184:
  pushl $0
  102832:	6a 00                	push   $0x0
  pushl $184
  102834:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102839:	e9 01 f8 ff ff       	jmp    10203f <__alltraps>

0010283e <vector185>:
.globl vector185
vector185:
  pushl $0
  10283e:	6a 00                	push   $0x0
  pushl $185
  102840:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102845:	e9 f5 f7 ff ff       	jmp    10203f <__alltraps>

0010284a <vector186>:
.globl vector186
vector186:
  pushl $0
  10284a:	6a 00                	push   $0x0
  pushl $186
  10284c:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102851:	e9 e9 f7 ff ff       	jmp    10203f <__alltraps>

00102856 <vector187>:
.globl vector187
vector187:
  pushl $0
  102856:	6a 00                	push   $0x0
  pushl $187
  102858:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  10285d:	e9 dd f7 ff ff       	jmp    10203f <__alltraps>

00102862 <vector188>:
.globl vector188
vector188:
  pushl $0
  102862:	6a 00                	push   $0x0
  pushl $188
  102864:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102869:	e9 d1 f7 ff ff       	jmp    10203f <__alltraps>

0010286e <vector189>:
.globl vector189
vector189:
  pushl $0
  10286e:	6a 00                	push   $0x0
  pushl $189
  102870:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102875:	e9 c5 f7 ff ff       	jmp    10203f <__alltraps>

0010287a <vector190>:
.globl vector190
vector190:
  pushl $0
  10287a:	6a 00                	push   $0x0
  pushl $190
  10287c:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102881:	e9 b9 f7 ff ff       	jmp    10203f <__alltraps>

00102886 <vector191>:
.globl vector191
vector191:
  pushl $0
  102886:	6a 00                	push   $0x0
  pushl $191
  102888:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10288d:	e9 ad f7 ff ff       	jmp    10203f <__alltraps>

00102892 <vector192>:
.globl vector192
vector192:
  pushl $0
  102892:	6a 00                	push   $0x0
  pushl $192
  102894:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102899:	e9 a1 f7 ff ff       	jmp    10203f <__alltraps>

0010289e <vector193>:
.globl vector193
vector193:
  pushl $0
  10289e:	6a 00                	push   $0x0
  pushl $193
  1028a0:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1028a5:	e9 95 f7 ff ff       	jmp    10203f <__alltraps>

001028aa <vector194>:
.globl vector194
vector194:
  pushl $0
  1028aa:	6a 00                	push   $0x0
  pushl $194
  1028ac:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1028b1:	e9 89 f7 ff ff       	jmp    10203f <__alltraps>

001028b6 <vector195>:
.globl vector195
vector195:
  pushl $0
  1028b6:	6a 00                	push   $0x0
  pushl $195
  1028b8:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1028bd:	e9 7d f7 ff ff       	jmp    10203f <__alltraps>

001028c2 <vector196>:
.globl vector196
vector196:
  pushl $0
  1028c2:	6a 00                	push   $0x0
  pushl $196
  1028c4:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1028c9:	e9 71 f7 ff ff       	jmp    10203f <__alltraps>

001028ce <vector197>:
.globl vector197
vector197:
  pushl $0
  1028ce:	6a 00                	push   $0x0
  pushl $197
  1028d0:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1028d5:	e9 65 f7 ff ff       	jmp    10203f <__alltraps>

001028da <vector198>:
.globl vector198
vector198:
  pushl $0
  1028da:	6a 00                	push   $0x0
  pushl $198
  1028dc:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1028e1:	e9 59 f7 ff ff       	jmp    10203f <__alltraps>

001028e6 <vector199>:
.globl vector199
vector199:
  pushl $0
  1028e6:	6a 00                	push   $0x0
  pushl $199
  1028e8:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1028ed:	e9 4d f7 ff ff       	jmp    10203f <__alltraps>

001028f2 <vector200>:
.globl vector200
vector200:
  pushl $0
  1028f2:	6a 00                	push   $0x0
  pushl $200
  1028f4:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1028f9:	e9 41 f7 ff ff       	jmp    10203f <__alltraps>

001028fe <vector201>:
.globl vector201
vector201:
  pushl $0
  1028fe:	6a 00                	push   $0x0
  pushl $201
  102900:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102905:	e9 35 f7 ff ff       	jmp    10203f <__alltraps>

0010290a <vector202>:
.globl vector202
vector202:
  pushl $0
  10290a:	6a 00                	push   $0x0
  pushl $202
  10290c:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102911:	e9 29 f7 ff ff       	jmp    10203f <__alltraps>

00102916 <vector203>:
.globl vector203
vector203:
  pushl $0
  102916:	6a 00                	push   $0x0
  pushl $203
  102918:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  10291d:	e9 1d f7 ff ff       	jmp    10203f <__alltraps>

00102922 <vector204>:
.globl vector204
vector204:
  pushl $0
  102922:	6a 00                	push   $0x0
  pushl $204
  102924:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102929:	e9 11 f7 ff ff       	jmp    10203f <__alltraps>

0010292e <vector205>:
.globl vector205
vector205:
  pushl $0
  10292e:	6a 00                	push   $0x0
  pushl $205
  102930:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  102935:	e9 05 f7 ff ff       	jmp    10203f <__alltraps>

0010293a <vector206>:
.globl vector206
vector206:
  pushl $0
  10293a:	6a 00                	push   $0x0
  pushl $206
  10293c:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102941:	e9 f9 f6 ff ff       	jmp    10203f <__alltraps>

00102946 <vector207>:
.globl vector207
vector207:
  pushl $0
  102946:	6a 00                	push   $0x0
  pushl $207
  102948:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  10294d:	e9 ed f6 ff ff       	jmp    10203f <__alltraps>

00102952 <vector208>:
.globl vector208
vector208:
  pushl $0
  102952:	6a 00                	push   $0x0
  pushl $208
  102954:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102959:	e9 e1 f6 ff ff       	jmp    10203f <__alltraps>

0010295e <vector209>:
.globl vector209
vector209:
  pushl $0
  10295e:	6a 00                	push   $0x0
  pushl $209
  102960:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102965:	e9 d5 f6 ff ff       	jmp    10203f <__alltraps>

0010296a <vector210>:
.globl vector210
vector210:
  pushl $0
  10296a:	6a 00                	push   $0x0
  pushl $210
  10296c:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102971:	e9 c9 f6 ff ff       	jmp    10203f <__alltraps>

00102976 <vector211>:
.globl vector211
vector211:
  pushl $0
  102976:	6a 00                	push   $0x0
  pushl $211
  102978:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  10297d:	e9 bd f6 ff ff       	jmp    10203f <__alltraps>

00102982 <vector212>:
.globl vector212
vector212:
  pushl $0
  102982:	6a 00                	push   $0x0
  pushl $212
  102984:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102989:	e9 b1 f6 ff ff       	jmp    10203f <__alltraps>

0010298e <vector213>:
.globl vector213
vector213:
  pushl $0
  10298e:	6a 00                	push   $0x0
  pushl $213
  102990:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102995:	e9 a5 f6 ff ff       	jmp    10203f <__alltraps>

0010299a <vector214>:
.globl vector214
vector214:
  pushl $0
  10299a:	6a 00                	push   $0x0
  pushl $214
  10299c:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1029a1:	e9 99 f6 ff ff       	jmp    10203f <__alltraps>

001029a6 <vector215>:
.globl vector215
vector215:
  pushl $0
  1029a6:	6a 00                	push   $0x0
  pushl $215
  1029a8:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1029ad:	e9 8d f6 ff ff       	jmp    10203f <__alltraps>

001029b2 <vector216>:
.globl vector216
vector216:
  pushl $0
  1029b2:	6a 00                	push   $0x0
  pushl $216
  1029b4:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1029b9:	e9 81 f6 ff ff       	jmp    10203f <__alltraps>

001029be <vector217>:
.globl vector217
vector217:
  pushl $0
  1029be:	6a 00                	push   $0x0
  pushl $217
  1029c0:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1029c5:	e9 75 f6 ff ff       	jmp    10203f <__alltraps>

001029ca <vector218>:
.globl vector218
vector218:
  pushl $0
  1029ca:	6a 00                	push   $0x0
  pushl $218
  1029cc:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1029d1:	e9 69 f6 ff ff       	jmp    10203f <__alltraps>

001029d6 <vector219>:
.globl vector219
vector219:
  pushl $0
  1029d6:	6a 00                	push   $0x0
  pushl $219
  1029d8:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1029dd:	e9 5d f6 ff ff       	jmp    10203f <__alltraps>

001029e2 <vector220>:
.globl vector220
vector220:
  pushl $0
  1029e2:	6a 00                	push   $0x0
  pushl $220
  1029e4:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1029e9:	e9 51 f6 ff ff       	jmp    10203f <__alltraps>

001029ee <vector221>:
.globl vector221
vector221:
  pushl $0
  1029ee:	6a 00                	push   $0x0
  pushl $221
  1029f0:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1029f5:	e9 45 f6 ff ff       	jmp    10203f <__alltraps>

001029fa <vector222>:
.globl vector222
vector222:
  pushl $0
  1029fa:	6a 00                	push   $0x0
  pushl $222
  1029fc:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102a01:	e9 39 f6 ff ff       	jmp    10203f <__alltraps>

00102a06 <vector223>:
.globl vector223
vector223:
  pushl $0
  102a06:	6a 00                	push   $0x0
  pushl $223
  102a08:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102a0d:	e9 2d f6 ff ff       	jmp    10203f <__alltraps>

00102a12 <vector224>:
.globl vector224
vector224:
  pushl $0
  102a12:	6a 00                	push   $0x0
  pushl $224
  102a14:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102a19:	e9 21 f6 ff ff       	jmp    10203f <__alltraps>

00102a1e <vector225>:
.globl vector225
vector225:
  pushl $0
  102a1e:	6a 00                	push   $0x0
  pushl $225
  102a20:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102a25:	e9 15 f6 ff ff       	jmp    10203f <__alltraps>

00102a2a <vector226>:
.globl vector226
vector226:
  pushl $0
  102a2a:	6a 00                	push   $0x0
  pushl $226
  102a2c:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102a31:	e9 09 f6 ff ff       	jmp    10203f <__alltraps>

00102a36 <vector227>:
.globl vector227
vector227:
  pushl $0
  102a36:	6a 00                	push   $0x0
  pushl $227
  102a38:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102a3d:	e9 fd f5 ff ff       	jmp    10203f <__alltraps>

00102a42 <vector228>:
.globl vector228
vector228:
  pushl $0
  102a42:	6a 00                	push   $0x0
  pushl $228
  102a44:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102a49:	e9 f1 f5 ff ff       	jmp    10203f <__alltraps>

00102a4e <vector229>:
.globl vector229
vector229:
  pushl $0
  102a4e:	6a 00                	push   $0x0
  pushl $229
  102a50:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102a55:	e9 e5 f5 ff ff       	jmp    10203f <__alltraps>

00102a5a <vector230>:
.globl vector230
vector230:
  pushl $0
  102a5a:	6a 00                	push   $0x0
  pushl $230
  102a5c:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102a61:	e9 d9 f5 ff ff       	jmp    10203f <__alltraps>

00102a66 <vector231>:
.globl vector231
vector231:
  pushl $0
  102a66:	6a 00                	push   $0x0
  pushl $231
  102a68:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102a6d:	e9 cd f5 ff ff       	jmp    10203f <__alltraps>

00102a72 <vector232>:
.globl vector232
vector232:
  pushl $0
  102a72:	6a 00                	push   $0x0
  pushl $232
  102a74:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102a79:	e9 c1 f5 ff ff       	jmp    10203f <__alltraps>

00102a7e <vector233>:
.globl vector233
vector233:
  pushl $0
  102a7e:	6a 00                	push   $0x0
  pushl $233
  102a80:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102a85:	e9 b5 f5 ff ff       	jmp    10203f <__alltraps>

00102a8a <vector234>:
.globl vector234
vector234:
  pushl $0
  102a8a:	6a 00                	push   $0x0
  pushl $234
  102a8c:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102a91:	e9 a9 f5 ff ff       	jmp    10203f <__alltraps>

00102a96 <vector235>:
.globl vector235
vector235:
  pushl $0
  102a96:	6a 00                	push   $0x0
  pushl $235
  102a98:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102a9d:	e9 9d f5 ff ff       	jmp    10203f <__alltraps>

00102aa2 <vector236>:
.globl vector236
vector236:
  pushl $0
  102aa2:	6a 00                	push   $0x0
  pushl $236
  102aa4:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102aa9:	e9 91 f5 ff ff       	jmp    10203f <__alltraps>

00102aae <vector237>:
.globl vector237
vector237:
  pushl $0
  102aae:	6a 00                	push   $0x0
  pushl $237
  102ab0:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102ab5:	e9 85 f5 ff ff       	jmp    10203f <__alltraps>

00102aba <vector238>:
.globl vector238
vector238:
  pushl $0
  102aba:	6a 00                	push   $0x0
  pushl $238
  102abc:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102ac1:	e9 79 f5 ff ff       	jmp    10203f <__alltraps>

00102ac6 <vector239>:
.globl vector239
vector239:
  pushl $0
  102ac6:	6a 00                	push   $0x0
  pushl $239
  102ac8:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102acd:	e9 6d f5 ff ff       	jmp    10203f <__alltraps>

00102ad2 <vector240>:
.globl vector240
vector240:
  pushl $0
  102ad2:	6a 00                	push   $0x0
  pushl $240
  102ad4:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102ad9:	e9 61 f5 ff ff       	jmp    10203f <__alltraps>

00102ade <vector241>:
.globl vector241
vector241:
  pushl $0
  102ade:	6a 00                	push   $0x0
  pushl $241
  102ae0:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102ae5:	e9 55 f5 ff ff       	jmp    10203f <__alltraps>

00102aea <vector242>:
.globl vector242
vector242:
  pushl $0
  102aea:	6a 00                	push   $0x0
  pushl $242
  102aec:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102af1:	e9 49 f5 ff ff       	jmp    10203f <__alltraps>

00102af6 <vector243>:
.globl vector243
vector243:
  pushl $0
  102af6:	6a 00                	push   $0x0
  pushl $243
  102af8:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102afd:	e9 3d f5 ff ff       	jmp    10203f <__alltraps>

00102b02 <vector244>:
.globl vector244
vector244:
  pushl $0
  102b02:	6a 00                	push   $0x0
  pushl $244
  102b04:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102b09:	e9 31 f5 ff ff       	jmp    10203f <__alltraps>

00102b0e <vector245>:
.globl vector245
vector245:
  pushl $0
  102b0e:	6a 00                	push   $0x0
  pushl $245
  102b10:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102b15:	e9 25 f5 ff ff       	jmp    10203f <__alltraps>

00102b1a <vector246>:
.globl vector246
vector246:
  pushl $0
  102b1a:	6a 00                	push   $0x0
  pushl $246
  102b1c:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102b21:	e9 19 f5 ff ff       	jmp    10203f <__alltraps>

00102b26 <vector247>:
.globl vector247
vector247:
  pushl $0
  102b26:	6a 00                	push   $0x0
  pushl $247
  102b28:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102b2d:	e9 0d f5 ff ff       	jmp    10203f <__alltraps>

00102b32 <vector248>:
.globl vector248
vector248:
  pushl $0
  102b32:	6a 00                	push   $0x0
  pushl $248
  102b34:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102b39:	e9 01 f5 ff ff       	jmp    10203f <__alltraps>

00102b3e <vector249>:
.globl vector249
vector249:
  pushl $0
  102b3e:	6a 00                	push   $0x0
  pushl $249
  102b40:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102b45:	e9 f5 f4 ff ff       	jmp    10203f <__alltraps>

00102b4a <vector250>:
.globl vector250
vector250:
  pushl $0
  102b4a:	6a 00                	push   $0x0
  pushl $250
  102b4c:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102b51:	e9 e9 f4 ff ff       	jmp    10203f <__alltraps>

00102b56 <vector251>:
.globl vector251
vector251:
  pushl $0
  102b56:	6a 00                	push   $0x0
  pushl $251
  102b58:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102b5d:	e9 dd f4 ff ff       	jmp    10203f <__alltraps>

00102b62 <vector252>:
.globl vector252
vector252:
  pushl $0
  102b62:	6a 00                	push   $0x0
  pushl $252
  102b64:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102b69:	e9 d1 f4 ff ff       	jmp    10203f <__alltraps>

00102b6e <vector253>:
.globl vector253
vector253:
  pushl $0
  102b6e:	6a 00                	push   $0x0
  pushl $253
  102b70:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102b75:	e9 c5 f4 ff ff       	jmp    10203f <__alltraps>

00102b7a <vector254>:
.globl vector254
vector254:
  pushl $0
  102b7a:	6a 00                	push   $0x0
  pushl $254
  102b7c:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102b81:	e9 b9 f4 ff ff       	jmp    10203f <__alltraps>

00102b86 <vector255>:
.globl vector255
vector255:
  pushl $0
  102b86:	6a 00                	push   $0x0
  pushl $255
  102b88:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102b8d:	e9 ad f4 ff ff       	jmp    10203f <__alltraps>

00102b92 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102b92:	55                   	push   %ebp
  102b93:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102b95:	8b 45 08             	mov    0x8(%ebp),%eax
  102b98:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102b9b:	b8 23 00 00 00       	mov    $0x23,%eax
  102ba0:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102ba2:	b8 23 00 00 00       	mov    $0x23,%eax
  102ba7:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102ba9:	b8 10 00 00 00       	mov    $0x10,%eax
  102bae:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102bb0:	b8 10 00 00 00       	mov    $0x10,%eax
  102bb5:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102bb7:	b8 10 00 00 00       	mov    $0x10,%eax
  102bbc:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102bbe:	ea c5 2b 10 00 08 00 	ljmp   $0x8,$0x102bc5
}
  102bc5:	90                   	nop
  102bc6:	5d                   	pop    %ebp
  102bc7:	c3                   	ret    

00102bc8 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102bc8:	55                   	push   %ebp
  102bc9:	89 e5                	mov    %esp,%ebp
  102bcb:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102bce:	b8 a0 19 11 00       	mov    $0x1119a0,%eax
  102bd3:	05 00 04 00 00       	add    $0x400,%eax
  102bd8:	a3 c4 18 11 00       	mov    %eax,0x1118c4
    ts.ts_ss0 = KERNEL_DS;
  102bdd:	66 c7 05 c8 18 11 00 	movw   $0x10,0x1118c8
  102be4:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102be6:	66 c7 05 08 0a 11 00 	movw   $0x68,0x110a08
  102bed:	68 00 
  102bef:	b8 c0 18 11 00       	mov    $0x1118c0,%eax
  102bf4:	0f b7 c0             	movzwl %ax,%eax
  102bf7:	66 a3 0a 0a 11 00    	mov    %ax,0x110a0a
  102bfd:	b8 c0 18 11 00       	mov    $0x1118c0,%eax
  102c02:	c1 e8 10             	shr    $0x10,%eax
  102c05:	a2 0c 0a 11 00       	mov    %al,0x110a0c
  102c0a:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102c11:	24 f0                	and    $0xf0,%al
  102c13:	0c 09                	or     $0x9,%al
  102c15:	a2 0d 0a 11 00       	mov    %al,0x110a0d
  102c1a:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102c21:	0c 10                	or     $0x10,%al
  102c23:	a2 0d 0a 11 00       	mov    %al,0x110a0d
  102c28:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102c2f:	24 9f                	and    $0x9f,%al
  102c31:	a2 0d 0a 11 00       	mov    %al,0x110a0d
  102c36:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102c3d:	0c 80                	or     $0x80,%al
  102c3f:	a2 0d 0a 11 00       	mov    %al,0x110a0d
  102c44:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102c4b:	24 f0                	and    $0xf0,%al
  102c4d:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102c52:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102c59:	24 ef                	and    $0xef,%al
  102c5b:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102c60:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102c67:	24 df                	and    $0xdf,%al
  102c69:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102c6e:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102c75:	0c 40                	or     $0x40,%al
  102c77:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102c7c:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102c83:	24 7f                	and    $0x7f,%al
  102c85:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102c8a:	b8 c0 18 11 00       	mov    $0x1118c0,%eax
  102c8f:	c1 e8 18             	shr    $0x18,%eax
  102c92:	a2 0f 0a 11 00       	mov    %al,0x110a0f
    gdt[SEG_TSS].sd_s = 0;
  102c97:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102c9e:	24 ef                	and    $0xef,%al
  102ca0:	a2 0d 0a 11 00       	mov    %al,0x110a0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102ca5:	c7 04 24 10 0a 11 00 	movl   $0x110a10,(%esp)
  102cac:	e8 e1 fe ff ff       	call   102b92 <lgdt>
  102cb1:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102cb7:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102cbb:	0f 00 d8             	ltr    %ax
}
  102cbe:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102cbf:	90                   	nop
  102cc0:	c9                   	leave  
  102cc1:	c3                   	ret    

00102cc2 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102cc2:	55                   	push   %ebp
  102cc3:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102cc5:	e8 fe fe ff ff       	call   102bc8 <gdt_init>
}
  102cca:	90                   	nop
  102ccb:	5d                   	pop    %ebp
  102ccc:	c3                   	ret    

00102ccd <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102ccd:	55                   	push   %ebp
  102cce:	89 e5                	mov    %esp,%ebp
  102cd0:	83 ec 58             	sub    $0x58,%esp
  102cd3:	8b 45 10             	mov    0x10(%ebp),%eax
  102cd6:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102cd9:	8b 45 14             	mov    0x14(%ebp),%eax
  102cdc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102cdf:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102ce2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102ce5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ce8:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102ceb:	8b 45 18             	mov    0x18(%ebp),%eax
  102cee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102cf1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102cf4:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102cf7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102cfa:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102cfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d00:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d03:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102d07:	74 1c                	je     102d25 <printnum+0x58>
  102d09:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d0c:	ba 00 00 00 00       	mov    $0x0,%edx
  102d11:	f7 75 e4             	divl   -0x1c(%ebp)
  102d14:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102d17:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d1a:	ba 00 00 00 00       	mov    $0x0,%edx
  102d1f:	f7 75 e4             	divl   -0x1c(%ebp)
  102d22:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d25:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d28:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d2b:	f7 75 e4             	divl   -0x1c(%ebp)
  102d2e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102d31:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102d34:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d37:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102d3a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102d3d:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102d40:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102d43:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102d46:	8b 45 18             	mov    0x18(%ebp),%eax
  102d49:	ba 00 00 00 00       	mov    $0x0,%edx
  102d4e:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102d51:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102d54:	19 d1                	sbb    %edx,%ecx
  102d56:	72 4c                	jb     102da4 <printnum+0xd7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102d58:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102d5b:	8d 50 ff             	lea    -0x1(%eax),%edx
  102d5e:	8b 45 20             	mov    0x20(%ebp),%eax
  102d61:	89 44 24 18          	mov    %eax,0x18(%esp)
  102d65:	89 54 24 14          	mov    %edx,0x14(%esp)
  102d69:	8b 45 18             	mov    0x18(%ebp),%eax
  102d6c:	89 44 24 10          	mov    %eax,0x10(%esp)
  102d70:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d73:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102d76:	89 44 24 08          	mov    %eax,0x8(%esp)
  102d7a:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102d7e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d81:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d85:	8b 45 08             	mov    0x8(%ebp),%eax
  102d88:	89 04 24             	mov    %eax,(%esp)
  102d8b:	e8 3d ff ff ff       	call   102ccd <printnum>
  102d90:	eb 1b                	jmp    102dad <printnum+0xe0>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102d92:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d95:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d99:	8b 45 20             	mov    0x20(%ebp),%eax
  102d9c:	89 04 24             	mov    %eax,(%esp)
  102d9f:	8b 45 08             	mov    0x8(%ebp),%eax
  102da2:	ff d0                	call   *%eax
        while (-- width > 0)
  102da4:	ff 4d 1c             	decl   0x1c(%ebp)
  102da7:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102dab:	7f e5                	jg     102d92 <printnum+0xc5>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102dad:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102db0:	05 90 3f 10 00       	add    $0x103f90,%eax
  102db5:	0f b6 00             	movzbl (%eax),%eax
  102db8:	0f be c0             	movsbl %al,%eax
  102dbb:	8b 55 0c             	mov    0xc(%ebp),%edx
  102dbe:	89 54 24 04          	mov    %edx,0x4(%esp)
  102dc2:	89 04 24             	mov    %eax,(%esp)
  102dc5:	8b 45 08             	mov    0x8(%ebp),%eax
  102dc8:	ff d0                	call   *%eax
}
  102dca:	90                   	nop
  102dcb:	c9                   	leave  
  102dcc:	c3                   	ret    

00102dcd <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102dcd:	55                   	push   %ebp
  102dce:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102dd0:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102dd4:	7e 14                	jle    102dea <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102dd6:	8b 45 08             	mov    0x8(%ebp),%eax
  102dd9:	8b 00                	mov    (%eax),%eax
  102ddb:	8d 48 08             	lea    0x8(%eax),%ecx
  102dde:	8b 55 08             	mov    0x8(%ebp),%edx
  102de1:	89 0a                	mov    %ecx,(%edx)
  102de3:	8b 50 04             	mov    0x4(%eax),%edx
  102de6:	8b 00                	mov    (%eax),%eax
  102de8:	eb 30                	jmp    102e1a <getuint+0x4d>
    }
    else if (lflag) {
  102dea:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102dee:	74 16                	je     102e06 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102df0:	8b 45 08             	mov    0x8(%ebp),%eax
  102df3:	8b 00                	mov    (%eax),%eax
  102df5:	8d 48 04             	lea    0x4(%eax),%ecx
  102df8:	8b 55 08             	mov    0x8(%ebp),%edx
  102dfb:	89 0a                	mov    %ecx,(%edx)
  102dfd:	8b 00                	mov    (%eax),%eax
  102dff:	ba 00 00 00 00       	mov    $0x0,%edx
  102e04:	eb 14                	jmp    102e1a <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102e06:	8b 45 08             	mov    0x8(%ebp),%eax
  102e09:	8b 00                	mov    (%eax),%eax
  102e0b:	8d 48 04             	lea    0x4(%eax),%ecx
  102e0e:	8b 55 08             	mov    0x8(%ebp),%edx
  102e11:	89 0a                	mov    %ecx,(%edx)
  102e13:	8b 00                	mov    (%eax),%eax
  102e15:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102e1a:	5d                   	pop    %ebp
  102e1b:	c3                   	ret    

00102e1c <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102e1c:	55                   	push   %ebp
  102e1d:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102e1f:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102e23:	7e 14                	jle    102e39 <getint+0x1d>
        return va_arg(*ap, long long);
  102e25:	8b 45 08             	mov    0x8(%ebp),%eax
  102e28:	8b 00                	mov    (%eax),%eax
  102e2a:	8d 48 08             	lea    0x8(%eax),%ecx
  102e2d:	8b 55 08             	mov    0x8(%ebp),%edx
  102e30:	89 0a                	mov    %ecx,(%edx)
  102e32:	8b 50 04             	mov    0x4(%eax),%edx
  102e35:	8b 00                	mov    (%eax),%eax
  102e37:	eb 28                	jmp    102e61 <getint+0x45>
    }
    else if (lflag) {
  102e39:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102e3d:	74 12                	je     102e51 <getint+0x35>
        return va_arg(*ap, long);
  102e3f:	8b 45 08             	mov    0x8(%ebp),%eax
  102e42:	8b 00                	mov    (%eax),%eax
  102e44:	8d 48 04             	lea    0x4(%eax),%ecx
  102e47:	8b 55 08             	mov    0x8(%ebp),%edx
  102e4a:	89 0a                	mov    %ecx,(%edx)
  102e4c:	8b 00                	mov    (%eax),%eax
  102e4e:	99                   	cltd   
  102e4f:	eb 10                	jmp    102e61 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102e51:	8b 45 08             	mov    0x8(%ebp),%eax
  102e54:	8b 00                	mov    (%eax),%eax
  102e56:	8d 48 04             	lea    0x4(%eax),%ecx
  102e59:	8b 55 08             	mov    0x8(%ebp),%edx
  102e5c:	89 0a                	mov    %ecx,(%edx)
  102e5e:	8b 00                	mov    (%eax),%eax
  102e60:	99                   	cltd   
    }
}
  102e61:	5d                   	pop    %ebp
  102e62:	c3                   	ret    

00102e63 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102e63:	55                   	push   %ebp
  102e64:	89 e5                	mov    %esp,%ebp
  102e66:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102e69:	8d 45 14             	lea    0x14(%ebp),%eax
  102e6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102e6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e72:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102e76:	8b 45 10             	mov    0x10(%ebp),%eax
  102e79:	89 44 24 08          	mov    %eax,0x8(%esp)
  102e7d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e80:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e84:	8b 45 08             	mov    0x8(%ebp),%eax
  102e87:	89 04 24             	mov    %eax,(%esp)
  102e8a:	e8 03 00 00 00       	call   102e92 <vprintfmt>
    va_end(ap);
}
  102e8f:	90                   	nop
  102e90:	c9                   	leave  
  102e91:	c3                   	ret    

00102e92 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102e92:	55                   	push   %ebp
  102e93:	89 e5                	mov    %esp,%ebp
  102e95:	56                   	push   %esi
  102e96:	53                   	push   %ebx
  102e97:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102e9a:	eb 17                	jmp    102eb3 <vprintfmt+0x21>
            if (ch == '\0') {
  102e9c:	85 db                	test   %ebx,%ebx
  102e9e:	0f 84 bf 03 00 00    	je     103263 <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  102ea4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ea7:	89 44 24 04          	mov    %eax,0x4(%esp)
  102eab:	89 1c 24             	mov    %ebx,(%esp)
  102eae:	8b 45 08             	mov    0x8(%ebp),%eax
  102eb1:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102eb3:	8b 45 10             	mov    0x10(%ebp),%eax
  102eb6:	8d 50 01             	lea    0x1(%eax),%edx
  102eb9:	89 55 10             	mov    %edx,0x10(%ebp)
  102ebc:	0f b6 00             	movzbl (%eax),%eax
  102ebf:	0f b6 d8             	movzbl %al,%ebx
  102ec2:	83 fb 25             	cmp    $0x25,%ebx
  102ec5:	75 d5                	jne    102e9c <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  102ec7:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102ecb:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102ed2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ed5:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102ed8:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102edf:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102ee2:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102ee5:	8b 45 10             	mov    0x10(%ebp),%eax
  102ee8:	8d 50 01             	lea    0x1(%eax),%edx
  102eeb:	89 55 10             	mov    %edx,0x10(%ebp)
  102eee:	0f b6 00             	movzbl (%eax),%eax
  102ef1:	0f b6 d8             	movzbl %al,%ebx
  102ef4:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102ef7:	83 f8 55             	cmp    $0x55,%eax
  102efa:	0f 87 37 03 00 00    	ja     103237 <vprintfmt+0x3a5>
  102f00:	8b 04 85 b4 3f 10 00 	mov    0x103fb4(,%eax,4),%eax
  102f07:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102f09:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102f0d:	eb d6                	jmp    102ee5 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102f0f:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102f13:	eb d0                	jmp    102ee5 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102f15:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102f1c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102f1f:	89 d0                	mov    %edx,%eax
  102f21:	c1 e0 02             	shl    $0x2,%eax
  102f24:	01 d0                	add    %edx,%eax
  102f26:	01 c0                	add    %eax,%eax
  102f28:	01 d8                	add    %ebx,%eax
  102f2a:	83 e8 30             	sub    $0x30,%eax
  102f2d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102f30:	8b 45 10             	mov    0x10(%ebp),%eax
  102f33:	0f b6 00             	movzbl (%eax),%eax
  102f36:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102f39:	83 fb 2f             	cmp    $0x2f,%ebx
  102f3c:	7e 38                	jle    102f76 <vprintfmt+0xe4>
  102f3e:	83 fb 39             	cmp    $0x39,%ebx
  102f41:	7f 33                	jg     102f76 <vprintfmt+0xe4>
            for (precision = 0; ; ++ fmt) {
  102f43:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  102f46:	eb d4                	jmp    102f1c <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102f48:	8b 45 14             	mov    0x14(%ebp),%eax
  102f4b:	8d 50 04             	lea    0x4(%eax),%edx
  102f4e:	89 55 14             	mov    %edx,0x14(%ebp)
  102f51:	8b 00                	mov    (%eax),%eax
  102f53:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102f56:	eb 1f                	jmp    102f77 <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  102f58:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102f5c:	79 87                	jns    102ee5 <vprintfmt+0x53>
                width = 0;
  102f5e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102f65:	e9 7b ff ff ff       	jmp    102ee5 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102f6a:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102f71:	e9 6f ff ff ff       	jmp    102ee5 <vprintfmt+0x53>
            goto process_precision;
  102f76:	90                   	nop

        process_precision:
            if (width < 0)
  102f77:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102f7b:	0f 89 64 ff ff ff    	jns    102ee5 <vprintfmt+0x53>
                width = precision, precision = -1;
  102f81:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102f84:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f87:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102f8e:	e9 52 ff ff ff       	jmp    102ee5 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102f93:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  102f96:	e9 4a ff ff ff       	jmp    102ee5 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102f9b:	8b 45 14             	mov    0x14(%ebp),%eax
  102f9e:	8d 50 04             	lea    0x4(%eax),%edx
  102fa1:	89 55 14             	mov    %edx,0x14(%ebp)
  102fa4:	8b 00                	mov    (%eax),%eax
  102fa6:	8b 55 0c             	mov    0xc(%ebp),%edx
  102fa9:	89 54 24 04          	mov    %edx,0x4(%esp)
  102fad:	89 04 24             	mov    %eax,(%esp)
  102fb0:	8b 45 08             	mov    0x8(%ebp),%eax
  102fb3:	ff d0                	call   *%eax
            break;
  102fb5:	e9 a4 02 00 00       	jmp    10325e <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102fba:	8b 45 14             	mov    0x14(%ebp),%eax
  102fbd:	8d 50 04             	lea    0x4(%eax),%edx
  102fc0:	89 55 14             	mov    %edx,0x14(%ebp)
  102fc3:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102fc5:	85 db                	test   %ebx,%ebx
  102fc7:	79 02                	jns    102fcb <vprintfmt+0x139>
                err = -err;
  102fc9:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102fcb:	83 fb 06             	cmp    $0x6,%ebx
  102fce:	7f 0b                	jg     102fdb <vprintfmt+0x149>
  102fd0:	8b 34 9d 74 3f 10 00 	mov    0x103f74(,%ebx,4),%esi
  102fd7:	85 f6                	test   %esi,%esi
  102fd9:	75 23                	jne    102ffe <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  102fdb:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102fdf:	c7 44 24 08 a1 3f 10 	movl   $0x103fa1,0x8(%esp)
  102fe6:	00 
  102fe7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fea:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fee:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff1:	89 04 24             	mov    %eax,(%esp)
  102ff4:	e8 6a fe ff ff       	call   102e63 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102ff9:	e9 60 02 00 00       	jmp    10325e <vprintfmt+0x3cc>
                printfmt(putch, putdat, "%s", p);
  102ffe:	89 74 24 0c          	mov    %esi,0xc(%esp)
  103002:	c7 44 24 08 aa 3f 10 	movl   $0x103faa,0x8(%esp)
  103009:	00 
  10300a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10300d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103011:	8b 45 08             	mov    0x8(%ebp),%eax
  103014:	89 04 24             	mov    %eax,(%esp)
  103017:	e8 47 fe ff ff       	call   102e63 <printfmt>
            break;
  10301c:	e9 3d 02 00 00       	jmp    10325e <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103021:	8b 45 14             	mov    0x14(%ebp),%eax
  103024:	8d 50 04             	lea    0x4(%eax),%edx
  103027:	89 55 14             	mov    %edx,0x14(%ebp)
  10302a:	8b 30                	mov    (%eax),%esi
  10302c:	85 f6                	test   %esi,%esi
  10302e:	75 05                	jne    103035 <vprintfmt+0x1a3>
                p = "(null)";
  103030:	be ad 3f 10 00       	mov    $0x103fad,%esi
            }
            if (width > 0 && padc != '-') {
  103035:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103039:	7e 76                	jle    1030b1 <vprintfmt+0x21f>
  10303b:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  10303f:	74 70                	je     1030b1 <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103041:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103044:	89 44 24 04          	mov    %eax,0x4(%esp)
  103048:	89 34 24             	mov    %esi,(%esp)
  10304b:	e8 10 03 00 00       	call   103360 <strnlen>
  103050:	8b 55 e8             	mov    -0x18(%ebp),%edx
  103053:	29 c2                	sub    %eax,%edx
  103055:	89 d0                	mov    %edx,%eax
  103057:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10305a:	eb 16                	jmp    103072 <vprintfmt+0x1e0>
                    putch(padc, putdat);
  10305c:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  103060:	8b 55 0c             	mov    0xc(%ebp),%edx
  103063:	89 54 24 04          	mov    %edx,0x4(%esp)
  103067:	89 04 24             	mov    %eax,(%esp)
  10306a:	8b 45 08             	mov    0x8(%ebp),%eax
  10306d:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  10306f:	ff 4d e8             	decl   -0x18(%ebp)
  103072:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103076:	7f e4                	jg     10305c <vprintfmt+0x1ca>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103078:	eb 37                	jmp    1030b1 <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  10307a:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  10307e:	74 1f                	je     10309f <vprintfmt+0x20d>
  103080:	83 fb 1f             	cmp    $0x1f,%ebx
  103083:	7e 05                	jle    10308a <vprintfmt+0x1f8>
  103085:	83 fb 7e             	cmp    $0x7e,%ebx
  103088:	7e 15                	jle    10309f <vprintfmt+0x20d>
                    putch('?', putdat);
  10308a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10308d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103091:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  103098:	8b 45 08             	mov    0x8(%ebp),%eax
  10309b:	ff d0                	call   *%eax
  10309d:	eb 0f                	jmp    1030ae <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  10309f:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030a2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030a6:	89 1c 24             	mov    %ebx,(%esp)
  1030a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ac:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1030ae:	ff 4d e8             	decl   -0x18(%ebp)
  1030b1:	89 f0                	mov    %esi,%eax
  1030b3:	8d 70 01             	lea    0x1(%eax),%esi
  1030b6:	0f b6 00             	movzbl (%eax),%eax
  1030b9:	0f be d8             	movsbl %al,%ebx
  1030bc:	85 db                	test   %ebx,%ebx
  1030be:	74 27                	je     1030e7 <vprintfmt+0x255>
  1030c0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1030c4:	78 b4                	js     10307a <vprintfmt+0x1e8>
  1030c6:	ff 4d e4             	decl   -0x1c(%ebp)
  1030c9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1030cd:	79 ab                	jns    10307a <vprintfmt+0x1e8>
                }
            }
            for (; width > 0; width --) {
  1030cf:	eb 16                	jmp    1030e7 <vprintfmt+0x255>
                putch(' ', putdat);
  1030d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030d4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1030df:	8b 45 08             	mov    0x8(%ebp),%eax
  1030e2:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  1030e4:	ff 4d e8             	decl   -0x18(%ebp)
  1030e7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1030eb:	7f e4                	jg     1030d1 <vprintfmt+0x23f>
            }
            break;
  1030ed:	e9 6c 01 00 00       	jmp    10325e <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  1030f2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1030f5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030f9:	8d 45 14             	lea    0x14(%ebp),%eax
  1030fc:	89 04 24             	mov    %eax,(%esp)
  1030ff:	e8 18 fd ff ff       	call   102e1c <getint>
  103104:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103107:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  10310a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10310d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103110:	85 d2                	test   %edx,%edx
  103112:	79 26                	jns    10313a <vprintfmt+0x2a8>
                putch('-', putdat);
  103114:	8b 45 0c             	mov    0xc(%ebp),%eax
  103117:	89 44 24 04          	mov    %eax,0x4(%esp)
  10311b:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  103122:	8b 45 08             	mov    0x8(%ebp),%eax
  103125:	ff d0                	call   *%eax
                num = -(long long)num;
  103127:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10312a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10312d:	f7 d8                	neg    %eax
  10312f:	83 d2 00             	adc    $0x0,%edx
  103132:	f7 da                	neg    %edx
  103134:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103137:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  10313a:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103141:	e9 a8 00 00 00       	jmp    1031ee <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  103146:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103149:	89 44 24 04          	mov    %eax,0x4(%esp)
  10314d:	8d 45 14             	lea    0x14(%ebp),%eax
  103150:	89 04 24             	mov    %eax,(%esp)
  103153:	e8 75 fc ff ff       	call   102dcd <getuint>
  103158:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10315b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  10315e:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103165:	e9 84 00 00 00       	jmp    1031ee <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  10316a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10316d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103171:	8d 45 14             	lea    0x14(%ebp),%eax
  103174:	89 04 24             	mov    %eax,(%esp)
  103177:	e8 51 fc ff ff       	call   102dcd <getuint>
  10317c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10317f:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103182:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  103189:	eb 63                	jmp    1031ee <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  10318b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10318e:	89 44 24 04          	mov    %eax,0x4(%esp)
  103192:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  103199:	8b 45 08             	mov    0x8(%ebp),%eax
  10319c:	ff d0                	call   *%eax
            putch('x', putdat);
  10319e:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031a1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031a5:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  1031ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1031af:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  1031b1:	8b 45 14             	mov    0x14(%ebp),%eax
  1031b4:	8d 50 04             	lea    0x4(%eax),%edx
  1031b7:	89 55 14             	mov    %edx,0x14(%ebp)
  1031ba:	8b 00                	mov    (%eax),%eax
  1031bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031bf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  1031c6:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  1031cd:	eb 1f                	jmp    1031ee <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  1031cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1031d2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031d6:	8d 45 14             	lea    0x14(%ebp),%eax
  1031d9:	89 04 24             	mov    %eax,(%esp)
  1031dc:	e8 ec fb ff ff       	call   102dcd <getuint>
  1031e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031e4:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  1031e7:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  1031ee:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  1031f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031f5:	89 54 24 18          	mov    %edx,0x18(%esp)
  1031f9:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1031fc:	89 54 24 14          	mov    %edx,0x14(%esp)
  103200:	89 44 24 10          	mov    %eax,0x10(%esp)
  103204:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103207:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10320a:	89 44 24 08          	mov    %eax,0x8(%esp)
  10320e:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103212:	8b 45 0c             	mov    0xc(%ebp),%eax
  103215:	89 44 24 04          	mov    %eax,0x4(%esp)
  103219:	8b 45 08             	mov    0x8(%ebp),%eax
  10321c:	89 04 24             	mov    %eax,(%esp)
  10321f:	e8 a9 fa ff ff       	call   102ccd <printnum>
            break;
  103224:	eb 38                	jmp    10325e <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103226:	8b 45 0c             	mov    0xc(%ebp),%eax
  103229:	89 44 24 04          	mov    %eax,0x4(%esp)
  10322d:	89 1c 24             	mov    %ebx,(%esp)
  103230:	8b 45 08             	mov    0x8(%ebp),%eax
  103233:	ff d0                	call   *%eax
            break;
  103235:	eb 27                	jmp    10325e <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  103237:	8b 45 0c             	mov    0xc(%ebp),%eax
  10323a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10323e:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  103245:	8b 45 08             	mov    0x8(%ebp),%eax
  103248:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  10324a:	ff 4d 10             	decl   0x10(%ebp)
  10324d:	eb 03                	jmp    103252 <vprintfmt+0x3c0>
  10324f:	ff 4d 10             	decl   0x10(%ebp)
  103252:	8b 45 10             	mov    0x10(%ebp),%eax
  103255:	48                   	dec    %eax
  103256:	0f b6 00             	movzbl (%eax),%eax
  103259:	3c 25                	cmp    $0x25,%al
  10325b:	75 f2                	jne    10324f <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  10325d:	90                   	nop
    while (1) {
  10325e:	e9 37 fc ff ff       	jmp    102e9a <vprintfmt+0x8>
                return;
  103263:	90                   	nop
        }
    }
}
  103264:	83 c4 40             	add    $0x40,%esp
  103267:	5b                   	pop    %ebx
  103268:	5e                   	pop    %esi
  103269:	5d                   	pop    %ebp
  10326a:	c3                   	ret    

0010326b <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  10326b:	55                   	push   %ebp
  10326c:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  10326e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103271:	8b 40 08             	mov    0x8(%eax),%eax
  103274:	8d 50 01             	lea    0x1(%eax),%edx
  103277:	8b 45 0c             	mov    0xc(%ebp),%eax
  10327a:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  10327d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103280:	8b 10                	mov    (%eax),%edx
  103282:	8b 45 0c             	mov    0xc(%ebp),%eax
  103285:	8b 40 04             	mov    0x4(%eax),%eax
  103288:	39 c2                	cmp    %eax,%edx
  10328a:	73 12                	jae    10329e <sprintputch+0x33>
        *b->buf ++ = ch;
  10328c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10328f:	8b 00                	mov    (%eax),%eax
  103291:	8d 48 01             	lea    0x1(%eax),%ecx
  103294:	8b 55 0c             	mov    0xc(%ebp),%edx
  103297:	89 0a                	mov    %ecx,(%edx)
  103299:	8b 55 08             	mov    0x8(%ebp),%edx
  10329c:	88 10                	mov    %dl,(%eax)
    }
}
  10329e:	90                   	nop
  10329f:	5d                   	pop    %ebp
  1032a0:	c3                   	ret    

001032a1 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1032a1:	55                   	push   %ebp
  1032a2:	89 e5                	mov    %esp,%ebp
  1032a4:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1032a7:	8d 45 14             	lea    0x14(%ebp),%eax
  1032aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1032ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032b0:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1032b4:	8b 45 10             	mov    0x10(%ebp),%eax
  1032b7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1032bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032be:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1032c5:	89 04 24             	mov    %eax,(%esp)
  1032c8:	e8 08 00 00 00       	call   1032d5 <vsnprintf>
  1032cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1032d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1032d3:	c9                   	leave  
  1032d4:	c3                   	ret    

001032d5 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  1032d5:	55                   	push   %ebp
  1032d6:	89 e5                	mov    %esp,%ebp
  1032d8:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  1032db:	8b 45 08             	mov    0x8(%ebp),%eax
  1032de:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1032e1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032e4:	8d 50 ff             	lea    -0x1(%eax),%edx
  1032e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ea:	01 d0                	add    %edx,%eax
  1032ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032ef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1032f6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1032fa:	74 0a                	je     103306 <vsnprintf+0x31>
  1032fc:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1032ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103302:	39 c2                	cmp    %eax,%edx
  103304:	76 07                	jbe    10330d <vsnprintf+0x38>
        return -E_INVAL;
  103306:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  10330b:	eb 2a                	jmp    103337 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  10330d:	8b 45 14             	mov    0x14(%ebp),%eax
  103310:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103314:	8b 45 10             	mov    0x10(%ebp),%eax
  103317:	89 44 24 08          	mov    %eax,0x8(%esp)
  10331b:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10331e:	89 44 24 04          	mov    %eax,0x4(%esp)
  103322:	c7 04 24 6b 32 10 00 	movl   $0x10326b,(%esp)
  103329:	e8 64 fb ff ff       	call   102e92 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  10332e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103331:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103334:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103337:	c9                   	leave  
  103338:	c3                   	ret    

00103339 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  103339:	55                   	push   %ebp
  10333a:	89 e5                	mov    %esp,%ebp
  10333c:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  10333f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  103346:	eb 03                	jmp    10334b <strlen+0x12>
        cnt ++;
  103348:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  10334b:	8b 45 08             	mov    0x8(%ebp),%eax
  10334e:	8d 50 01             	lea    0x1(%eax),%edx
  103351:	89 55 08             	mov    %edx,0x8(%ebp)
  103354:	0f b6 00             	movzbl (%eax),%eax
  103357:	84 c0                	test   %al,%al
  103359:	75 ed                	jne    103348 <strlen+0xf>
    }
    return cnt;
  10335b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10335e:	c9                   	leave  
  10335f:	c3                   	ret    

00103360 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  103360:	55                   	push   %ebp
  103361:	89 e5                	mov    %esp,%ebp
  103363:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  103366:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  10336d:	eb 03                	jmp    103372 <strnlen+0x12>
        cnt ++;
  10336f:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  103372:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103375:	3b 45 0c             	cmp    0xc(%ebp),%eax
  103378:	73 10                	jae    10338a <strnlen+0x2a>
  10337a:	8b 45 08             	mov    0x8(%ebp),%eax
  10337d:	8d 50 01             	lea    0x1(%eax),%edx
  103380:	89 55 08             	mov    %edx,0x8(%ebp)
  103383:	0f b6 00             	movzbl (%eax),%eax
  103386:	84 c0                	test   %al,%al
  103388:	75 e5                	jne    10336f <strnlen+0xf>
    }
    return cnt;
  10338a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10338d:	c9                   	leave  
  10338e:	c3                   	ret    

0010338f <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  10338f:	55                   	push   %ebp
  103390:	89 e5                	mov    %esp,%ebp
  103392:	57                   	push   %edi
  103393:	56                   	push   %esi
  103394:	83 ec 20             	sub    $0x20,%esp
  103397:	8b 45 08             	mov    0x8(%ebp),%eax
  10339a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10339d:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  1033a3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1033a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1033a9:	89 d1                	mov    %edx,%ecx
  1033ab:	89 c2                	mov    %eax,%edx
  1033ad:	89 ce                	mov    %ecx,%esi
  1033af:	89 d7                	mov    %edx,%edi
  1033b1:	ac                   	lods   %ds:(%esi),%al
  1033b2:	aa                   	stos   %al,%es:(%edi)
  1033b3:	84 c0                	test   %al,%al
  1033b5:	75 fa                	jne    1033b1 <strcpy+0x22>
  1033b7:	89 fa                	mov    %edi,%edx
  1033b9:	89 f1                	mov    %esi,%ecx
  1033bb:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  1033be:	89 55 e8             	mov    %edx,-0x18(%ebp)
  1033c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  1033c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  1033c7:	83 c4 20             	add    $0x20,%esp
  1033ca:	5e                   	pop    %esi
  1033cb:	5f                   	pop    %edi
  1033cc:	5d                   	pop    %ebp
  1033cd:	c3                   	ret    

001033ce <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  1033ce:	55                   	push   %ebp
  1033cf:	89 e5                	mov    %esp,%ebp
  1033d1:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  1033d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1033d7:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  1033da:	eb 1e                	jmp    1033fa <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  1033dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033df:	0f b6 10             	movzbl (%eax),%edx
  1033e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1033e5:	88 10                	mov    %dl,(%eax)
  1033e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1033ea:	0f b6 00             	movzbl (%eax),%eax
  1033ed:	84 c0                	test   %al,%al
  1033ef:	74 03                	je     1033f4 <strncpy+0x26>
            src ++;
  1033f1:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  1033f4:	ff 45 fc             	incl   -0x4(%ebp)
  1033f7:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  1033fa:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1033fe:	75 dc                	jne    1033dc <strncpy+0xe>
    }
    return dst;
  103400:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103403:	c9                   	leave  
  103404:	c3                   	ret    

00103405 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  103405:	55                   	push   %ebp
  103406:	89 e5                	mov    %esp,%ebp
  103408:	57                   	push   %edi
  103409:	56                   	push   %esi
  10340a:	83 ec 20             	sub    $0x20,%esp
  10340d:	8b 45 08             	mov    0x8(%ebp),%eax
  103410:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103413:	8b 45 0c             	mov    0xc(%ebp),%eax
  103416:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  103419:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10341c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10341f:	89 d1                	mov    %edx,%ecx
  103421:	89 c2                	mov    %eax,%edx
  103423:	89 ce                	mov    %ecx,%esi
  103425:	89 d7                	mov    %edx,%edi
  103427:	ac                   	lods   %ds:(%esi),%al
  103428:	ae                   	scas   %es:(%edi),%al
  103429:	75 08                	jne    103433 <strcmp+0x2e>
  10342b:	84 c0                	test   %al,%al
  10342d:	75 f8                	jne    103427 <strcmp+0x22>
  10342f:	31 c0                	xor    %eax,%eax
  103431:	eb 04                	jmp    103437 <strcmp+0x32>
  103433:	19 c0                	sbb    %eax,%eax
  103435:	0c 01                	or     $0x1,%al
  103437:	89 fa                	mov    %edi,%edx
  103439:	89 f1                	mov    %esi,%ecx
  10343b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10343e:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103441:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  103444:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  103447:	83 c4 20             	add    $0x20,%esp
  10344a:	5e                   	pop    %esi
  10344b:	5f                   	pop    %edi
  10344c:	5d                   	pop    %ebp
  10344d:	c3                   	ret    

0010344e <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  10344e:	55                   	push   %ebp
  10344f:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103451:	eb 09                	jmp    10345c <strncmp+0xe>
        n --, s1 ++, s2 ++;
  103453:	ff 4d 10             	decl   0x10(%ebp)
  103456:	ff 45 08             	incl   0x8(%ebp)
  103459:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  10345c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103460:	74 1a                	je     10347c <strncmp+0x2e>
  103462:	8b 45 08             	mov    0x8(%ebp),%eax
  103465:	0f b6 00             	movzbl (%eax),%eax
  103468:	84 c0                	test   %al,%al
  10346a:	74 10                	je     10347c <strncmp+0x2e>
  10346c:	8b 45 08             	mov    0x8(%ebp),%eax
  10346f:	0f b6 10             	movzbl (%eax),%edx
  103472:	8b 45 0c             	mov    0xc(%ebp),%eax
  103475:	0f b6 00             	movzbl (%eax),%eax
  103478:	38 c2                	cmp    %al,%dl
  10347a:	74 d7                	je     103453 <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  10347c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103480:	74 18                	je     10349a <strncmp+0x4c>
  103482:	8b 45 08             	mov    0x8(%ebp),%eax
  103485:	0f b6 00             	movzbl (%eax),%eax
  103488:	0f b6 d0             	movzbl %al,%edx
  10348b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10348e:	0f b6 00             	movzbl (%eax),%eax
  103491:	0f b6 c0             	movzbl %al,%eax
  103494:	29 c2                	sub    %eax,%edx
  103496:	89 d0                	mov    %edx,%eax
  103498:	eb 05                	jmp    10349f <strncmp+0x51>
  10349a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10349f:	5d                   	pop    %ebp
  1034a0:	c3                   	ret    

001034a1 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  1034a1:	55                   	push   %ebp
  1034a2:	89 e5                	mov    %esp,%ebp
  1034a4:	83 ec 04             	sub    $0x4,%esp
  1034a7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034aa:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1034ad:	eb 13                	jmp    1034c2 <strchr+0x21>
        if (*s == c) {
  1034af:	8b 45 08             	mov    0x8(%ebp),%eax
  1034b2:	0f b6 00             	movzbl (%eax),%eax
  1034b5:	38 45 fc             	cmp    %al,-0x4(%ebp)
  1034b8:	75 05                	jne    1034bf <strchr+0x1e>
            return (char *)s;
  1034ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1034bd:	eb 12                	jmp    1034d1 <strchr+0x30>
        }
        s ++;
  1034bf:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  1034c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1034c5:	0f b6 00             	movzbl (%eax),%eax
  1034c8:	84 c0                	test   %al,%al
  1034ca:	75 e3                	jne    1034af <strchr+0xe>
    }
    return NULL;
  1034cc:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1034d1:	c9                   	leave  
  1034d2:	c3                   	ret    

001034d3 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  1034d3:	55                   	push   %ebp
  1034d4:	89 e5                	mov    %esp,%ebp
  1034d6:	83 ec 04             	sub    $0x4,%esp
  1034d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034dc:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1034df:	eb 0e                	jmp    1034ef <strfind+0x1c>
        if (*s == c) {
  1034e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1034e4:	0f b6 00             	movzbl (%eax),%eax
  1034e7:	38 45 fc             	cmp    %al,-0x4(%ebp)
  1034ea:	74 0f                	je     1034fb <strfind+0x28>
            break;
        }
        s ++;
  1034ec:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  1034ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1034f2:	0f b6 00             	movzbl (%eax),%eax
  1034f5:	84 c0                	test   %al,%al
  1034f7:	75 e8                	jne    1034e1 <strfind+0xe>
  1034f9:	eb 01                	jmp    1034fc <strfind+0x29>
            break;
  1034fb:	90                   	nop
    }
    return (char *)s;
  1034fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1034ff:	c9                   	leave  
  103500:	c3                   	ret    

00103501 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  103501:	55                   	push   %ebp
  103502:	89 e5                	mov    %esp,%ebp
  103504:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  103507:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  10350e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103515:	eb 03                	jmp    10351a <strtol+0x19>
        s ++;
  103517:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  10351a:	8b 45 08             	mov    0x8(%ebp),%eax
  10351d:	0f b6 00             	movzbl (%eax),%eax
  103520:	3c 20                	cmp    $0x20,%al
  103522:	74 f3                	je     103517 <strtol+0x16>
  103524:	8b 45 08             	mov    0x8(%ebp),%eax
  103527:	0f b6 00             	movzbl (%eax),%eax
  10352a:	3c 09                	cmp    $0x9,%al
  10352c:	74 e9                	je     103517 <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  10352e:	8b 45 08             	mov    0x8(%ebp),%eax
  103531:	0f b6 00             	movzbl (%eax),%eax
  103534:	3c 2b                	cmp    $0x2b,%al
  103536:	75 05                	jne    10353d <strtol+0x3c>
        s ++;
  103538:	ff 45 08             	incl   0x8(%ebp)
  10353b:	eb 14                	jmp    103551 <strtol+0x50>
    }
    else if (*s == '-') {
  10353d:	8b 45 08             	mov    0x8(%ebp),%eax
  103540:	0f b6 00             	movzbl (%eax),%eax
  103543:	3c 2d                	cmp    $0x2d,%al
  103545:	75 0a                	jne    103551 <strtol+0x50>
        s ++, neg = 1;
  103547:	ff 45 08             	incl   0x8(%ebp)
  10354a:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  103551:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103555:	74 06                	je     10355d <strtol+0x5c>
  103557:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  10355b:	75 22                	jne    10357f <strtol+0x7e>
  10355d:	8b 45 08             	mov    0x8(%ebp),%eax
  103560:	0f b6 00             	movzbl (%eax),%eax
  103563:	3c 30                	cmp    $0x30,%al
  103565:	75 18                	jne    10357f <strtol+0x7e>
  103567:	8b 45 08             	mov    0x8(%ebp),%eax
  10356a:	40                   	inc    %eax
  10356b:	0f b6 00             	movzbl (%eax),%eax
  10356e:	3c 78                	cmp    $0x78,%al
  103570:	75 0d                	jne    10357f <strtol+0x7e>
        s += 2, base = 16;
  103572:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103576:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  10357d:	eb 29                	jmp    1035a8 <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  10357f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103583:	75 16                	jne    10359b <strtol+0x9a>
  103585:	8b 45 08             	mov    0x8(%ebp),%eax
  103588:	0f b6 00             	movzbl (%eax),%eax
  10358b:	3c 30                	cmp    $0x30,%al
  10358d:	75 0c                	jne    10359b <strtol+0x9a>
        s ++, base = 8;
  10358f:	ff 45 08             	incl   0x8(%ebp)
  103592:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  103599:	eb 0d                	jmp    1035a8 <strtol+0xa7>
    }
    else if (base == 0) {
  10359b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10359f:	75 07                	jne    1035a8 <strtol+0xa7>
        base = 10;
  1035a1:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  1035a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1035ab:	0f b6 00             	movzbl (%eax),%eax
  1035ae:	3c 2f                	cmp    $0x2f,%al
  1035b0:	7e 1b                	jle    1035cd <strtol+0xcc>
  1035b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1035b5:	0f b6 00             	movzbl (%eax),%eax
  1035b8:	3c 39                	cmp    $0x39,%al
  1035ba:	7f 11                	jg     1035cd <strtol+0xcc>
            dig = *s - '0';
  1035bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1035bf:	0f b6 00             	movzbl (%eax),%eax
  1035c2:	0f be c0             	movsbl %al,%eax
  1035c5:	83 e8 30             	sub    $0x30,%eax
  1035c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1035cb:	eb 48                	jmp    103615 <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1035cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1035d0:	0f b6 00             	movzbl (%eax),%eax
  1035d3:	3c 60                	cmp    $0x60,%al
  1035d5:	7e 1b                	jle    1035f2 <strtol+0xf1>
  1035d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1035da:	0f b6 00             	movzbl (%eax),%eax
  1035dd:	3c 7a                	cmp    $0x7a,%al
  1035df:	7f 11                	jg     1035f2 <strtol+0xf1>
            dig = *s - 'a' + 10;
  1035e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1035e4:	0f b6 00             	movzbl (%eax),%eax
  1035e7:	0f be c0             	movsbl %al,%eax
  1035ea:	83 e8 57             	sub    $0x57,%eax
  1035ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1035f0:	eb 23                	jmp    103615 <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  1035f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1035f5:	0f b6 00             	movzbl (%eax),%eax
  1035f8:	3c 40                	cmp    $0x40,%al
  1035fa:	7e 3b                	jle    103637 <strtol+0x136>
  1035fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1035ff:	0f b6 00             	movzbl (%eax),%eax
  103602:	3c 5a                	cmp    $0x5a,%al
  103604:	7f 31                	jg     103637 <strtol+0x136>
            dig = *s - 'A' + 10;
  103606:	8b 45 08             	mov    0x8(%ebp),%eax
  103609:	0f b6 00             	movzbl (%eax),%eax
  10360c:	0f be c0             	movsbl %al,%eax
  10360f:	83 e8 37             	sub    $0x37,%eax
  103612:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103615:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103618:	3b 45 10             	cmp    0x10(%ebp),%eax
  10361b:	7d 19                	jge    103636 <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  10361d:	ff 45 08             	incl   0x8(%ebp)
  103620:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103623:	0f af 45 10          	imul   0x10(%ebp),%eax
  103627:	89 c2                	mov    %eax,%edx
  103629:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10362c:	01 d0                	add    %edx,%eax
  10362e:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  103631:	e9 72 ff ff ff       	jmp    1035a8 <strtol+0xa7>
            break;
  103636:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  103637:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10363b:	74 08                	je     103645 <strtol+0x144>
        *endptr = (char *) s;
  10363d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103640:	8b 55 08             	mov    0x8(%ebp),%edx
  103643:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103645:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  103649:	74 07                	je     103652 <strtol+0x151>
  10364b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10364e:	f7 d8                	neg    %eax
  103650:	eb 03                	jmp    103655 <strtol+0x154>
  103652:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103655:	c9                   	leave  
  103656:	c3                   	ret    

00103657 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103657:	55                   	push   %ebp
  103658:	89 e5                	mov    %esp,%ebp
  10365a:	57                   	push   %edi
  10365b:	83 ec 24             	sub    $0x24,%esp
  10365e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103661:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103664:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  103668:	8b 45 08             	mov    0x8(%ebp),%eax
  10366b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10366e:	88 55 f7             	mov    %dl,-0x9(%ebp)
  103671:	8b 45 10             	mov    0x10(%ebp),%eax
  103674:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  103677:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  10367a:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10367e:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103681:	89 d7                	mov    %edx,%edi
  103683:	f3 aa                	rep stos %al,%es:(%edi)
  103685:	89 fa                	mov    %edi,%edx
  103687:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10368a:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  10368d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  103690:	83 c4 24             	add    $0x24,%esp
  103693:	5f                   	pop    %edi
  103694:	5d                   	pop    %ebp
  103695:	c3                   	ret    

00103696 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  103696:	55                   	push   %ebp
  103697:	89 e5                	mov    %esp,%ebp
  103699:	57                   	push   %edi
  10369a:	56                   	push   %esi
  10369b:	53                   	push   %ebx
  10369c:	83 ec 30             	sub    $0x30,%esp
  10369f:	8b 45 08             	mov    0x8(%ebp),%eax
  1036a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1036a5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1036ab:	8b 45 10             	mov    0x10(%ebp),%eax
  1036ae:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  1036b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1036b4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1036b7:	73 42                	jae    1036fb <memmove+0x65>
  1036b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1036bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1036bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1036c2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1036c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1036c8:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1036cb:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1036ce:	c1 e8 02             	shr    $0x2,%eax
  1036d1:	89 c1                	mov    %eax,%ecx
    asm volatile (
  1036d3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1036d6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1036d9:	89 d7                	mov    %edx,%edi
  1036db:	89 c6                	mov    %eax,%esi
  1036dd:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1036df:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1036e2:	83 e1 03             	and    $0x3,%ecx
  1036e5:	74 02                	je     1036e9 <memmove+0x53>
  1036e7:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1036e9:	89 f0                	mov    %esi,%eax
  1036eb:	89 fa                	mov    %edi,%edx
  1036ed:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1036f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  1036f3:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  1036f6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  1036f9:	eb 36                	jmp    103731 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  1036fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1036fe:	8d 50 ff             	lea    -0x1(%eax),%edx
  103701:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103704:	01 c2                	add    %eax,%edx
  103706:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103709:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10370c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10370f:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  103712:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103715:	89 c1                	mov    %eax,%ecx
  103717:	89 d8                	mov    %ebx,%eax
  103719:	89 d6                	mov    %edx,%esi
  10371b:	89 c7                	mov    %eax,%edi
  10371d:	fd                   	std    
  10371e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103720:	fc                   	cld    
  103721:	89 f8                	mov    %edi,%eax
  103723:	89 f2                	mov    %esi,%edx
  103725:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  103728:	89 55 c8             	mov    %edx,-0x38(%ebp)
  10372b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  10372e:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103731:	83 c4 30             	add    $0x30,%esp
  103734:	5b                   	pop    %ebx
  103735:	5e                   	pop    %esi
  103736:	5f                   	pop    %edi
  103737:	5d                   	pop    %ebp
  103738:	c3                   	ret    

00103739 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  103739:	55                   	push   %ebp
  10373a:	89 e5                	mov    %esp,%ebp
  10373c:	57                   	push   %edi
  10373d:	56                   	push   %esi
  10373e:	83 ec 20             	sub    $0x20,%esp
  103741:	8b 45 08             	mov    0x8(%ebp),%eax
  103744:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103747:	8b 45 0c             	mov    0xc(%ebp),%eax
  10374a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10374d:	8b 45 10             	mov    0x10(%ebp),%eax
  103750:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103753:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103756:	c1 e8 02             	shr    $0x2,%eax
  103759:	89 c1                	mov    %eax,%ecx
    asm volatile (
  10375b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10375e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103761:	89 d7                	mov    %edx,%edi
  103763:	89 c6                	mov    %eax,%esi
  103765:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103767:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10376a:	83 e1 03             	and    $0x3,%ecx
  10376d:	74 02                	je     103771 <memcpy+0x38>
  10376f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103771:	89 f0                	mov    %esi,%eax
  103773:	89 fa                	mov    %edi,%edx
  103775:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103778:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10377b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  10377e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103781:	83 c4 20             	add    $0x20,%esp
  103784:	5e                   	pop    %esi
  103785:	5f                   	pop    %edi
  103786:	5d                   	pop    %ebp
  103787:	c3                   	ret    

00103788 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  103788:	55                   	push   %ebp
  103789:	89 e5                	mov    %esp,%ebp
  10378b:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  10378e:	8b 45 08             	mov    0x8(%ebp),%eax
  103791:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103794:	8b 45 0c             	mov    0xc(%ebp),%eax
  103797:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  10379a:	eb 2e                	jmp    1037ca <memcmp+0x42>
        if (*s1 != *s2) {
  10379c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10379f:	0f b6 10             	movzbl (%eax),%edx
  1037a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1037a5:	0f b6 00             	movzbl (%eax),%eax
  1037a8:	38 c2                	cmp    %al,%dl
  1037aa:	74 18                	je     1037c4 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1037ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1037af:	0f b6 00             	movzbl (%eax),%eax
  1037b2:	0f b6 d0             	movzbl %al,%edx
  1037b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1037b8:	0f b6 00             	movzbl (%eax),%eax
  1037bb:	0f b6 c0             	movzbl %al,%eax
  1037be:	29 c2                	sub    %eax,%edx
  1037c0:	89 d0                	mov    %edx,%eax
  1037c2:	eb 18                	jmp    1037dc <memcmp+0x54>
        }
        s1 ++, s2 ++;
  1037c4:	ff 45 fc             	incl   -0x4(%ebp)
  1037c7:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  1037ca:	8b 45 10             	mov    0x10(%ebp),%eax
  1037cd:	8d 50 ff             	lea    -0x1(%eax),%edx
  1037d0:	89 55 10             	mov    %edx,0x10(%ebp)
  1037d3:	85 c0                	test   %eax,%eax
  1037d5:	75 c5                	jne    10379c <memcmp+0x14>
    }
    return 0;
  1037d7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1037dc:	c9                   	leave  
  1037dd:	c3                   	ret    
