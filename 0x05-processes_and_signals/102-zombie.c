#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>

/**
 * infinite_while - this is an infinite loop that keeps sleeping
 *
 * Return: (0) success everytime it runs
 */

int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}

	return (0);
}

/**
 * main - Entry point
 *
 * Return: (exit success)
 */

int main(void)
{
	pid_t pid;
	int count = 0;

	while (count < 5)
	{
		pid = fork();
		if (pid > 0)
		{
			printf("Zombie process created, PID: %d\n", pid);
			sleep(1);
			count++;
		}
		else
		{
			exit(0);
		}
	}
	infinite_while();
	return (EXIT_SUCCESS);
}
