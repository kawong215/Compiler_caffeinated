.class public count
.super java/lang/Object

.field private static _runTimer LRunTimer;
.field private static _standardIn LPascalTextIn;

; i:boba

.field private static i I

.method public <init>()V

	aload_0
	invokenonvirtual    java/lang/Object/<init>()V
	return

.limit locals 1
.limit stack 1
.end method

.method public static main([Ljava/lang/String;)V

	new RunTimer
	dup
	invokenonvirtual RunTimer/<init>()V
	putstatic        count/_runTimer LRunTimer;
	new PascalTextIn
	dup
	invokenonvirtual PascalTextIn/<init>()V
	putstatic        count/_standardIn LPascalTextIn;

; i=0

	ldc	0
	putstatic	count/i I

; BREW(RECEIPT('i = %d\n',i);i=i+1;)WHILE(i<11)

Label_1:

; RECEIPT('i = %d\n',i)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"i = %d\n"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	count/i I
	invokestatic	java/lang/Integer.valueOf(I)Ljava/lang/Integer;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; i=i+1

	getstatic	count/i I
	ldc	1
	iadd
	putstatic	count/i I

; 

	getstatic	count/i I
	ldc	11
	if_icmplt Label_1

	getstatic     count/_runTimer LRunTimer;
	invokevirtual RunTimer.printElapsedTime()V

	return

.limit locals 16
.limit stack 16
.end method
