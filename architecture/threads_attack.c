#include <pthread.h>
#include <stdio.h>

const int NUM_ITERS = 1000000;
const int NUM_THREADS = 2;

typedef struct
{
  int threadIdx;
  int *result;
} ThreadArgument;

void *thread_work(void *_argument)
{
  // Cast.
  ThreadArgument *threadArgument = (ThreadArgument *)_argument;

  for (int i = 0; i < NUM_ITERS; i++)
  {
    *(threadArgument->result) += 1;
  }

  return NULL;
}

int main()
{
  pthread_t threads[NUM_THREADS];
  int result = 0;

  ThreadArgument arg0 = {
      .threadIdx = 0,
      .result = &result};

  ThreadArgument arg1 = {
      .threadIdx = 1,
      .result = &result};

  pthread_create(&threads[0], NULL, thread_work, &arg0);
  pthread_create(&threads[1], NULL, thread_work, &arg1);

  pthread_join(threads[0], NULL);
  pthread_join(threads[1], NULL);

  printf("Result: %d\n", result);

  return 0;
}
