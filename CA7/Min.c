int A[10] = {1, 2, 42, 32, 12, 25, 43, 7, -45, 8};
int min = A[0];
for (int i = 1; i < 10; i++)
{
if (A[i] < min)
{
min = A[i];
}
}